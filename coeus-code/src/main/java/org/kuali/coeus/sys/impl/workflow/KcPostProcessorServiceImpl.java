/*
 * Copyright 2005-2014 The Kuali Foundation
 * 
 * Licensed under the Educational Community License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 * 
 * http://www.opensource.org/licenses/ecl1.php
 * 
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
package org.kuali.coeus.sys.impl.workflow;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.kuali.rice.kew.api.action.ActionTaken;
import org.kuali.rice.kew.api.action.ActionType;
import org.kuali.rice.kew.api.document.WorkflowDocumentService;
import org.kuali.rice.kew.api.exception.WorkflowException;
import org.kuali.rice.kew.framework.postprocessor.*;
import org.kuali.rice.krad.UserSession;
import org.kuali.rice.krad.service.PostProcessorService;
import org.kuali.rice.krad.util.GlobalVariables;
import org.kuali.rice.krad.util.KRADConstants;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;
import java.util.concurrent.Callable;

/**
 * A {@link PostProcessorService} to record the actual user performing an action on a workflow status change.
 */
@Component("kcPostProcessorService")
@Transactional
public class KcPostProcessorServiceImpl implements PostProcessorService {

    public static final String LAST_ACTION_PRINCIPAL_ID = "lastActionPrincipalId";

    private static final Log LOG = LogFactory.getLog(KcPostProcessorServiceImpl.class);

    @Autowired
    @Qualifier("kewWorkflowDocumentService")
    private WorkflowDocumentService workflowDocumentService;

    @Autowired
    @Qualifier("postProcessorService")
    private PostProcessorService postProcessorService;

    @Override
    public ProcessDocReport doRouteStatusChange(final DocumentRouteStatusChange statusChangeEvent) throws Exception {
        return GlobalVariables.doInNewGlobalVariables(establishPostProcessorUserSession(), new Callable<ProcessDocReport>() {
            @Override
            public ProcessDocReport call() throws Exception {
                establishLastActionPrincipalId(statusChangeEvent.getDocumentId());
                return postProcessorService.doRouteStatusChange(statusChangeEvent);
            }
        });
    }

    @Override
    public ProcessDocReport doRouteLevelChange(final DocumentRouteLevelChange levelChangeEvent) throws Exception {
        return GlobalVariables.doInNewGlobalVariables(establishPostProcessorUserSession(), new Callable<ProcessDocReport>() {
            @Override
            public ProcessDocReport call() throws Exception {
                establishLastActionPrincipalId(levelChangeEvent.getDocumentId());
                return postProcessorService.doRouteLevelChange(levelChangeEvent);
            }
        });
    }

    @Override
    public ProcessDocReport doDeleteRouteHeader(DeleteEvent event) throws Exception {
        return postProcessorService.doDeleteRouteHeader(event);
    }

    @Override
    public ProcessDocReport doActionTaken(final ActionTakenEvent event) throws Exception {
        return GlobalVariables.doInNewGlobalVariables(establishPostProcessorUserSession(), new Callable<ProcessDocReport>() {
            @Override
            public ProcessDocReport call() throws Exception {
                establishLastActionPrincipalId(event.getDocumentId());
                return postProcessorService.doActionTaken(event);
            }
        });
    }

    @Override
    public ProcessDocReport afterActionTaken(ActionType actionPerformed, ActionTakenEvent event) throws Exception {
        return postProcessorService.afterActionTaken(actionPerformed, event);
    }

    @Override
    public ProcessDocReport beforeProcess(BeforeProcessEvent processEvent) throws Exception {
        return postProcessorService.beforeProcess(processEvent);
    }

    @Override
    public ProcessDocReport afterProcess(AfterProcessEvent processEvent) throws Exception {
        return postProcessorService.afterProcess(processEvent);
    }

    @Override
    public List<String> getDocumentIdsToLock(DocumentLockingEvent lockingEvent) throws Exception {
        return postProcessorService.getDocumentIdsToLock(lockingEvent);
    }

    /**
     * This finds the last workflow action taken on the Document that corresponds to the passed in event.  It then finds
     * the principal who triggered that event and places the principal id in a {@link GlobalVariables#getUserSession()}.
     * Once in the UserSession, the principal Id can be used with in any workflow callbacks.
     *
     * @param routeHeaderId the route header id (document id)
     */
    protected void establishLastActionPrincipalId(final String routeHeaderId) {

        final ActionTaken lastActionTaken = findLastActionTaken(routeHeaderId);

        if (lastActionTaken != null) {
            GlobalVariables.getUserSession().addObject(LAST_ACTION_PRINCIPAL_ID, lastActionTaken.getPrincipalId());
        }
    }

    /**
     * Finds the last action taken on a Document.
     * @param routeHeaderId the route header id (document id)
     * @return the last action taken or null if non could be found.
     */
    protected ActionTaken findLastActionTaken(String routeHeaderId) {
        final List<ActionTaken> actionsTaken = workflowDocumentService.getActionsTaken(routeHeaderId);

        if (actionsTaken != null) {
            ActionTaken lastActionTaken = null;
            for (ActionTaken actionTaken : actionsTaken) {
                if (lastActionTaken == null || actionTaken.getActionDate().toDate().after(lastActionTaken.getActionDate().toDate())) {
                    lastActionTaken = actionTaken;
                }
            }
            return lastActionTaken;
        }
        return null;
    }

    /* Replicating utilitity methods from rice post processor service */
    protected UserSession establishPostProcessorUserSession() throws WorkflowException {
        if (GlobalVariables.getUserSession() == null) {
            return new UserSession(KRADConstants.SYSTEM_USER);
        } else {
            return GlobalVariables.getUserSession();
        }
    }

    public void setWorkflowDocumentService(WorkflowDocumentService workflowDocumentService) {
        this.workflowDocumentService = workflowDocumentService;
    }

    public void setPostProcessorService(PostProcessorService postProcessorService) {
        this.postProcessorService = postProcessorService;
    }

    public WorkflowDocumentService getWorkflowDocumentService() {
        return workflowDocumentService;
    }

    public PostProcessorService getPostProcessorService() {
        return postProcessorService;
    }
}
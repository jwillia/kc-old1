/*
 * Kuali Coeus, a comprehensive research administration system for higher education.
 * 
 * Copyright 2005-2015 Kuali, Inc.
 * 
 * This program is free software: you can redistribute it and/or modify
 * it under the terms of the GNU Affero General Public License as
 * published by the Free Software Foundation, either version 3 of the
 * License, or (at your option) any later version.
 * 
 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU Affero General Public License for more details.
 * 
 * You should have received a copy of the GNU Affero General Public License
 * along with this program.  If not, see <http://www.gnu.org/licenses/>.
 */
package org.kuali.kra.protocol.actions.correction;

import org.apache.commons.lang3.StringUtils;
import org.kuali.coeus.sys.framework.rule.KcBusinessRule;
import org.kuali.coeus.sys.framework.rule.KcDocumentEventBaseExtension;
import org.kuali.kra.protocol.ProtocolDocumentBase;

/**
 * The event that occurs when the ProtocolBase Administrator assigns reviewers to a protocol.
 */
public abstract class ProtocolAdminCorrectionEventBase extends KcDocumentEventBaseExtension {
    
    private static final org.apache.commons.logging.Log LOG = org.apache.commons.logging.LogFactory.getLog(ProtocolAdminCorrectionEventBase.class);
    
    private AdminCorrectionBean actionBean;
    private String propertyName;
    
    public ProtocolAdminCorrectionEventBase(ProtocolDocumentBase document, String propertyName, AdminCorrectionBean actionBean) {
        super("Administrative Correction for document " + getDocumentId(document), "", document);
        this.actionBean = actionBean;
        this.propertyName = propertyName;
        logEvent();
    }

    @Override
    protected void logEvent() {
        StringBuffer logMessage = new StringBuffer(StringUtils.substringAfterLast(this.getClass().getName(), "."));
        logMessage.append(" with ");

        if (this.actionBean == null) {
            logMessage.append("null actionBean");
        }
        else {
            logMessage.append(actionBean.toString());
        }

        LOG.debug(logMessage);
    }

    public ProtocolDocumentBase getProtocolDocument() {
        return (ProtocolDocumentBase) getDocument();
    }
    
    public String getPropertyName() {
        return propertyName;
    }
    
    public AdminCorrectionBean getAdminCorrectionBean() {
        return actionBean;
    }

    public abstract KcBusinessRule getRule();

}

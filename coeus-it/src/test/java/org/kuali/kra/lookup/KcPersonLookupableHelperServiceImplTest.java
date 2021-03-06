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
package org.kuali.kra.lookup;

import org.jmock.Expectations;
import org.jmock.Mockery;
import org.jmock.integration.junit4.JUnit4Mockery;
import org.jmock.lib.concurrent.Synchroniser;
import org.junit.After;
import org.junit.Before;
import org.junit.Test;
import org.kuali.coeus.common.framework.person.KcPerson;
import org.kuali.coeus.common.impl.person.KcPersonLookupableHelperServiceImpl;
import org.kuali.kra.infrastructure.Constants;
import org.kuali.coeus.common.framework.multicampus.MultiCampusConstants;
import org.kuali.kra.test.infrastructure.KcIntegrationTestBase;
import org.kuali.rice.coreservice.framework.parameter.ParameterService;
import org.kuali.rice.kns.web.ui.Field;
import org.kuali.rice.kns.web.ui.Row;
import org.kuali.rice.krad.util.GlobalVariables;
import org.kuali.rice.location.impl.campus.CampusBo;

import java.util.List;
import static org.junit.Assert.*;
public class KcPersonLookupableHelperServiceImplTest extends KcIntegrationTestBase {
    
    private static final int LOOKUP_CRITERIA_FIELD_COUNT = 9;
    private static final String CAMPUS_CODE_FIELD = "code";
    private static final String CAMPUS_LOOKUPABLE_CLASS_NAME = CampusBo.class.getName();
    
    private static final String CAMPUS_CODE = "BL";
    
    private KcPersonLookupableHelperServiceImpl service;
    
    private Mockery context = new JUnit4Mockery() {{ setThreadingPolicy(new Synchroniser()); }};
    
    @Before
    public void setUp() throws Exception {

        service = new KcPersonLookupableHelperServiceImpl();
    }

    @After
    public void tearDown() throws Exception {

        service = null;
    }
    
    @Test
    public void testNonMultiCampusRows() {
        service.setBusinessObjectClass(KcPerson.class);
        service.setParameterService(getMockParameterService(false));
        GlobalVariables.getUserSession().addObject(MultiCampusConstants.USER_CAMPUS_CODE_KEY, (Object) CAMPUS_CODE);
        
        List<Row> rows = service.getRows();
        assertEquals(LOOKUP_CRITERIA_FIELD_COUNT, rows.size());
        for (Row row : rows) {
            for (Field field : row.getFields()) {
                if (field.getPropertyName().equals(CAMPUS_CODE_FIELD)) {
                    assertFieldProperties(field, CAMPUS_CODE_FIELD, CAMPUS_LOOKUPABLE_CLASS_NAME);
                    assertEquals(Constants.EMPTY_STRING, field.getPropertyValue());
                }
            }
        }
    }
    
    @Test
    public void testMultiCampusRows() {
        service.setBusinessObjectClass(KcPerson.class);
        service.setParameterService(getMockParameterService(true));
        GlobalVariables.getUserSession().addObject(MultiCampusConstants.USER_CAMPUS_CODE_KEY, (Object) CAMPUS_CODE);
        
        List<Row> rows = service.getRows();
        assertEquals(LOOKUP_CRITERIA_FIELD_COUNT, rows.size());
        for (Row row : rows) {
            for (Field field : row.getFields()) {
                if (field.getPropertyName().equals(CAMPUS_CODE_FIELD)) {
                    assertFieldProperties(field, CAMPUS_CODE_FIELD, CAMPUS_LOOKUPABLE_CLASS_NAME);
                    assertEquals(CAMPUS_CODE, field.getPropertyValue());
                }
            }
        }
    }
    
    private void assertFieldProperties(Field field, String keyName, String className) {
        assertEquals(field.getFieldConversions(), keyName + Constants.COLON + field.getPropertyName());
        assertTrue(field.isFieldDirectInquiryEnabled());
        assertEquals(field.getLookupParameters(), field.getPropertyName() + Constants.COLON + keyName);
        assertEquals(field.getInquiryParameters(), field.getPropertyName() + Constants.COLON + keyName);
        assertEquals(field.getQuickFinderClassNameImpl(), className);
    }
    
    private ParameterService getMockParameterService(final boolean multiCampusEnabled) {
        final ParameterService service = context.mock(ParameterService.class);
        
        context.checking(new Expectations() {{
            allowing(service).getParameterValueAsBoolean(
                Constants.KC_GENERIC_PARAMETER_NAMESPACE, Constants.KC_ALL_PARAMETER_DETAIL_TYPE_CODE, MultiCampusConstants.PARAMETER_MULTI_CAMPUS_ENABLED);
            will(returnValue(multiCampusEnabled));
        }});
        
        return service;
    }

}

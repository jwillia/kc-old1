  <%--
 Copyright 2005-2006 The Kuali Foundation.

 Licensed under the Educational Community License, Version 1.0 (the "License");
 you may not use this file except in compliance with the License.
 You may obtain a copy of the License at

 http://www.opensource.org/licenses/ecl1.php

 Unless required by applicable law or agreed to in writing, software
 distributed under the License is distributed on an "AS IS" BASIS,
 WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 See the License for the specific language governing permissions and
 limitations under the License.
--%>
<%@ include file="/WEB-INF/jsp/proposalPerson.jsp"%>

<c:set var="personUnitAttributes" value="${DataDictionary.ProposalPersonUnit.attributes}" />
<c:set var="unitAttributes" value="${DataDictionary.Unit.attributes}" />
<bean:define id="proposalPersonUnits" name="KualiForm" property="${proposalPerson}.units" />

            <table cellpadding=0 cellspacing="0" summary="">
                <tbody id="G3">
                  <tr>
                    <th width="10%">&nbsp;</th>
                    <kul:htmlAttributeHeaderCell attributeEntryName="DataDictionary.Unit.attributes.unitName" />
                    <kul:htmlAttributeHeaderCell attributeEntryName="DataDictionary.Unit.attributes.unitNumber" />

                    <th>&nbsp;</th>
                  </tr>
                  <tr>
                    <th scope="row">add:</th>
                    <td class="infoline"><div align=left> (select)
                      <kul:htmlControlAttribute attributeEntry="${unitAttributes}" property="newProposalPersonUnit.unitName" readOnly="true" />
                      <kul:lookup boClassName="org.kuali.kra.bo.Unit" fieldConversions="unitNumber:newProposalPersonUnit.unitNumber,unitName:newProposalPersonUnit.unitName" />
                      </div>
                        <span class="fineprint"></span> </td>

                    <td class="infoline"><div align=left>
                      <kul:htmlControlAttribute attributeEntry="${unitAttributes}" property="newProposalPersonUnit.unitNumber" readOnly="true"/>
                      </div>
                        <span class="fineprint"></span> </td>
                    <td class="infoline"><div align=center><html:image property="methodToCall.insertUnit" src="${ConfigProperties.kr.externalizable.images.url}tinybutton-add1.gif" title="Add Unit" alt="Add Unit" styleClass="tinybutton"/></div></td>
                  </tr>
  <c:forEach items="${proposalPersonUnits}" varStatus="status">
                  <tr>
                    <th scope="row"><c:out value="${status.index}" /></th>

                    <td><kul:htmlControlAttribute attributeEntry="${unitAttributes.unitName}" property="${proposalPerson}.units[${status.index}].unit.unitName" readOnly="true" /></td>
                    <td><kul:htmlControlAttribute attributeEntry="${unitAttributes.unitNumber}" property="${proposalPerson}.units[${status.index}].unitNumber" readOnly="true" /></td>
                    <td><div align=center><html:image property="methodToCall.deleteUnit" src="${ConfigProperties.kr.externalizable.images.url}tinybutton-add1.gif" title="Remove Unit" alt="Remove Unit" styleClass="tinybutton"/></div></td>
                  </tr>
  </c:forEach>
                </tbody>
              </table>

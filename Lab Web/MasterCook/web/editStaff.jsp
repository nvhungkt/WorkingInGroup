<%-- 
    Document   : editStaff
    Created on : Sep 30, 2017, 7:23:33 PM
    Author     : Administrator
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="/struts-tags" prefix="s"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Edit staff</title>
    </head>
    <body>
        <s:include value="header.jsp"/>
        <div class="col-md-6 col-md-offset-3 center-form">
            <h2>Edit Staff Information</h2><br/>
            <form action="editStaffConfirm" method="POST">
                <input type="hidden" name="staffID" value="<s:property value="staffID"/>"/>
                <table class="table">
                <thead>

                </thead>
                <tbody>
                    <tr>
                        <td>Full name:</td>
                        <td><input type="text" name="name" 
                                   value="<s:property value="staff.name"/>"/></td>
                    </tr>
                    <tr>
                        <td>Phone:</td>
                        <td><input type="text" name="phone" value="<s:property value="staff.phone"/>"/></td>
                    </tr>
                    <tr>
                        <td>Email:</td>
                        <td><input type="text" name="email" value="<s:property value="staff.email"/>"/></td>
                    </tr>
                    <tr>
                        <td>Birthday:</td>
                        <td><input type="date" name="birthday" value="<s:property value="staff.birthdayStr"/>"/></td>
                    </tr>
                    <tr>
                        <td>Address:</td>
                        <td><input type="text" name="address" value="<s:property value="staff.address"/>"/></td>
                    </tr>
                    <tr>
                        <td>Gender:</td>
                        <td>
                            <font><input type="radio" name="gender"
                                   <s:if test="%{staff.gender == 'male'}">
                                       checked="checked"
                                   </s:if>
                                   value="male"/>Male
                            </font>
                            
                            <font><input type="radio" name="gender"
                                   <s:if test="%{staff.gender == 'female'}">
                                       checked="checked"
                                   </s:if>
                                   value="female"/>Female
                            </font>
                        </td>
                    </tr>
                    <tr>
                        <td>Working categories:</td>
                        <td>
                            <s:iterator var="subcate" value="%{allSubcategories}" status="counter">
                                <font><input type="checkbox" name="workingSubcategories"
                                             value="<s:property value="%{#subcate.subcategoryID}"/>"
                                             <s:iterator var="wkSubCate" value="%{workingSubcategories}" status="counter">
                                                 <s:if test="%{#subcate.subcategoryID == #wkSubCate.key}">checked="checked"</s:if>
                                             </s:iterator>
                                             /><s:property value="%{#subcate.name}"/>
                                </font>
                                <s:if test="%{#counter.count % 2 == 0}">
                                    <br/>
                                </s:if>
                            </s:iterator>
                        </td>
                    </tr>
                </tbody>
                </table><br/>
                <div class="col-md-8 col-md-offset-4">
                    <button type="button" class="btn">
                        <a href="viewStaffInfo?staffID=<s:property value="staffID"/>">
                            Cancel
                        <a/>
                    </button>
                    <input type="submit" class="btn btn-success" value="Confirm"/>
                </div>
            </form>
        </div>
    </body>
</html>

<%-- 
    Document   : createStaff
    Created on : Sep 30, 2017, 7:24:51 PM
    Author     : Administrator
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="/struts-tags" prefix="s"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <s:include value="header.jsp"/>
        <div class="col-md-6 col-md-offset-3 center-form">
            <h2>Create New Staff</h2>
            <label class="label label-danger"><s:property value="%{error}"/></label><br/><br/>
            <form action="createStaffConfirm" method="POST">
                <table class="table">
                <tbody>
                    <tr>
                        <td>Username:</td>
                        <td><input type="text" name="username" value="<s:property value="%{username}"/>"/></td>
                    </tr>
                    <tr>
                        <td>Full name:</td>
                        <td><input type="text" name="name" value="<s:property value="%{name}"/>"/></td>
                    </tr>
                    <tr>
                        <td>Phone:</td>
                        <td><input type="text" name="phone" value="<s:property value="%{phone}"/>"/></td>
                    </tr>
                    <tr>
                        <td>Email:</td>
                        <td><input type="text" name="email" value="<s:property value="%{email}"/>"/></td>
                    </tr>
                    <tr>
                        <td>Birthday:</td>
                        <td><input type="date" name="birthday" value="<s:property value="%{birthday}"/>"/></td>
                    </tr>
                    <tr>
                        <td>Address:</td>
                        <td><input type="text" name="address" value="<s:property value="%{address}"/>"/></td>
                    </tr>
                    <tr>
                        <td>Gender:</td>
                        <td>
                            <font><input type="radio" name="gender" value="male"
                                         <s:if test="%{gender == 'male'}">checked="checked"</s:if>
                                         />Male</font>
                            <font><input type="radio" name="gender" value="female"
                                         <s:if test="%{gender == 'female'}"> checked="checked"</s:if>
                                         />Female</font>
                        </td>
                    </tr>
                    <tr>
                        <td>Working categories:</td>
                        <td>
                            <s:iterator var="subcate" value="%{allSubcategories}" status="counter">
                                <font><input type="checkbox" name="workingSubcategories"
                                       value="<s:property value="%{#subcate.subcategoryID}"/>"/>
                                    <s:property value="%{#subcate.name}"/>
                                </font>
                                <s:if test="%{#counter.count % 2 == 0}">
                                    <br/>
                                </s:if>
                            </s:iterator>
                        </td>
                    </tr>
                    <tr>
                        <td>Role:</td>
                        <td>
                            <select name="role" class="form-control">
                                <option value="Collaborator">Collaborator</option>
                                <option value="Employee">Employee</option>
                                <option value="Manager">Manager</option>
                            </select>
                        </td>
                    </tr>
                </tbody>
                </table><br/>
                <div class="col-md-8 col-md-offset-4">
                    <button type="button" class="btn" onclick="goBack()">
                        Cancel
                    </button>
                    <script>
                        function goBack() {
                            window.history.back();
                        }
                    </script>
                    <input type="submit" class="btn btn-success" value="Create"/>
                </div>
            </form>
        </div>
    </body>
</html>
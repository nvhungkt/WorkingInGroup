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
        <h1>Create New Staff</h1>
        <form action="createStaffConfirm" method="POST">
            <table border="0">
            <tbody>
                <tr>
                    <td>Username:</td>
                    <td><input type="text" name="username"/></td>
                </tr>
                <tr>
                    <td>Full name:</td>
                    <td><input type="text" name="name"/></td>
                </tr>
                <tr>
                    <td>Phone:</td>
                    <td><input type="text" name="phone"/></td>
                </tr>
                <tr>
                    <td>Email:</td>
                    <td><input type="text" name="email"/></td>
                </tr>
                <tr>
                    <td>Birthday:</td>
                    <td><input type="date" name="birthday"/></td>
                </tr>
                <tr>
                    <td>Address:</td>
                    <td><input type="text" name="address"/></td>
                </tr>
                <tr>
                    <td>Gender:</td>
                    <td>
                        <input type="radio" name="gender" value="male"/>Male
                        <input type="radio" name="gender" value="female"/>Female
                    </td>
                </tr>
                <tr>
                    <td>Working categories:</td>
                    <td>
                        <s:iterator var="subcate" value="%{allSubcategories}" status="counter">
                            <input type="checkbox" name="workingSubcategories"
                                   value="<s:property value="%{#subcate.subcategoryID}"/>"/>
                            <s:property value="%{#subcate.name}"/>
                            <s:if test="%{#counter.count % 2 == 0}">
                                <br/>
                            </s:if>
                        </s:iterator>
                    </td>
                </tr>
                <tr>
                    <td>Role:</td>
                    <td>
                        <select name="role">
                            <option value="Collaborator">Collaborator</option>
                            <option value="Employee">Employee</option>
                            <option value="Manager">Manager</option>
                        </select>
                    </td>
                </tr>
            </tbody>
            </table><br/>
            <input type="submit" value="Create"/>
        </form>
    </body>
</html>
<%-- 
    Document   : editStaff
    Created on : Sep 30, 2017, 7:23:33 PM
    Author     : Administrator
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="/struts-tags" prefix="c"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Edit staff</title>
    </head>
    <body>
        <h1>Edit Staff Information</h1>
        <form action="editStaff" method="POST">
            <table border="0">
            <thead>
                
            </thead>
            <tbody>
                <tr>
                    <td>Full name:</td>
                    <td><s:property value="%{#staff.name}"/></td>
                </tr>
                <tr>
                    <td>Username:</td>
                    <td><s:property value="%{#staff.username}"/></td>
                </tr>
                <tr>
                    <td>Phone:</td>
                    <td><s:property value="%{#staff.phone}"/></td>
                </tr>
                <tr>
                    <td>Email:</td>
                    <td><s:property value="%{#staff.email}"/></td>
                </tr>
                <tr>
                    <td>Address:</td>
                    <td><s:property value="%{#staff.address}"/></td>
                </tr>
                <tr>
                    <td>Gender:</td>
                    <td><s:property value="%{#staff.gender}"/></td>
                </tr>
                <tr>
                    <td>Working categories:</td>
                    <td>
                        <s:iterator var="wsNames" value="%{workingSubcategories}" status="counter">
                            <s:property value="%{#wsNames}"/>
                            <s:if test="%{#counter.count % 2 == 0}">
                                <br/>
                            </s:if>
                        </s:iterator>
                    </td>
                </tr>
                <tr>
                    <td>Role:</td>
                    <td><s:property value="%{#staff.gender}"/></td>
                </tr>
            </tbody>
        </table><br/>
        <input type="submit" value="Edit" name="btnEdit"/>
        </form>
    </body>
</html>

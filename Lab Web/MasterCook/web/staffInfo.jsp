<%-- 
    Document   : staffInfo
    Created on : Sep 30, 2017, 7:24:27 PM
    Author     : Administrator
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="/struts-tags" prefix="s"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Staff info</title>
    </head>
    <body>
        <s:include value="header.jsp"/>
        <s:set var="staff" value="%{#session.STAFF}"/>
        <h1>Staff information</h1>
        <form action="editStaff">
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
        <s:if test="%{#staff.role == 'Manager' or #staff.role == 'Administrator'}">
            <input type="submit" value="Edit" name="btnEdit"/>
        </s:if>
        </form>
        <s:include value="footer.html"/>
    </body>
</html>

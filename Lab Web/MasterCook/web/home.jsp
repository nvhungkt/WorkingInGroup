<%-- 
    Document   : home
    Created on : Sep 30, 2017, 5:45:14 PM
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
        <s:set var="staff" value="%{#session.STAFF}"/>
        <h1>Home Page</h1>
        Welcome, <s:property value="%{#staff.name}"/>
    </body>
</html>

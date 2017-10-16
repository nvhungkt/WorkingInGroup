<%-- 
    Document   : aboutUs
    Created on : Oct 14, 2017, 5:49:51 PM
    Author     : Administrator
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="/struts-tags" prefix="s"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>MasterCook</title>
    </head>
    <body>
        <s:include value="header.jsp"/>
        <h1>About Us</h1>
        <div style="width: 100%"><object data="Articles/about us.txt" style="width: 100%"></object></div>
        <s:include value="footer.html"/>
    </body>
</html>

<%-- 
    Document   : login
    Created on : Sep 30, 2017, 5:45:25 PM
    Author     : Administrator
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="/struts-tags" prefix="s"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Login</title>
    </head>
    <body>
        <h1>Login Page</h1>
        <%--<s:if test="%{username != null}">
           Invalid username or password"<br/>
        </s:if>--%>
        <form action="login" method="POST">
            <font color="red">
                <s:property value="%{message}"/><br/>
            </font>
            Username<br/>
            <s:textfield name="txtUsername" value="%{txtUsername}"/><br/>
            Password<br/>
            <s:password name="txtPassword" value=""/><br/>
            <input type="submit" value="Sign in" />
        </form>
        
    </body>
</html>

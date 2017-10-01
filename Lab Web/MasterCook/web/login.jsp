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
            <!--Username<br/>
            <input type="text" name="txtUsername" value=""/><br/>
            <!--Password<br/>
            <input type="password" name="txtPassword" value="" /><br/>-->
            <s:set var="msg" value="%{message%}"/>
            <%--<s:if test="%{message == 'Invalid username or password!!!'}">--%>
                <s:property value="%{message}"/>
            <%--</s:if>--%><br/>
            Username<br/>
            <s:textfield name="txtUsername" value="%{txtUsername}"/>
            <s:if test="%{#msg == 'Username is required!!!'}">
                <s:property value="%{#msg}"/>
            </s:if><br/>
            Password<br/>
            <s:password name="txtPassword" value=""/>
            <s:if test="%{#msg == 'Password is required!!!'}">
                <s:property value="%{#msg}"/>
            </s:if><br/>
            <input type="submit" value="Sign in" />
        </form>
        
    </body>
</html>

<%-- 
    Document   : invalid
    Created on : Oct 1, 2017, 6:15:36 AM
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
        <s:if test="%{txtUsername != null and txtPassword != null and txtUsername != '' and txtPassword != '' and dto == null}">
            <font color="red">Invalid username or password</font><br/>
        </s:if>
        <form action="login" method="POST">
            Username<br/>
            <!--<input type="text" name="txtUsername" value=""/><br/>-->
            <s:textfield name="txtUsername" value="%{txtUsername}"/>
            <s:if test="%{txtUsername == null or txtUsername == ''}">
                <font color="red">Username is required</font>
            </s:if><br/>
            Password<br/>
            <!--<input type="password" name="txtPassword" value="" /><br/>-->
            <s:password name="txtPassword" value=""/><br/>
            <s:if test="%{txtUsername != null and txtUsername != ''}">
                <s:if test="%{txtPassword == null or txtPassword == ''}">
                    Password is required<br/>
                </s:if>
            </s:if>
            
            <input type="submit" value="Sign in" />
        </form>
    </body>
</html>

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
        <link href="bootstrap/css/bootstrap.min.css" rel="stylesheet">
        <link rel="stylesheet" type="text/css" href="css/OurCss.css"/>
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
        <script src="bootstrap/js/bootstrap.min.js"></script>
    </head>
    <body>
        <div class="col-md-4 col-md-offset-4" id="loginFormContainer">
            <h1 class="labelLogin">ACCOUNT LOGIN</h1>
            <hr>
            <form action="login" method="POST" class="loginForm">
                <div class="form-group">
                    <font color="red">
                        <s:property value="%{message}"/><br/>
                    </font>
                    <label for="inputUsername">Username</label><br/>
                    <input type="text" class="form-control" class="rounded" name="txtUsername" value="<s:property value="%{txtUsername}"/>" placeholder="Username"/>
                </div>
                <div class="form-group">
                    <label for="inputPassword">Password</label><br/>
                    <input type="password" class="form-control" class="rounded" name="txtPassword" value="" placeholder="Password"/>
                </div>
                <input type="submit" class="btn btn-primary" value="Login" id="loginButton" />
            </form>
        </div>
    </body>
</html>

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
        <s:include value="header.jsp"/>
        <div class="col-md-4 col-md-offset-4 center-form">
            <h1>ACCOUNT LOGIN</h1>
            <hr>
            <form action="login" method="POST">
                <div class="form-group">
                    <font color="red">
                        <s:property value="%{message}"/><br/>
                    </font>
                    <label>Username</label>
                    <input type="text" class="form-control rounded" name="txtUsername" value="<s:property value="%{txtUsername}"/>" placeholder="Username"/>
                </div>
                <div class="form-group">
                    <label>Password</label>
                    <input type="password" class="form-control rounded" name="txtPassword" value="" placeholder="Password"/>
                </div>
                <br/>
                <input type="submit" class="btn btn-info btn-block" value="Login"/>
            </form>
        </div>
    </body>
</html>

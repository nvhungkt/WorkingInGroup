<%-- 
    Document   : changePassword
    Created on : Oct 1, 2017, 6:10:03 PM
    Author     : Turtle
--%>
<%@taglib prefix="s" uri="/struts-tags" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Change Password</title>
    </head>
    <body>      
        <s:include value="header.jsp"/>
        <div class="container col-md-4 col-md-offset-4 center-form">  
            <h1>Change Password</h1>
            <hr/><br/>
            <form action="changePass" method="POST">                
                <div class="form-group">
                    <label>Old Password</label>
                    <input type="password" name="oldPassword" placeholder="Old Password" class="form-control"/>
                </div>
                <div class="form-group">
                    <label>New Password</label>
                    <input type="password" name="newPassword" placeholder="New Password" class="form-control"/>
                </div>
                <div class="form-group">
                    <label>Confirm Password</label>
                    <input type="password" name="confirmPassword" placeholder="Confirm Password" class="form-control"/>
                </div>
                <br/>
                <button class="btn" type="submit" style="float: right">Confirm</button>
            </form>
            <s:if test="%{message != null}">
                <font color="red">
                <s:property value="%{message}"/>
                </font>                
            </s:if>
        </div>       
    </body>
</html>

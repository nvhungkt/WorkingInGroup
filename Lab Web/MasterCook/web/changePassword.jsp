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
        <link rel="stylesheet" href="bootstrap/css/bootstrap.min.css">
        <script src="bootstrap/js/bootstrap.min.js"></script>
        <link rel="stylesheet" href="css/OurCss.css">       
    </head>
    <body>      
        <s:include value="header.jsp"/>
        <div class="container col-md-4" style="background-color: white; margin-left: 33vw; margin-bottom: 5vw; margin-top: 5vw">  
            <div class="col-md-12">
                <h1 style="margin-bottom: 3vw" class="col-md-12">Change Password</h1>
                <form action="changePass" method="POST">                
                    <div class="form-group">                
                        Old Password </br>
                        <input type="password" name="oldPassword" value="" class="form-control"/></br>
                        New Password </br>
                        <input type="password" name="newPassword" value="" class="form-control"/></br>
                        Confirm Password </br>
                        <input type="password" name="confirmPassword" value="" class="form-control"/>          
                        </br>
                        <button class="btn" type="submit" style="float: right">Confirm</button>                
                    </div>                                        
                </form>
            </div>
            <s:if test="%{message != null}">
                <font color="red">
                <s:property value="%{message}"/>
                </font>                
            </s:if>
        </div>       
    </body>
</html>

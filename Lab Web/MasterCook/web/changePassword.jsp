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
        <h1>Change Password</h1>
        <s:form action="changePass">                        
            <s:password name="oldPassword" label="Old Password"/>                        
            <s:password name="newPassword" label="New Password"/>
            <s:password name="confirmPassword" label="Confirm Password"/>           
            <s:submit value="Confirm"/>
        </s:form>
        <s:if test="%{message != null}">
            <font color="red">
                <s:property value="%{message}"/>
            </font>                
        </s:if>
        
       
    </body>
</html>

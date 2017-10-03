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
                <%--Start top menu --%>
        <div id="menu">
            <ul>            
                <li> <a href="home.jsp">Home Page</a></li>
                <li> <a href="">Food News</a></li>
                <li><a href="">Recipes</a></li>
                <li><a href="">Restaurants</a></li>
                <li><a href="">About Us</a></li>
                <li><a href="">Contact</a></li>
                <s:if test="%{#session.STAFF != null}">
                    <li>
                        Welcome, <s:property value="%{#session.STAFF.name}"/>
                        <ul>
                            <li><a href="">View Information</a></li>
                            
                            
                            
                            <li><a href="changePassword.jsp">Edit Password</a></li>
                            <s:if test="%{#session.STAFF.role == 'Collaborator'}">
                                <li><a href="">Write New Articles</a></li>
                                <li><a href="">View My Articles</a></li>
                            </s:if>
                            <s:if test="%{#session.STAFF.role == 'Employee'}">
                                <li><a href="">Browse Articles</a></li>                                
                            </s:if>    
                                <s:if test="%{#session.STAFF.role == 'Manager'}">
                                <li><a href="">Browse Articles</a></li>
                                <li><a href="">View Employees</a></li>
                                <li><a href="">View Collaborators</a></li>
                                <li><a href="">Create New Staffs</a></li>                                
                            </s:if>
                                <s:if test="%{#session.STAFF.role == 'Administrator'}">
                                <li><a href="">View Employees</a></li>
                                <li><a href="">View Collaborators</a></li>
                                <li><a href="">Create New Staffs</a></li>                                
                                <li><a href="">Add Category</a></li>
                                <li><a href="">Modify Category</a></li>
                                <li><a href="">Make Statistics</a></li>
                            </s:if>
                            <s:url var="logoutLink" value="logout"/>
                            <li><s:a href="%{logoutLink}">Log out</s:a></li>                        
                        </ul>
                    </li>
                </s:if>                
            </ul>
        </div>
         <%--End top menu --%>
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

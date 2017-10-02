<%-- 
    Document   : home
    Created on : Sep 30, 2017, 5:45:14 PM
    Author     : Administrator
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="/struts-tags" prefix="s"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>MasterCook</title>
        
        <script type="text/javascript">
            function resizeIframe(obj){
               obj.style.height = obj.contentWindow.document.body.scrollHeight + 25 + 'px';
            }
        </script>
        
    </head>
    <body>
        <s:set var="staff" value="%{#session.STAFF}"/>
        <h1>Home Page</h1>
        Welcome, <s:property value="%{#staff.name}"/><br/>
        
        <!-- menu bar-->
        <div id="menu">
            <ul>            
                <li><a href="home.jsp">Home Page</a></li>
                <li><a href="">Food News</a></li>
                <li><a href="">Recipes</a></li>
                <li><a href="">Restaurants</a></li>
                <li><a href="">About Us</a></li>
                <li><a href="">Contact</a></li>
                <s:if test="%{#staff != null}">
                    <li>
                        Welcome, <s:property value="%{#staff.name}"/>
                        <ul>
                            <!-- dung chung -->
                            <li> <!-- view own information -->
                                <s:url var="staffInfoLnk" value="viewStaffInfo">
                                    <s:param name="staffID" value="%{#staff.staffID}"/>
                                </s:url>
                                <s:a href="%{#staffInfoLnk}">View information</s:a><br/>
                            </li>
                            <li> <!-- edit this account's password -->
                                <a href="">Edit Password</a>
                            </li>
                            
                            <!-- phan theo role -->
                            <!-- role: collaborator -->
                            <s:if test="%{#staff.role == 'Collaborator'}">
                                <li><a href="">Write New Articles</a></li>
                                <li><a href="">View My Articles</a></li>
                            </s:if>
                            
                            <!-- role: employee -->
                            <s:if test="%{#staff.role == 'Employee'}">
                                <li><a href="">Browse Articles</a></li>                                
                            </s:if>    
                                
                            <!-- role: manager -->
                            <s:if test="%{#staff.role == 'Manager'}">
                                <li><a href="">Browse Articles</a></li>
                                <li><a href="">View Employees</a></li>
                                <li><a href="">View Collaborators</a></li>
                                <li><a href="">Create New Staffs</a></li>                                
                            </s:if>
                                
                            <!-- role: administrator --> 
                            <s:if test="%{#staff.role == 'Administrator'}">
                                <li><a href="">View Employees</a></li>
                                <li><a href="">View Collaborators</a></li>
                                <li><a href="">Create New Staffs</a></li>                                
                                <li><a href="">Add Category</a></li>
                                <li><a href="">Modify Category</a></li>
                                <li><a href="">Make Statistics</a></li>
                            </s:if>
                                
                            <!-- log out -->    
                            <s:url var="logoutLink" value="logout"/>
                            <li><s:a href="%{logoutLink}">Log out</s:a></li>                        
                        </ul>
                    </li>
                </s:if>                
            </ul>
        </div> <!-- end menu bar -->
        
        <!-- banner -->
        <img src="/sample/pictures/banner.png" /><br/>
        <form action="guestSearch">
            <input type="text" name="txtSearch" value="" />
            <input type="submit" value="Search" name="btnSearch"/>
        </form>
        <!--<div>
            <!--<iframe src="viewStaffInfo" frameborder="1" scrolling="no" onload="resizeIframe(this)" width="100%">
            
            </iframe>
        </div>
        
        <div id="footer">
            Copy right<br/>
            Address<br/>
            Email<br/>
            Phone<br/>
        </div>-->
    </body>
</html>

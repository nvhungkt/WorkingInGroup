<%-- 
    Document   : header
    Created on : Oct 3, 2017, 2:56:39 PM
    Author     : Administrator
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="/struts-tags" prefix="s"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title></title>
    </head>
    <body>
        
        <!-- menu bar-->
        <div id="menu">
            <ul>            
                <li><a href="home.jsp">Home Page</a></li>
                
                <sql:setDataSource dataSource="DBResource" var="con"/>
                <c:if test="${not empty con}">
                    <sql:query var="rs" dataSource="${con}">
                        Select * From tbl_Category
                    </sql:query>
                    <c:if test="${rs.rowCount gt 0}">
                        <c:forEach var="row" items="${rs.rowsByIndex}">
                            <c:forEach var="cat" items="${row}" varStatus="counter">
                                <!-- query subcate by cat id -->
                                <c:if test="${counter.count eq 2}">
                                    <li>
                                        <font color="red">${cat}</font>
                                    </li>
                                </c:if>
                                
                                    
                                <%--<c:if test="${counter.count eq 2}">
                                    <li>
                                        <font color="red">${cat}</font>
                                    </li>
                                </c:if>--%>
                            </c:forEach>
                        </c:forEach>
                    </c:if>
                </c:if>
                
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
        <img src="Pictures/banner.PNG"/><br/>
        <form action="guestSearch">
            <input type="text" name="txtSearch" value="" />
            <input type="image" name="btnSearch" src="Pictures/searchIcon.png" width="25" height="25"/>
        </form>
    </body>
</html>

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
        <s:set var="staff" value="%{#session.STAFF}"/>
        <!-- menu bar-->
        <div id="menu">
            <ul>            
                <li><a href="/MasterCook/">Home Page</a></li>
                
                <sql:setDataSource dataSource="DBResource" var="con"/>
                <c:if test="${not empty con}">
                    <sql:query var="rs" dataSource="${con}">
                        Select Name, CategoryID From tbl_Category
                    </sql:query>
                    <c:if test="${rs.rowCount gt 0}">
                        <!-- each row is a cat with name & id, will be a <li> -->
                        <c:forEach var="row" items="${rs.rowsByIndex}">
                            <li>
                                <!-- in each cat will show a name and their subcat in <ul> -->
                                <c:forEach var="cat" items="${row}" varStatus="counter">
                                    <!-- the 1st-name cat shown in menu <li> -->
                                    <c:if test="${counter.count eq 1}">
                                        <font color="red">${cat}</font>
                                    </c:if>                                    
                                    <!-- if the 2nd-catID, then query subcat base on catID -->
                                    <c:if test="${counter.count eq 2}">
                                        <sql:query var="rsSubcat" dataSource="${con}">
                                            Select Name, SubcategoryID From tbl_Subcategory Where CategoryID = ? and IsActive = 'true'
                                            <sql:param value="${cat}"/>
                                        </sql:query>
                                        <c:if test="${rsSubcat.rowCount gt 0}">
                                            <ul>
                                                <!-- loop in rsSubcat for subcats-->
                                                <c:forEach var="subcat" items="${rsSubcat.rowsByIndex}">
                                                    <!-- loop in a subcat for name & id, each subcat will be a <li> -->
                                                    <li>
                                                        <s:a action="viewArticleBySubCat">
                                                            <c:forEach var="field" items="${subcat}" varStatus="counter2">
                                                                <!-- name of subcat -->
                                                                <c:if test="${counter2.count eq 1}">
                                                                    <font color="green">${field}</font>
                                                                    <s:param value="%{#attr.field}" name="subcatName"/>
                                                                </c:if>
                                                                <!-- id of subcat -->
                                                                <c:if test="${counter2.count eq 2}">
                                                                    <s:param value="%{#attr.field}" name="subcatID"/>
                                                                </c:if>
                                                            </c:forEach>
                                                                <s:param value="1" name="pageNumber"/>
                                                        </s:a>
                                                    </li>
                                                </c:forEach>
                                            </ul>
                                        </c:if>
                                    </c:if>
                                </c:forEach>
                            </li>
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
                                <a href="changePassword.jsp">Edit Password</a>
                            </li>
                            
                            <!-- phan theo role -->
                            <!-- role: collaborator -->
                            <s:if test="%{#staff.role == 'Collaborator'}">
                                <li><s:a href="uploadArticle" method="POST">Write New Articles</s:a></li>
                                <li><a href="manageArticlesByState">View My Articles</a></li>
                            </s:if>
                            
                            <!-- role: employee -->
                            <s:if test="%{#staff.role == 'Employee'}">
                                <li><a href="">Browse Articles</a></li>                                
                            </s:if>    
                                
                            <!-- role: manager -->
                            <s:if test="%{#staff.role == 'Manager'}">
                                <li><a href="">Browse Articles</a></li>
                                <li><a href="viewProductivityOfEmployees">View Employees</a></li>
                                <li><a href="viewProductivityOfCollaborators">View Collaborators</a></li>
                                <li><a href="">Create New Staffs</a></li>                                
                            </s:if>
                                
                            <!-- role: administrator --> 
                            <s:if test="%{#staff.role == 'Administrator'}">
                                <li><a href="">View Employees</a></li>
                                <li><a href="">View Collaborators</a></li>                             
                                <li><s:a value="loadAddSubcatPage">Add Category</s:a></li>
                                <li><s:a value="loadModifySubcatPage">Modify Category</s:a></li>
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
        <img src="Pictures/banner.PNG"; width="80%" height="50%"/><br/>
        
        <!-- search text box and button -->
        <form action="guestSearch">
            <input type="text" name="txtSearch" value="" />
            <input type="hidden" name="pageNumber" value="1" />
            <input type="image" name="btnSearch" src="Pictures/searchIcon.png" width="25" height="25"/>
        </form>
    </body>
</html>

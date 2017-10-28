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
        <title>MasterCook</title>
        <link rel="stylesheet" href="bootstrap/css/bootstrap.min.css">
        <link rel="stylesheet" type="text/css" href="css/OurCss.css"/>
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
        <script src="bootstrap/js/bootstrap.min.js"></script>
    </head>
    <body>
        <s:set var="staff" value="%{#session.STAFF}"/>
        <!-- menu bar-->
        <nav class="navbar navbar-default navbar-fixed-top">
            <div class="container-fluid">
                <div class="navbar-header">
                    <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#myNavbar">
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>                        
                    </button>
                    <a class="navbar-brand" href="/MasterCook/" style="padding: 0px;">
                        <img src="Pictures/logo.png" style="height: 200%"/>
                    </a>
                </div>
                <div class="collapse navbar-collapse" id="myNavbar">
                    <ul class="nav navbar-nav">
                        <sql:setDataSource dataSource="DBResource" var="con"/>
                        <c:if test="${not empty con}">
                            <sql:query var="rs" dataSource="${con}">
                                Select Name, CategoryID From tbl_Category
                            </sql:query>
                            <c:if test="${rs.rowCount gt 0}">
                                <!-- each row is a cat with name & id, will be a <li> -->
                                <c:forEach var="row" items="${rs.rowsByIndex}">
                                    <li class="dropdown">
                                        <!-- in each cat will show a name and their subcat in <ul> -->
                                        <c:forEach var="cat" items="${row}" varStatus="counter">
                                            <!-- the 1st-name cat shown in menu <li> -->
                                            <c:if test="${counter.count eq 1}">
                                                <a class="dropdown-toggle" data-toggle="dropdown" href="#">${cat}<span class="caret"></span></a>
                                            </c:if>                                    
                                            <!-- if the 2nd-catID, then query subcat base on catID -->
                                            <c:if test="${counter.count eq 2}">
                                                <sql:query var="rsSubcat" dataSource="${con}">
                                                    Select Name, SubcategoryID From tbl_Subcategory Where CategoryID = ? and IsActive = 'true'
                                                    <sql:param value="${cat}"/>
                                                </sql:query>
                                                <c:if test="${rsSubcat.rowCount gt 0}">
                                                    <ul class="dropdown-menu">
                                                        <!-- loop in rsSubcat for subcats-->
                                                        <c:forEach var="subcat" items="${rsSubcat.rowsByIndex}">
                                                            <!-- loop in a subcat for name & id, each subcat will be a <li> -->
                                                            <li>
                                                                <s:a action="viewArticleBySubCat">
                                                                    <c:forEach var="field" items="${subcat}" varStatus="counter2">
                                                                        <!-- name of subcat -->
                                                                        <c:if test="${counter2.count eq 1}">
                                                                            ${field}
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
                        <li><a href="aboutUs.jsp">About Us</a></li>
                        <li><a href="contact.jsp">Contact</a></li>
                    </ul>
                    <ul class="nav navbar-nav navbar-right">
                        <s:if test="%{#staff != null}">
                            <li class="dropdown">
                                <a class="dropdown-toggle" data-toggle="dropdown" href="#">
                                    <span class="glyphicon glyphicon-user"></span>
                                    Welcome, <s:property value="%{#staff.name}"/>
                                    <span class="caret"></span>
                                </a>
                                <ul class="dropdown-menu">
                                    <!-- dung chung -->
                                    <li> <!-- view own information -->
                                        <s:url var="staffInfoLnk" value="viewStaffInfo">
                                            <s:param name="staffID" value="%{#staff.staffID}"/>
                                        </s:url>
                                        <s:a href="%{#staffInfoLnk}">View information</s:a>
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
                                        <li>
                                            <s:a value="browseArticle">
                                                <% pageContext.setAttribute("status", "Pending for Employee"); %>                                        
                                                <s:param name="status" value="%{#attr.status}"/>
                                                Browse Articles
                                            </s:a>
                                        </li>                                
                                    </s:if>    

                                    <!-- role: manager -->
                                    <s:if test="%{#staff.role == 'Manager'}">
                                        <li>
                                            <s:a value="browseArticle">
                                                <% pageContext.setAttribute("status", "Pending for Manager"); %>                                        
                                                <s:param name="status" value="%{#attr.status}"/>
                                                Browse Articles
                                            </s:a>
                                        </li>
                                        <li><a href="viewProductivityOfEmployees">View Employees</a></li>
                                        <li><a href="viewProductivityOfCollaborators">View Collaborators</a></li>
                                        </s:if>

                                    <!-- role: administrator --> 
                                    <s:if test="%{#staff.role == 'Administrator'}">
                                        <li><a href="viewProductivityOfEmployees">View Employees</a></li>
                                        <li><a href="viewProductivityOfCollaborators">View Collaborators</a></li>
                                        <li><s:a value="loadAddSubcatPage">Add Category</s:a></li>
                                        <li><s:a value="loadModifySubcatPage">Modify Category</s:a></li>
                                            <li><a href="makeStatistic.jsp">Make Statistics</a></li>
                                        </s:if>

                                    <!-- log out -->    
                                    <s:url var="logoutLink" value="logout"/>
                                    <li><s:a href="%{logoutLink}">Log out</s:a></li>                        
                                </ul>
                            </li>
                        </s:if>
                    </ul>
                    <form action="guestSearch" class="form-inline nav navbar-nav navbar-right">
                        <input type="text" class="searchBar" name="txtSearch" placeholder="Search" id="Search"/>
                        <input type="hidden" name="pageNumber" value="1" />
                        <!--<button class="btn btn-link searchBar">-->
                            <span class="glyphicon glyphicon-search" id="search-submit"></span>
                        <!--</button>-->
                    </form>
                </div>
            </div>
        </nav>
        <br/><br/>
        <script>
            $(document).ready(function(){
                var spanSubmit = $('#search-submit');
                spanSubmit.on('click', function() {
                    $(this).closest('form').submit();
                });
                spanSubmit.closest('form').submit(function( event ) {
                    if($("#Search").val() === '')
                        event.preventDefault();
                });
            });
            
            $(document).on('scroll', function() {
                var height = $(document).scrollTop() * 0.4;
                $('body').css('background-position', 'center -' + height + 'px');
            });
        </script>
    </body>
</html>

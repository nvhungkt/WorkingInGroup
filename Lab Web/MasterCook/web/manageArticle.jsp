<%-- 
    Document   : manageArticle
    Created on : Sep 30, 2017, 5:48:30 PM
    Author     : Administrator
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="bootstrap/css/bootstrap.min.css">
        <link rel="stylesheet" href="css/OurCss.css">
        <script src="bootstrap/js/bootstrap.min.js"></script>
        <title>Manage Article</title>        
    </head>
    <body>
        <s:include value="header.jsp"/>
        <div class="container">
            <s:iterator var="entity" value="%{stateMap}">            
                <%-- --%>
                <font class="col-md-12 categoryTitle">
                    <s:property value="%{#entity.key}"/> Articles
                </font>
                <%--Display article present--%>
                <s:if test="%{#entity.value != null}">
                    <s:iterator var="art" value="%{#entity.value}" status="counter">
                        <div class="col-md-3">
                            <s:a value="viewDetails">
                                <s:param name="articleID" value="%{#art.id}"/>
                                <div class="homeMainArticleImg" style="background-image: 
                                     url('<s:property value="%{#art.imgLink}"/>')"></div>
                                <div class="homeMainArticle">
                                    <font><s:property value="%{#art.title}"/></font>
                                    <i><s:property value="%{#art.createdDate}"/></i>
                                </div>
                            </s:a>
                        </div>
                        <s:if test="%{#counter.count == 4}">
                            <div class="col-md-12"><br/></div>
                            <s:a value="viewMoreByState">
                                <s:param name="status" value="%{#entity.key}"/>
                                <i style="text-decoration: underline; float: right">View more...</i>
                            </s:a>
                        </s:if>             
                    </s:iterator>
                </s:if>
                <s:else>
                    <h3 class="col-md-12">There are no <s:property value="%{#entity.key}"/> Articles now</h3>
                </s:else>
                <%-- --%>
                <%-- --%>
            </s:iterator>
        </div>
    </body>
</html>

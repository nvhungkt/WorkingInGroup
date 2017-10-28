<%-- 
    Document   : manageArticleByState
    Created on : Sep 30, 2017, 5:49:16 PM
    Author     : Administrator
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>View More Article By Status</title>
    </head>
    <body>
        <s:include value="header.jsp"/>
        <div class="container">
            <font class="col-md-12 categoryTitle">
                <s:property value="%{status}"/>
            </font>
            <%--Set action và tham số cho page button--%>
            <s:set var="action" value="viewMoreByState"/>                
            <% pageContext.setAttribute("name", "status"); %>        
            <s:set var="nameComponent" value="%{#attr.name}"/>
            <s:set var="value" value="%{status}"/>
            <%--List of article present--%>
            <s:if test="%{listArticle != null}">
                <s:iterator var="art" value="%{listArticle}" status="counter">
                    <div class="col-md-3">
                        <s:a value="viewDetails">
                            <s:param name="articleID" value="%{#art.id}"/>
                            <div class="homeMainArticleImg" style="background-image: 
                                 url('<s:property value="%{#art.imgLink}"/>')"></div>
                            <div class="homeMainArticle">
                                <div class="small-grid"><s:property value="%{#art.title}"/></div>
                                <i><s:property value="%{#art.createdDate}"/></i>
                            </div>
                        </s:a>
                    </div>
                    <s:if test="%{#counter.count % 4 == 0}">
                        <div class="col-md-12"><br/></div>
                    </s:if>
                </s:iterator>
            </s:if>
            <s:else>
                <h3>There are no Pending Article in your Subcategory now</h3>
            </s:else>            
            <%--List of page button--%>
            <s:if test="%{pageChooser != null}"> 
                <div class="col-md-12"><br/></div>
                <s:include value="pageChooser.jsp"/>
            </s:if>                                 
        </div>
    </body>
</html>

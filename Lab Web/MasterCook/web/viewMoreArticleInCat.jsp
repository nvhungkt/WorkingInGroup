<%-- 
    Document   : viewMoreArticleInCat
    Created on : Oct 12, 2017, 10:46:43 AM
    Author     : Administrator
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="/struts-tags" prefix="s"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>MasterCook</title>
    </head>
    <body>
        <s:set var="action" value="viewMoreAtHome"/>
        <% String name = "catID";%>
        <% pageContext.setAttribute("name", name); %>
        <s:set var="nameComponent" value="%{#attr.name}"/>
        <s:set var="value" value="%{catID}"/>
        
        <s:include value="header.jsp"/>
        
        <div class="container">
            <font class="col-md-12 categoryTitle">
                <s:property value="%{catName}"/>
            </font>
            <s:if test="%{listArticle == null}">
                <div>
                    <font><h3>No Articles</h3></font>
                </div>
            </s:if>
            <s:if test="%{listArticle != null}">
                <s:iterator var="art" value="%{listArticle}" status="counter">
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
                    <s:if test="%{#counter.count % 4 == 0}">
                        <div class="col-md-12"><br/></div>
                    </s:if>
                </s:iterator>
                <s:if test="%{pageChooser != null}"> 
                    <div class="col-md-12"><br/></div>
                    <s:include value="pageChooser.jsp"/>
                </s:if>
            </s:if>
        </div>
        <div>
            <s:include value="footer.html"/>
        </div>
    </body>
</html>

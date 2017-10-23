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
    </head>
    <body>
        <s:set var="staff" value="%{#session.STAFF}"/>
        <s:include value="header.jsp"/>
        <div class="container">
        <!--------------------------------------------------------------------->
        <!-- display content of home page -->
        <s:iterator var="cat" value="%{mapCat}">
            <div>
                <font class="col-md-12 categoryTitle">
                    <s:property value="%{#cat.key.name}"/>
                </font>
                <div class="col-md-6">
                    <s:iterator var="art" value="%{#cat.value}" begin="0" end="0">
                        <s:a value="viewDetails">
                            <s:param name="articleID" value="%{#art.id}"/>
                            <div class="homeMainArticleImg" style="background-image:
                                 url('<s:property value="%{#art.imgLink}"/>')"></div>
                            <div class="homeMainArticle">
                                <font><s:property value="%{#art.title}"/></font>
                                <i><s:property value="%{#art.createdDate}"/></i>
                            </div>
                        </s:a>
                    </s:iterator>
                </div> 
                <div class="col-md-6">
                        <s:iterator var="art" value="%{#cat.value}" status="counter" begin="1">
                            <s:a value="viewDetails">
                                <div class="homeArticleImg" style="background-image:
                                     url('<s:property value="%{#art.imgLink}"/>')"></div>
                                <div class="homeArticle">
                                    <s:param name="articleID" value="%{#art.id}"/>
                                    <font><s:property value="%{#art.title}"/></font>
                                    <i><s:property value="%{#art.createdDate}"/></i>
                                </div>
                            </s:a>
                            <s:if test="%{#counter.count == 4}">
                                <s:a value="viewMoreAtHome">
                                    <i style="float: right">View more...</i>
                                    <s:param name="catID" value="%{#cat.key.categoryID}"/>
                                    <s:param name="pageNumber" value="1"/>
                                </s:a>
                            </s:if>
                        </s:iterator>
                </div>
            </div><hr/>
        </s:iterator>
        
        <!--------------------------------------------------------------------->
        </div>
        <s:include value="footer.html"/>
    </body>
</html>

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
                <div class="container">
                    <h2 id="articleStatus"><s:property value="%{#entity.key}"/> Articles</h2>
                    <%--Display article present--%>
                    <s:if test="%{#entity.value != null}">
                        <s:iterator var="art" value="%{#entity.value}" status="counter">
                            <div class="articlePresent col-md-3">
                                <s:a value="viewDetails">
                                    <s:param name="articleID" value="%{#art.id}"/>
                                    <img src="<s:property value="%{#art.imgLink}"/>" width="100%"/>
                                    </br>
                                    <div class="articleInfo">
                                        <font><s:property value="%{#art.title}"/></font>
                                    </div>                                                               
                                </s:a>   
                                    <div class="articleInfo" style="width: 100%; text-align: right">
                                        <i><s:property value="%{#art.createdDate}"/></i>
                                    </div>
                            </div>            
                                <s:if test="%{#counter.count == 4}">
                                    <s:a value="viewMoreByState">
                                        <s:param name="status" value="%{#entity.key}"/>
                                        <i style="text-decoration: underline; float: right">View more...</i>
                                    </s:a>
                                </s:if>             
                        </s:iterator>
                    </s:if>
                    <s:else>
                        <h3>There are no <s:property value="%{#entity.key}"/> Articles now</h3>
                    </s:else>
                    <%-- --%>
                    <%-- --%>
                </div>
            </s:iterator>
        </div>
    </body>
</html>

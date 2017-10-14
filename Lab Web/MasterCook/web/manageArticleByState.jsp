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
        <h1><s:property value="%{status}"/></h1>
        <%--Set action và tham số cho page button--%>
        <s:set var="action" value="viewMoreByState"/>                
        <% pageContext.setAttribute("name", "status"); %>        
        <s:set var="nameComponent" value="%{#attr.name}"/>
        <s:set var="value" value="%{status}"/>
        <%--List of article present--%>
        <s:if test="%{listArticle != null}">
            <s:iterator var="art" value="%{listArticle}" status="counter">
                <div style="float: left; width: 24.5%; height:  200px">
                    <s:a value="viewDetails">
                        <s:param name="articleID" value="%{#art.id}"/>
                        <img src="<s:property value="%{#art.imgLink}"/>" width="100" height="100"/><br/>
                        <font><s:property value="%{#art.title}"/></font><br/>
                    </s:a>
                    <i><s:property value="%{#art.createdDate}"/></i>
                </div>
                <s:if test="%{#counter.count == 4}">
                    <br/>
                </s:if>
            </s:iterator>
        </s:if>
                <s:else>
                    <h2>There are no Pending Article in your Subcategory now</h2>
                </s:else>            
                <%--List of page button--%>
        <div style="border-style: double; border-color: red; float: right">
                <s:include value="pageChooser.jsp"/>                                    
        </div>
    </body>
</html>

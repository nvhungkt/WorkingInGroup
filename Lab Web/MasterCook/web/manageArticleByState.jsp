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
        <title>JSP Page</title>
    </head>
    <body>
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
                <%--List of page button--%>
        <div style="border-style: double; border-color: red; float: right">
                <s:include value="pageChooser.jsp"/>                                    
        </div>
    </body>
</html>

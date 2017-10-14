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
        <title>Manage Article</title>
    </head>
    <body>
        <s:include value="header.jsp"/>
        <s:iterator var="entity" value="%{stateMap}">            
            <%-- --%>
            <div>
                <h2><s:property value="%{#entity.key}"/> Articles</h2>
                <%--Display article present--%>
                <s:if test="%{#entity.value != null}">
                    <s:iterator var="art" value="%{#entity.value}" status="counter">
                        <div style="border-color: burlywood; border-style: dotted; width: 99%; float: top">
                            <s:a value="viewDetails">
                                <s:param name="articleID" value="%{#art.id}"/>
                                <img src="<s:property value="%{#art.imgLink}"/>" width="100" height="100"/>
                                <font><s:property value="%{#art.title}"/></font>
                            </s:a>
                            <i style="float: right"><s:property value="%{#art.createdDate}"/></i>
                        </div>

                        <s:if test="%{#counter.count == 3}">
                            <s:a value="viewMoreByState">
                                <s:param name="status" value="%{#entity.key}"/>
                                <i style="float: right">View more...</i>
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
    </body>
</html>

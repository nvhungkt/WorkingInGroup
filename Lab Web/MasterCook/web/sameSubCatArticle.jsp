<%-- 
    Document   : sameSubCatArticle
    Created on : Sep 30, 2017, 5:47:05 PM
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
        <s:set var="action" value="viewArticleBySubCat"/> <!-- name of action-->
        <% String name = "subcatID";%> <!-- name of the component-->
        <% pageContext.setAttribute("name", name); %>
        <s:set var="nameComponent" value="%{#attr.name}"/>
        <s:set var="value" value="%{subcatID}"/> <!-- value of the component-->
        
        <s:include value="header.jsp"/>
        <h1><s:property value="%{subcatName}"/></h1>
        <s:if test="%{results == null}">
            <font color="red"><h3>No Result Found</h3></font>
        </s:if>
        <s:if test="%{results != null}">
            <s:iterator var="art" value="%{results}" status="counter">
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
            <div style="border-style: double; border-color: red; float: right">
                <s:include value="pageChooser.jsp"/>
            </div>
        </s:if>
        <s:include value="footer.html"/>
    </body>
</html>

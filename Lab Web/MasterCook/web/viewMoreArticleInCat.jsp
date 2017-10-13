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
        <h1><s:property value="%{catName}"/></h1>
        <s:if test="%{listArticle == null}">
            <div>
                <font color="red"><h3>No Result Found</h3></font>
            </div>
        </s:if>
        <s:if test="%{listArticle != null}">
            <div>
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
            </div>
            <s:if test="%{pageChooser != null}"> 
                <div style="border-style: double; border-color: red; float: right; width: 100%">
                    <s:include value="pageChooser.jsp"/>
                </div>
            </s:if>
        </s:if>
        <div>
            <s:include value="footer.html"/>
        </div>
    </body>
</html>

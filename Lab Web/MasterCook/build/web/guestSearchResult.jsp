<%-- 
    Document   : guestSearchResult
    Created on : Sep 30, 2017, 5:46:29 PM
    Author     : Administrator
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="/struts-tags" prefix="s"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <s:set var="action" value="guestSearch"/>
        <% String name = "txtSearch";%>
        <% pageContext.setAttribute("name", name); %>
        <s:set var="nameComponent" value="%{#attr.name}"/>
        <s:set var="value" value="%{txtSearch}"/>
        
        <s:include value="header.jsp"/>
        <h1>Your Search Value: <s:property value="%{txtSearch}"/></h1>
        <s:if test="%{searchResult == null}">
            <font color="red"><h3>No Result Found</h3></font>
        </s:if>
        <s:if test="%{searchResult != null}">
            <s:iterator var="art" value="%{searchResult}" status="counter">
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

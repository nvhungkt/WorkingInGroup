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
        
        <!--------------------------------------------------------------------->
        <!-- display content of home page -->
        <s:iterator var="cat" value="%{mapCat}">
            <div style="border: crimson; border-style: solid; overflow: auto">
                <font color="blue" style="font-family: serif; font-style: italic; font-size: 30px">
                    <s:property value="%{#cat.key.name}"/>
                </font><br/>
                <div style="border-color: greenyellow; border-style: solid; width: 60%; float: left">
                    <s:iterator var="art" value="%{#cat.value}" begin="0" end="0">
                            <s:a value="viewDetails">
                                <s:param name="articleID" value="%{#art.id}"/>
                                <img src="<s:property value="%{#art.imgLink}"/>" width="500" height="417"/><br/>
                                <font><s:property value="%{#art.title}"/></font>
                            </s:a><br/>
                            <i style="float: right"><s:property value="%{#art.createdDate}"/></i>
                    </s:iterator>
                </div> 
                <div style="border-color: cornflowerblue; border-style: solid; width: 39%; float: left; overflow: auto">
                    <s:iterator var="art" value="%{#cat.value}" status="counter" begin="1">
                        <div style="border-color: burlywood; border-style: dotted; width: 99%; float: top">
                            <s:a value="viewDetails">
                                <s:param name="articleID" value="%{#art.id}"/>
                                <img src="<s:property value="%{#art.imgLink}"/>" width="100" height="100"/>
                                <font><s:property value="%{#art.title}"/></font>
                            </s:a>
                            <i style="float: right"><s:property value="%{#art.createdDate}"/></i>
                        </div>
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
        
        <s:include value="footer.html"/>
    </body>
</html>

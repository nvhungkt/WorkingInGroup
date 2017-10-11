<%-- 
    Document   : pageChooser
    Created on : Oct 11, 2017, 3:55:10 PM
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
        <h1>abc<s:property value="%{pageNumber}"/>xyz</h1>
        <s:if test="%{pageChooser != null}">
            <s:iterator var="page" value="%{pageChooser}">
                <s:if test="%{#page == '<< Previous Page'}">
                    <form action="guestSearch" style="float: left">
                        <input type="hidden" name="txtSearch" value="<s:property value="%{txtSearch}"/>" />
                        <input type="submit" value="<s:property value="%{#page}"/>"/>
                        <input type="hidden" name="pageNumber" value="<s:property value="%{pageNumber - 1}"/>" />
                    </form>
                </s:if>
                <s:if test="%{#page == 'Next Page >>'}">
                    <form action="guestSearch" style="float: left">
                        <input type="hidden" name="txtSearch" value="<s:property value="%{txtSearch}"/>" />
                        <input type="submit" value="<s:property value="%{#page}"/>"/>
                        <input type="hidden" name="pageNumber" value="<s:property value="%{pageNumber + 1}"/>" />
                    </form>
                </s:if>
                <s:if test="%{#page == '...'}">
                    <s:property value="%{#page}"/>
                </s:if>
                <s:if test="%{#page != '<< Previous Page' and #page != 'Next Page >>' and #page != '...'}">
                    <form action="guestSearch" style="float: left">
                        <input type="hidden" name="txtSearch" value="<s:property value="%{txtSearch}"/>" />
                        <%--<s:if test="%((pageNumber + '') == #page)">--%>
                        <s:if test="%(#page.equals(pageNumber + ''))">
                            <input type="submit" style="color: cornflowerblue" value="<s:property value="%{#page}"/>"/>
                        </s:if>
                        <%--<s:if test="%((pageNumber + '') != #page)">--%>
                        <s:if test="%((#page.equals(pageNumber + ''))">
                            <input type="submit" value="<s:property value="%{#page}"/>"/>
                        </s:if>
                            <%--<input type="submit" value="<s:property value="%{#page}"/>"/>--%>
                        <input type="hidden" name="pageNumber" value="<s:property value="%{#page}"/>" />
                    </form>
                </s:if>
            </s:iterator>
        </s:if>
    </body>
</html>

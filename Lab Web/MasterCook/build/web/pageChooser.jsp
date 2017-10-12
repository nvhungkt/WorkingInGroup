<%-- 
    Document   : pageChooser
    Created on : Oct 11, 2017, 3:55:10 PM
    Author     : Administrator
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="/struts-tags" prefix="s"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <s:if test="%{pageChooser != null}">
            <s:iterator var="page" value="%{pageChooser}">
                <s:if test="%{#page == '<< Previous Page'}">
                    <form action="<s:property value="%{#action}"/>" style="float: left">
                        <input type="hidden" name="<s:property value="%{#nameComponent}"/>" value="<s:property value="%{#value}"/>" />
                        <input type="submit" value="<s:property value="%{#page}"/>"/>
                        <input type="hidden" name="pageNumber" value="<s:property value="%{pageNumber - 1}"/>" />
                    </form>
                </s:if>
                <s:if test="%{#page == 'Next Page >>'}">
                    <form action="<s:property value="%{#action}"/>" style="float: left">
                        <input type="hidden" name="<s:property value="%{#nameComponent}"/>" value="<s:property value="%{#value}"/>" />
                        <input type="submit" value="<s:property value="%{#page}"/>"/>
                        <input type="hidden" name="pageNumber" value="<s:property value="%{pageNumber + 1}"/>" />
                    </form>
                </s:if>
                <s:if test="%{#page == '...'}">
                    <label style="float: left"><s:property value="%{#page}"/></label>
                </s:if>
                <s:if test="%{#page != '<< Previous Page' and #page != 'Next Page >>' and #page != '...'}">
                    <form action="<s:property value="%{#action}"/>" style="float: left">
                        <input type="hidden" name="<s:property value="%{#nameComponent}"/>" value="<s:property value="%{#value}"/>" />
                        <s:if test="%{pageNumber == #page}">
                            <input type="submit" style="color: white; background-color: orange" value="<s:property value="%{#page}"/>"/>
                        </s:if>
                        <s:if test="%{pageNumber != #page}">
                            <input type="submit" value="<s:property value="%{#page}"/>"/>
                        </s:if>
                        <input type="hidden" name="pageNumber" value="<s:property value="%{#page}"/>" />
                    </form>
                </s:if>
            </s:iterator>
        </s:if>
    </body>
</html>

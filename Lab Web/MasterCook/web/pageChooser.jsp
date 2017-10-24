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
            <form action="<s:property value="%{#action}"/>" style="float: right">
                <input type="hidden" name="<s:property value="%{#nameComponent}"/>" value="<s:property value="%{#value}"/>" />
                <div class="btn-group">
                    <s:iterator var="page" value="%{pageChooser}">
                        <s:if test="%{#page == '<< Previous Page'}">
                            <button type="submit" class="btn btn-default"
                                    name="pageNumber" value="<s:property value="%{pageNumber - 1}"/>">
                                <s:property value="%{#page}"/>
                            </button>
                        </s:if>
                        <s:if test="%{#page == 'Next Page >>'}">
                            <button type="submit" class="btn btn-default"
                                    name="pageNumber" value="<s:property value="%{pageNumber + 1}"/>">
                                <s:property value="%{#page}"/>
                            </button>
                        </s:if>
                        <s:if test="%{#page == '...'}">
                            <label style="float: left"><s:property value="%{#page}"/></label>
                        </s:if>
                        <s:if test="%{#page != '<< Previous Page' and #page != 'Next Page >>' and #page != '...'}">
                            <s:if test="%{pageNumber == #page}">
                                <button type="submit" class="btn btn-default" disabled="disabled"
                                        name="pageNumber" value="<s:property value="%{#page}"/>">
                                    <s:property value="%{#page}"/>
                                </button>
                            </s:if>
                            <s:if test="%{pageNumber != #page}">
                                <button type="submit" class="btn btn-default"
                                        name="pageNumber" value="<s:property value="%{#page}"/>">
                                    <s:property value="%{#page}"/>
                                </button>
                            </s:if>
                        </s:if>
                    </s:iterator>
                </div>
            </form>
        </s:if>        
    </body>
</html>

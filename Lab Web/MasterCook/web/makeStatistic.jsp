<%-- 
    Document   : makeStatistic
    Created on : Sep 30, 2017, 7:25:58 PM
    Author     : Administrator
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="sx" uri="/struts-dojo-tags" %>
<%@taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Statistic</title>
        <sx:head/>        
    </head>
    <body>       
        <%--Statistic Control--%>
        <div>         
           <s:form action="makeTotalPostStatistic" method="POST">           
                Begin Time </br><sx:datetimepicker name="beginDate" displayFormat="dd/MM/yyyy"/> </br>
                End Time </br><sx:datetimepicker name="endDate" displayFormat="dd/MM/yyyy"/></br>                   
                <s:submit value="Total posts" action="makeTotalPostStatistic"/>                                                 
                <s:submit value="Posts with most views" action="makeMostViewStatistic"/>
           </s:form>                           
        </div>
        <%--Statistic View--%>
        <div>
            <h1>Make Statistic</h1>
            <%--Validate Begin Date and End Date--%>
            <s:if test="%{message != null}">
                <font color="red">
                <h3><s:property value="%{message}"/></h3>
                </font>
            </s:if>
                <%--Total Post Statistic--%>
            <s:if test="%{type == 'TotalPost'}">
                <s:iterator var="entity" value="totalPost">
                    Total of <s:property value="%{#entity.key}"/> posts: <s:property value="%{#entity.value}"/></br>
                </s:iterator>
            </s:if>
                <%--Most View Statistic--%>
            <s:if test="%{type == 'MostView'}">
                <s:iterator var="article" value="mostViewList" status="counter">
                    <div style="margin-bottom: 15px">
                        <s:if test="%{#counter.count == 1}">
                            <s:property value="%{#counter.count}"/>st
                        </s:if>                    
                        <s:if test="%{#counter.count == 2}">
                            <s:property value="%{#counter.count}"/>nd
                        </s:if>
                        <s:if test="%{#counter.count != 1 and #counter.count != 2}">
                            <s:property value="%{#counter.count}"/>th
                        </s:if>
                        - <s:property value="%{#article.views}"/> views
                        </br>Subcategory: <s:property value="%{#article.subcategoryName}"/>
                        </br><s:property value="%{#article.title}"/>
                    </div>                    
                </s:iterator>
            </s:if>
        </div>
    </body>
</html>

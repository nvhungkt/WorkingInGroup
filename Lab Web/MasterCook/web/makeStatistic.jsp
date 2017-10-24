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
        <meta name="viewport" content="width=device-width, initial-scale=1"/>
        <title>Statistic</title>
        <sx:head/>    
        <link rel="stylesheet" href="bootstrap/css/bootstrap.min.css">
        <script src="bootstrap/js/bootstrap.min.js"></script>        
        <link rel="stylesheet" href="css/OurCss.css">                
    </head>
    <body>       
        <s:include value="header.jsp"/>
        <%--Statistic Control--%>
        <div class="container" style="background-color: white; margin-bottom: 5vw; margin-top: 5vw" >
            <div class="col-md-4 statisticContainer" style="border-right-style: solid ">         
                <s:form action="makeTotalPostStatistic" method="POST">           
                    <div class="col-md-12" statisticDateContainer>
                    Begin Time <sx:datetimepicker name="beginDate" displayFormat="dd/MM/yyyy" cssClass="statisticDate"/> </br>
                    </div>
                    <div class="col-md-12 statisticDateContainer">
                    End Time <sx:datetimepicker name="endDate" displayFormat="dd/MM/yyyy" cssClass="statisticDate"/></br>                                                                                   
                    </div>                    
                    <s:submit value="Total posts" action="makeTotalPostStatistic" cssClass="btn btn-default" />                    
                    <s:submit value="Posts with most views" action="makeMostViewStatistic" cssClass="btn btn-default"/>                                                        
                </s:form>                           
            </div>
            <%--Statistic View--%>
            <div class="col-md-8 statisticContainer">
                <h1>Make Statistics</h1>
                <%--Validate Begin Date and End Date--%>
                <s:if test="%{exception.message != null}">                                  
                    <h3><s:property value="%{exception.message}"/></h3>                                   
                </s:if>                
                <%--Total Post Statistic--%>
                <s:if test="%{type == 'TotalPost'}">
                    <s:iterator var="entity" value="totalPost">
                        <div class="metric1">
                            Total of <s:property value="%{#entity.key}"/> posts: <s:property value="%{#entity.value}"/></br>
                        </div>
                    </s:iterator>
                </s:if>
                <%--Most View Statistic--%>
                <s:if test="%{type == 'MostView'}">
                    <s:iterator var="article" value="mostViewList" status="counter">
                        <div class="metric2">
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
                        <hr>
                    </s:iterator>
                </s:if>
            </div>
        </div>
    </body>
</html>

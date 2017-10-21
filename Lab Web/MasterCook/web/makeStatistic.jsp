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
        <link rel="stylesheet" href="bootstrap/css/bootstrap.min.css">
        <script src="bootstrap/js/bootstrap.min.js"></script>
        <style>
            #statistic {                
                margin-top: 20px; 
                height: 600px;
            }
            #controlDiv {
                float: left;
                width: 19%;                
                height: 100%;
                margin-left: 5%;
                border-right-style: solid;
                border-right-width: thin;
            } 
            #dataDiv {
                float: left;
                width: 75%;                
                height: 100%;                                
            }            
            .date {                                
                margin-top: 25px;
                margin-bottom: 25px;                                                
            }                
            .btn {
                margin-bottom: 20px;
                margin-top: 20px;
                width: 100%;                
            }            
            .metric1 {
                margin-left: 10%;
                font-size: 20px;
                margin-top: 20px;
            }
            .metric2 {
                margin-left: 10%;
                font-size: 15px;                
            }
            h3 {
                margin-left: 10%;
                font-size: 20px;
                color: red;
            }
            h1 {
                 margin-left: 10%;
            }
            hr { 
                display: block;
                margin-top: 0.5em;
                margin-bottom: 0.5em;
                margin-left: auto;
                margin-right: auto;
                border-style: inset;
                border-width: 1px;
            }
        </style>
    </head>
    <body>       
        <s:include value="header.jsp"/>
        <%--Statistic Control--%>
        <div id="statistic">
            <div id="controlDiv">         
                <s:form action="makeTotalPostStatistic" method="POST">           
                    Begin Time <sx:datetimepicker name="beginDate" displayFormat="dd/MM/yyyy" cssClass="date"/> </br>
                    End Time <sx:datetimepicker name="endDate" displayFormat="dd/MM/yyyy" cssClass="date"/></br>                                                                                   
                    <s:submit value="Total posts" action="makeTotalPostStatistic" cssClass="btn btn-default"/>                             
                    <s:submit value="Posts with most views" action="makeMostViewStatistic" cssClass="btn btn-default"/>                                    
                </s:form>                           
            </div>
            <%--Statistic View--%>
            <div id="dataDiv">
                <h1 style="margin-bottom: 50px">Make Statistics</h1>
                <%--Validate Begin Date and End Date--%>
                <s:if test="%{exception.message.contains('Date')}">               
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

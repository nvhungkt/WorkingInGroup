<%-- 
    Document   : articleDetail
    Created on : Sep 30, 2017, 5:46:06 PM
    Author     : Administrator
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Article Details</title>
    </head>
    <body>
            <%--Category - Subcategory --%>
        <font color="blue">
            <s:label value="%{article.categoryName}"/>>        
            <s:a href="sameSubCatArticle.jsp"><s:label value="%{article.subcategoryName}"/></s:a>
            </br>
        </font>
            <%--Article Title and Datetime--%>
        <div>
            <s:label value="%{article.dateTime}"/></br>
            <h1><s:label value="%{article.title}"/></h1>            
        </div>
        <hr>
            <%--Article Content--%>
        <div>            
            <div id="articleContent" >                
            </div>                                                  
                <%--Add content of txt file into hidden field--%>            
            <s:hidden id="hiddenContent" value="%{content}"/>            
                <%--Display content in hidden field in articleContent div--%>            
            <script>
                document.getElementById("articleContent").innerHTML = document.getElementById("hiddenContent").value;
            </script>
            </br></br>
                <%--Views and Author--%>
            <font style="font-weight: bold">
            <s:label value="%{article.views} Views"/>
            <s:label value="Author: %{article.authorName}"/>
            </font>
        </div>
            <%--Controll of Staff role--%>
        <s:if test="%{#session.STAFF != null}">
            <div>
                    <%--With Rejected Article--%>
                <s:if test="%{article.status == 'Rejected'}">
                    <%--Show reason of Rejected--%>
                    <div>
                        <font color="red">
                        <s:property value="%{article.reason}"/>
                        </font>
                    </div>                    
                </s:if>
                    <%--Other Status--%>
                <s:else>
                    <%--Not collaborator Role--%>
                    <s:if test="%{#session.STAFF.role != 'Collaborator'}"> 
                        <%--Employee role and Status is pending for Employee--%>
                        <s:if test="%{#session.STAFF.role == 'Employee' and article.status == 'Pending for Employee'}">
                            <%--Approve by Employee--%>                                                          
                            <s:form action="approveArticle">                                
                                <s:hidden name="articleID" value="%{article.articleID}"/>
                                <s:hidden name="status" value="%{article.status}"/>
                                <s:hidden name="staffID" value="%{#session.STAFF.staffID}"/>
                                <s:submit value="Approve"/>                                   
                            </s:form>                            
                            <%--Reject by Employee--%>
                            <s:submit type="button" onclick="document.getElementById('reason').style.visibility = 'visible'" value="Reject"/> 
                            <div id="reason" style="visibility: hidden">  
                                <%--Input reason form--%>
                                <form action="rejectArticle">
                                    <s:hidden name="staffID" value="%{#session.STAFF.staffID}"/>
                                    <s:hidden name="articleID" value="%{article.articleID}"/>
                                    <textarea name="txtReason"/>
                                        Input Reason
                                    </textarea>
                                    <input type="submit" value="Submit" />
                                </form>
                            </div>                            
                        </s:if>
                        <%--Not Employee Role--%>
                        <s:if test="%{#session.STAFF.role != 'Employee'}">                                                    
                            <%--Not Accepted Article--%>
                            <s:if test="%{article.status != 'Accepted'}">
                                <%--Approve--%>    
                                <s:form action="approveArticle">
                                    <s:hidden name="articleID" value="%{article.articleID}"/>
                                    <s:hidden name="status" value="%{article.status}"/>
                                    <s:hidden name="staffID" value="%{#session.STAFF.staffID}"/>
                                    <s:submit value="Approve"/>                                   
                                </s:form>
                                <%----%>
                            </s:if>
                            <%--Reject--%>                                  
                            <s:submit type="button" onclick="document.getElementById('reason').style.visibility = 'visible'" value="Reject"/>   
                            <s:form action="rejectArticle">
                            <div id="reason" style="visibility: hidden">                                                    
                                <%--Input reason form--%>
                                <form action="rejectArticle">
                                    <s:hidden name="staffID" value="%{#session.STAFF.staffID}"/>
                                    <s:hidden name="articleID" value="%{article.articleID}"/>
                                    <textarea name="txtReason"/>
                                        Input Reason
                                    </textarea>
                                    <input type="submit" value="Submit" />
                                </form>
                            </div>                            
                            </s:form>
                            <%----%>
                        </s:if>
                    </s:if>                  
                    <%--Edit--%>
                    <s:form action="">
                        <s:hidden id="articleID" value="%{article.articleID}"/>
                        <s:submit value="Edit"/>     
                    </s:form>   
                    <%----%>
                </s:else>
            </div>
        </s:if>            
        <div>
            Comments
            <s:form action="sendComment">
                <%--Send comment action --%>                
                <s:textarea name="commentContent"/>                
                <s:textfield name="guestName" placeholder="Your name"/>                
                <s:textfield name="guestPhone" placeholder="Phone number"/>
                <s:textfield name="guestEmail" placeholder="Email"/>
                <s:hidden name="articleID" value="%{article.articleID}"/>
                <s:submit value="Send"/>
            </s:form>        
            <%--Show error comment message--%>
            <s:if test="%{#parameters.message != null and #parameters.message != ''}">
                <font color="red">               
                <s:property value="%{#parameters.message}"/>
                </font>
            </s:if>                        
            <div>
                <%--Show comments--%>
                <s:if test="%{comments != null}">
                    <table border="1"> 
                        <tbody>
                            <s:iterator var="comment" value="%{comments}">
                                <%--Delete comment form--%>
                                <s:form action="deleteComment" theme="simple">
                                    <tr>       
                                        <td>
                                            <s:property value="%{#comment.guestName.charAt(0)}"/> 
                                        </td>
                                        <td>
                                            <s:property value="%{#comment.guestName}"/> 
                                        </td>
                                        <td>
                                            <s:property value="%{#comment.commentContent}"/> 
                                        </td>
                                        <td>
                                            <s:property value="%{#comment.dateTime}"/>                                     
                                        </td>   
                                        <td>
                                            <%--Delete comment button--%>
                                            <s:submit value="x"/>
                                            <s:hidden name="commentID" value="%{#comment.commentID}"/>
                                        </td>
                                    </tr>                                
                                </s:form>
                            </s:iterator>
                        </tbody>
                    </table>
                </s:if>
            </div>
        </div>                
    </body>
</html>

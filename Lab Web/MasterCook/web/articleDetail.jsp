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
        <font color="blue">
        <s:label value="%{article.categoryName}"/>>        
        <s:a href="sameSubCatArticle.jsp"><s:label value="%{article.subcategoryName}"/></s:a>
            </br>
        </font>
        <div>
        <s:label value="%{article.dateTime}"/></br>
            <h1><s:label value="%{article.title}"/></h1>            
        </div>
        <hr>
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
            <font style="font-weight: bold">
                <s:label value="%{article.views}"/>
                <s:label value="%{article.authorName}"/>
            </font>
        </div>
        
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
            <s:if test="%{#parameters.message != null and #parameters.message != ''}">
                <font color="red">               
                    <s:property value="%{#parameters.message}"/>
                </font>
            </s:if>                        
            <div>
                <s:if test="%{comments != null}">
                    <table border="1"> 
                        <tbody>
                            <s:iterator var="comment" value="%{comments}">
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
                                </tr>                                
                            </s:iterator>
                        </tbody>
                    </table>
                </s:if>
            </div>
        </div>
        
        
    </body>
</html>

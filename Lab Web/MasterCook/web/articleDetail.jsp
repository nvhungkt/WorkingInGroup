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
        <s:include value="header.jsp"/>
            <%--Category - Subcategory --%>
        <br/><br/><br/>
        <div class="container">
            <font color="blue">
                <s:label value="%{article.categoryName}"/>>
                <s:a value="viewArticleBySubCat">
                                    <s:param name="subcatID" value="%{article.subcategoryId}"/>
                                    <s:label value="%{article.subcategoryName}"/>
                </s:a>
                <br/>
            </font>
                <%--Article Title and Datetime--%>
            <div class="col-md-8">
                <div class="article-detail">
                    <i class="article-datetime"><s:property value="%{article.dateTime}"/></i>
                    <h1><s:property value="%{article.title}"/></h1>            
                    <hr>
                    ${requestScope.content}
                    <%--Article Content--%>                                  
                    <%--Views and Author--%>
                    <br/><br/><br/>
                    <font class="article-views">
                        <s:property value="%{article.views}"/> views
                    </font>
                    <font class="article-author">
                        <i>Follow </i><s:property value="%{article.authorName}"/>            
                    </font>
                </div>
            </div>
                <%--Related Articles--%>
            <div class="col-md-4">
                <h3><b>You may also like</b></h3>
                <s:iterator var="art" value="%{listArticles}" status="counter">
                    <s:a value="viewDetails">
                        <div class="homeArticleImg" style="background-image:
                                         url('<s:property value="%{#art.imgLink}"/>')"></div>
                        <div class="homeArticle">
                            <s:param name="articleID" value="%{#art.id}"/>
                            <font><s:property value="%{#art.title}"/></font>
                            <i><s:property value="%{#art.createdDate}"/></i>
                        </div>
                    </s:a>
                    <div class="col-md-12"><br/></div>
                    <s:if test="%{#counter.count == 3}">                            
                        <s:a value="viewArticleBySubCat">
                            <s:param name="subcatID" value="%{article.subcategoryId}"/>
                            <i style="float: right">View more...</i>
                        </s:a>
                    </s:if>
                </s:iterator>
                <script>
                    $(window).on('resize', function(){
                        $('.homeArticle').outerHeight($('.homeArticleImg').height());
                    }).trigger('resize');
                </script>
            </div>
                <%-- --%>


                <%--Controll of Staff role--%>
            <s:if test="%{#session.STAFF != null}">
                <div class="col-md-8">
                    <div class="article-detail">
                        <%--With Rejected Article--%>
                        <s:if test="%{article.status == 'Rejected'}">
                            <%--Show reason of Rejected--%>
                            <div>
                                <font color="red">
                                    <i><s:property value="%{article.reason}"/></i>
                                </font>
                            </div>                    
                        </s:if>
                        <%--Other Status--%>
                        <s:else>
                            <%--Not collaborator Role--%>
                            <s:if test="%{#session.STAFF.role != 'Collaborator'}"> 
                                <%--Pending article--%>
                                <s:if test="%{(#session.STAFF.role == 'Employee' and
                                                    article.status == 'Pending for Employee')
                                                or
                                                (#session.STAFF.role == 'Manager' and
                                                article.status == 'Pending for Manager')}">
                                    <%--Approve--%>                                                          
                                    <form action="approveArticle" class="col-md-4" align="left">                                
                                        <s:hidden name="articleID" value="%{article.articleID}"/>
                                        <s:hidden name="status" value="%{article.status}"/>
                                        <s:hidden name="staffID" value="%{#session.STAFF.staffID}"/>
                                        <input type="submit" class="btn btn-success" value="Approve"/>
                                        <!--Reject button to show reject modal-->
                                    </form>
                                </s:if>
                                <%--Edit--%>
                                <form action="editArticle" class="col-md-4" align="center">
                                    <s:hidden name="articleID" value="%{article.articleID}"/>
                                    <input type="submit" class="btn btn-info" value="Edit"/>     
                                </form>
                                <%----%>
                                <s:if test="%{article.status != 'Rejected'}">
                                    <%--Reject--%>
                                    <div class="col-md-4" align="right">
                                        <button type="button" class="btn btn-danger"
                                                data-toggle="modal" data-target="#reason">
                                            Reject
                                        </button>
                                    </div>
                                    <div id="reason" class="modal fade" role="dialog">
                                        <div class="modal-dialog">
                                            <!-- Modal content-->
                                            <%--Input reason form--%>
                                            <form action="rejectArticle">
                                                <div class="modal-content">
                                                    <div class="modal-header">
                                                        <button type="button" class="close" data-dismiss="modal">&times;</button>
                                                        <h3 class="modal-title">Reason for Rejecting</h3>
                                                    </div>
                                                    <div class="modal-body">
                                                        <s:hidden name="staffID" value="%{#session.STAFF.staffID}"/>
                                                        <s:hidden name="articleID" value="%{article.articleID}"/>
                                                        <textarea name="txtReason" required="required" rows="5"
                                                                  class="form-control" placeholder="Input Reason"></textarea>
                                                    </div>
                                                    <div class="modal-footer">
                                                        <button type="button" class="btn btn-default" data-dismiss="modal">Cancel</button>
                                                        <button type="submit" class="btn btn-danger"/>Reject</button>
                                                    </div>
                                                </div>
                                            </form>
                                        </div>
                                    </div>
                                </s:if>
                            </s:if>                  
                        </s:else>
                    </div>
                </div>
            </s:if>
            
            <div class="col-md-12"><br/></div>
            
            <div class="col-md-8">
                <div class="article-detail">
                    <h4><b>Comments</b></h4>
                    <form action="sendComment">
                        <%--Send comment action --%>
                        <div class="col-md-8">
                            <textarea name="commentContent" class="form-control" rows="4" placeholder="Your comment"></textarea>
                            <s:if test="%{#parameters.message != null and #parameters.message != ''}">
                                <font color="red">               
                                <s:property value="%{#parameters.message}"/>
                                </font>
                            </s:if>
                        </div>
                        <div class="col-md-4">
                            <input class="comment-form" name="guestName" placeholder="Your name"/>
                            <input class="comment-form" name="guestPhone" placeholder="Phone number"/>
                            <input class="comment-form" name="guestEmail" placeholder="Email"/>
                            <s:hidden name="articleID" value="%{article.articleID}"/>
                            <input type="submit" class="btn btn-primary" value="Send"/>
                        </div>
                    </form>
                    <%--Show error comment message--%>
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
                                                <s:if test="%{#session.STAFF != null}">  
                                                    <td>
                                                    <%--Delete comment button--%>                                            
                                                        <s:submit value="x"/>
                                                        <s:hidden name="commentID" value="%{#comment.commentID}"/>
                                                        <s:hidden name="articleID" value="%{article.articleID}"/>                                            
                                                    </td>
                                                </s:if>
                                            </tr>                                
                                        </s:form>
                                    </s:iterator>
                                </tbody>
                            </table>
                        </s:if>
                    </div>
                </div>
            </div>
        </div>
    </body>
</html>

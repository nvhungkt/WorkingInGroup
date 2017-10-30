<%-- 
    Document   : upload
    Created on : Sep 30, 2017, 5:47:48 PM
    Author     : Administrator
--%>

<%@page import="java.util.Map"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="/struts-tags" prefix="s"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Upload Article</title>
    </head>
    <script>
        //Before uploading sth, get content from div to put into textarea
        function Upload(contentID, formID) {
            var editarea = document.getElementById('editarea');
            var content = document.getElementById(contentID);
            content.innerHTML = editarea.innerHTML;
            
            var lastTitle = document.getElementById('lastArticleTitle');
            lastTitle.innerHTML = document.getElementById('articleTitle').value;
            
            if (formID === 'uploadArticle') {
                var length = document.getElementById('articleTitle').value.length;
                if (length < 4 || length > 100) {
                    alert("Title must have 4 - 100 characters");
                    return;
                }
            }
            
            document.getElementById(formID).submit();
        }
    </script>
    <body>
        <s:include value="header.jsp"/>
        <div class="container">
            <font class="col-md-12 title">
                Upload new article
            </font>
            <i style="padding-left: 15px"><b>Write the article content here:</b></i>
            <form id="uploadArticle" action="finishUploadArticle" method="POST">
                <div class="col-md-8">
                    <div id="editarea" contentEditable="true">
                        ${requestScope.content}
                    </div>
                    <script type="text/javascript">
                        //When upload image, take content value from param and new image new from param
                        var editarea = document.getElementById('editarea');
//                        var str = '{requestScope.content}';
//                        editarea.innerHTML = str;
                        if ('${requestScope.fileUploadFileName}' !== '')
                        editarea.innerHTML += '<img src="Pictures/' + '${requestScope.fileUploadFileName}' + '">';
                    </script>
                    <textarea name="content" id="content" style="display: none"></textarea>
                </div>

                <div class="col-md-4">
                    <div class="editTool">
                        <input type="hidden" name="articleID" value="${requestScope.articleID}"/>
                        <input type="button" class="btn btn-success btn-block" value="Upload article"
                               onclick="Upload('content', 'uploadArticle')"/><br/>

                        <div class="form-group">
                            <label for="articleTitle">Title:</label>
                            <input id="articleTitle" class="form-control" type="text" name="title" value="${requestScope.article.title}${requestScope.title}"/>
                        </div>

                        <c:if test="${empty requestScope.articleID}">
                            <div class="form-group">
                                <label>Subcategory:</label>
                                <select name="subcategory" class="form-control">
                                    <s:iterator var="subcate" value="%{workingCategories}">
                                        <option value="<s:property value="%{#subcate.key}"/>"><s:property value="%{#subcate.value}"/></option>
                                    </s:iterator>
                                </select>
                            </div>
                        </c:if>
                    </div>
                </div>
            </form>
                        
            <form id="uploadimg" action="uploadimg" method="POST" enctype = "multipart/form-data"
                  class="col-md-4 form-inline">
                <div class="editTool">
                    <label class="btn btn-default btn-block">
                        Choose image
                        <input type="file" name="fileUpload" class="btn btn-default btn-block"
                               style="display: none" accept="image/*"/>
                    </label><br/>
                    <textarea name="title" id="lastArticleTitle" style="display: none"></textarea>
                    <input type="hidden" name="articleID" value="${requestScope.articleID}"/>
                    <textarea name="content" id="lastContent" style="display: none"></textarea>
                    <input type="button" class="btn btn-info btn-block" value="Upload image"
                           onclick="Upload('lastContent', 'uploadimg')"/>
                </div>
            </form>
        </div>
    </body>
</html>

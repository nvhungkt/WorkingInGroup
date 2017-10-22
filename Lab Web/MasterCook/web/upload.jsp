<%-- 
    Document   : upload
    Created on : Sep 30, 2017, 5:47:48 PM
    Author     : Administrator
--%>

<%@page import="java.util.Map"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="/struts-tags" prefix="s"%>
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
            document.getElementById(formID).submit();
        }
    </script>
    <body>
        <s:include value="header.jsp"/>
        <div class="container">
            <form id="uploadArticle" action="finishUploadArticle" method="POST">
                <div class="col-lg-8">
                    <div id="editarea" contentEditable="true">
                    </div>
                    <script type="text/javascript">
                        //When upload image, take content value from param and new image new from param
                        var editarea = document.getElementById('editarea');
                        var str = '${param.content}';
                        editarea.innerHTML = str;
                        if ('${param.fileUploadFileName}' !== '')
                        editarea.innerHTML += '<img src="Pictures/' + '${param.fileUploadFileName}' + '">';
                    </script>
                    <textarea name="content" id="content" style="display: none"></textarea>
                </div>

                <div class="col-lg-4 editTool">
                    <input type="hidden" name="articleID" value="${param.articleID}"/>
                    <input type="button" class="btn btn-success btn-block" value="Upload article"
                           onclick="Upload('content', 'uploadArticle')"/><br/>
                    
                    <div class="form-group">
                        <label for="articleTitle">Title:</label>
                        <input id="articleTitle" class="form-control" type="text" name="title" value="${param.title}"/>
                    </div>
                    
                    <div class="form-group">
                        <label>Subcategory:</label>
                        <select name="subcategory" class="form-control">
                            <s:iterator var="subcate" value="%{workingCategories}">
                                <option value="<s:property value="%{#subcate.key}"/>"><s:property value="%{#subcate.value}"/></option>
                            </s:iterator>
                        </select>
                    </div>
                </div>
            </form>

            <form id="uploadimg" action="uploadimg" method="POST" enctype = "multipart/form-data"
                  class="col-lg-4 editTool form-inline">
                <label class="btn btn-default btn-block">
                    Choose image
                    <input type="file" name="fileUpload" class="btn btn-default btn-block"
                           style="display: none" accept="image/*"/>
                </label><br/>
                <textarea name="title" id="lastArticleTitle" style="display: none"></textarea>
                <input type="hidden" name="articleID" value="${param.articleID}"/>
                <textarea name="content" id="lastContent" style="display: none"></textarea>
                <input type="button" class="btn btn-info btn-block" value="Upload image"
                       onclick="Upload('lastContent', 'uploadimg')"/>
            </form>
        </div>
    </body>
</html>

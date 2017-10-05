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
            document.getElementById(formID).submit();
        }
    </script>
    <body>
        <form id="uploadArticle" action="finishUploadArticle" method="POST">
            <div style="width: 70%; float: left">
                <div id="editarea" contentEditable="true" style="border: 1px solid black; min-height: 500px">
                </div>
                <script type="text/javascript">
                    //When upload image, take content value from param and new image new from param
                    var editarea = document.getElementById('editarea');
                    var str = '${param.content}';
                    console.log(str);
                    editarea.innerHTML = str;
                    if ('${param.fileUploadFileName}' !== '')
                    editarea.innerHTML += '<img src="Pictures/' + '${param.fileUploadFileName}' + '">';
                </script>
                <textarea name="content" id="content" style="display: none"></textarea>
            </div>
                
            <div style="width: 30%; float: left">
                <input type="button" value="Submit" onclick="Upload('content', 'uploadArticle')"/><br/>
                Title:<br/>
                <input type="text" name="title"/><br/>

                Subcategory:<br/>
                <select name="subcategory">
                    <s:iterator var="subcate" value="%{workingCategories}">
                        <option value="<s:property value="%{#subcate.key}"/>"><s:property value="%{#subcate.value}"/></option>
                    </s:iterator>
                </select>
            </div>
        </form>

        <form id="uploadimg" action="uploadimg" method="POST" enctype = "multipart/form-data"
              style="width: 30%; float: left">            
            <input type="file" name="fileUpload"/><br/>
            <textarea name="content" id="lastContent" style="display: none"></textarea>
            <input type="button" value="Upload" onclick="Upload('lastContent', 'uploadimg')"/>
        </form>
    </body>
</html>

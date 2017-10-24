<%-- 
    Document   : addSubCat
    Created on : Sep 30, 2017, 7:26:34 PM
    Author     : Administrator
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="/struts-tags" prefix="s"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>MasterCook</title>
        <link href="bootstrap/css/bootstrap.min.css" rel="stylesheet">
        <link rel="stylesheet" type="text/css" href="css/OurCss.css"/>
        <style>
            
            
        </style>
    </head>
    <body>
        <s:include value="header.jsp"/>
        <div class="col-md-4 col-md-offset-4" style="background-color: white">
            <h1>Add new subcategory</h1>
            
            <s:if test="%{error == 'Add successfull!!!'}">
                <label for="alertSuccess" class="label label-success addSubcatAlert"><s:property value="%{error}"/></label>
            </s:if>
            <s:if test="%{error != 'Add successfull!!!'}">
                <label for="alertEmptyName" class="label label-danger addSubcatAlert"><s:property value="%{error}"/></label>
            </s:if>
            <br/>
            
            <form action="addSubcat" onsubmit="return submitdata();">
                <div class="form-group">
                    <label for="selectParentCategory">Parent-category</label><br/>
                    <select name="catID" class="form-control">
                        <s:iterator var="cat" value="%{listCat}">
                            <option id="catName" value="<s:property value="%{#cat.categoryID}"/>">
                                <s:property value="%{#cat.name}"/>
                            </option>
                        </s:iterator>
                    </select>
                </div><br/>
                <div class="form-group">
                    <label for="inputName">Name*</label><br/>
                    <input type="text" class="form-control" name="subcatName" value="" id="subcatName" placeholder="Name"/>
                </div><br/>
                <div class="form-group">
                    <label for="inputDescription">Description</label><br/>
                    <input type="text" class="form-control" name="description" value="<s:property value="%{description}"/>" placeholder="Description"/><br/>
                </div>
                <input type="submit" value="Confirm" class="btn btn-primary btnAddSubcat"/>
            </form>
        </div>
        <s:include value="footer.html"/>
        <script>
        function submitdata() {
            var catName = document.getElementById("catName").value;
            var subcatName = document.getElementById("subcatName").value;
            return confirm("Add new subcategory '"+ subcatName +"' ?");
        }
        </script>
    </body>
</html>

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
    </head>
    <body>
        <s:include value="header.jsp"/>
        <h1>Add new subcategory</h1>
        <s:if test="%{error == 'Add successfull!!!'}">
            <font color="green"><s:property value="%{error}"/></font>
        </s:if><br/>
        <form action="addSubcat" onsubmit="return submitdata();" style="width: 25%">
            Parent-category<br/>
            <select name="catID">
                <s:iterator var="cat" value="%{listCat}">
                    <option id="catName" value="<s:property value="%{#cat.categoryID}"/>">
                        <s:property value="%{#cat.name}"/>
                    </option>
                </s:iterator>
            </select><br/>
            
            Name<br/>
            <input type="text" name="subcatName" value="" id="subcatName"/>
            <s:if test="%{error != 'Add successfull!!!'}">
                <font color="red"><s:property value="%{error}"/></font>
            </s:if><br/>
            Description<br/>
            <input type="text" name="description" value="<s:property value="%{description}"/>" id="subcatName"/><br/>
            <input type="submit" value="Confirm"/>
        </form>
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

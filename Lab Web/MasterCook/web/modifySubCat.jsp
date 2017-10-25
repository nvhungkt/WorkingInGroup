<%-- 
    Document   : modifySubCat
    Created on : Sep 30, 2017, 7:26:44 PM
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
    </head>
    <body>
        <s:include value="header.jsp"/>
        <div class="modifySubcatContainter">
            <h1>Modify subcategory</h1>
            <s:if test="%{listSubcat == null}">
                <label>
                    <h2>There is no subcategory</h2>
                </label>
            </s:if>
            <s:if test="%{listSubcat != null}">
                <table class="table table-responsive table-condensed table-hover table-bordered modifySubcatTable">
                    <thead>
                        <tr>
                            <th>No.</th>
                            <th>Name</th>
                            <th>Parent-category</th>
                            <th>Description</th>
                            <th>Active</th>
                            <th>Action</th>
                        </tr>
                    </thead>
                    <tbody>
                        <s:iterator var="subcat" value="%{listSubcat}" status="counter">
                            <s:form action="modifySubcat" theme="simple">
                                <tr class="TR" style="height: 60px">
                                    <td class="No"><s:property value="%{#counter.count}"/></td>
                                    <td>
                                        <input type="hidden" name="subcatID" value="<s:property value="%{#subcat.subcategoryID}"/>" />
                                        <input type="text" class="form-control" name="subcatName" value="<s:property value="%{#subcat.name}"/>" />
                                    </td>
                                    <td>
                                        <select name="catID" class="form-control">
                                            <s:iterator var="cat" value="%{listCat}">
                                                <option id="catName" value="<s:property value="%{#cat.categoryID}"/>"
                                                        <s:if test="%{#subcat.categoryID == #cat.categoryID}">
                                                            selected="selected"
                                                        </s:if>
                                                        >
                                                    <s:property value="%{#cat.name}"/>
                                                </option>
                                            </s:iterator>
                                        </select>
                                    </td>
                                    <td>
                                        <input type="text" class="form-control" placeholder="Description" name="description" value="<s:property value="%{#subcat.description}"/>" />
                                    </td>
                                    <td>
                                        <s:checkbox name="active" value="%{#subcat.isActive}"/>
                                    </td>
                                    <td>
                                        <input type="submit" class="btn btn-primary" value="Update" />
                                    </td>
                                </tr>
                            </s:form>
                        </s:iterator>
                    </tbody>
                </table>
            </s:if>
        </div>
        <s:include value="footer.html"/>
    </body>
</html>

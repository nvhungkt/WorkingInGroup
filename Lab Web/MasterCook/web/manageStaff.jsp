<%-- 
    Document   : manageStaff
    Created on : Sep 30, 2017, 8:15:16 PM
    Author     : Administrator
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="/struts-tags" prefix="s"%>
<%@taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Manage Staff</title>
    </head>
    <body>
        <s:include value="header.jsp"/>
        <div class="container">
            <h1 class="categoryTitle">Manage ${requestScope.type}</h1>
            <s:iterator var="staff" value="%{listStaff}">
                <s:if test="%{type == 'Collaborators'}">
                    <s:url var="staffUrl" value="viewStaffInfo">
                        <s:param name="staffID" value="%{#staff.collaboratorID}"/>
                    </s:url>
                    <s:a href="%{#staffUrl}">
                        <div class="col-md-6">
                            <div class="grid-staff">
                                <h3><s:property value="%{#staff.fullName}"/></h3>
                                <p class="col-md-6">Username: <s:property value="%{#staff.userName}"/></p>
                                <p class="col-md-6">Total accepted posts: <s:property value="%{#staff.numberOfAcceptedPosts}"/></p>
                                <p class="col-md-6">Has new post every <s:property value="%{#staff.averageTimeForNewPost}"/> hours</p>
                                <p class="col-md-6">Total pending posts: <s:property value="%{#staff.numberOfPendingPosts}"/></p>
                                <p class="col-md-6">Each post has <s:property value="%{#staff.averageViews}"/> views and <s:property value="%{#staff.averageComments}"/> comments</p>
                                <p class="col-md-6">Total rejected posts: <s:property value="%{#staff.numberOfRejectedPosts}"/></p>
                            </div>
                        </div>
                    </s:a>
                </s:if>

                <s:if test="%{type == 'Employees'}">
                    <s:url var="staffUrl" value="viewStaffInfo">
                        <s:param name="staffID" value="%{#staff.employeeID}"/>
                    </s:url>
                    <s:a href="%{#staffUrl}">
                        <div class="col-md-6">
                            <div class="grid-staff">
                                <h3><s:property value="%{#staff.fullName}"/></h3>
                                <p class="col-md-6">Username: <s:property value="%{#staff.userName}"/></p>
                                <p class="col-md-6">Has accepted <s:property value="%{#staff.numberOfAcceptedPosts}"/> posts</p>
                                <p class="col-md-6">Reviews posts every <s:property value="%{#staff.averageTimeForNewPost}"/> hours</p>
                                <p class="col-md-6">Has rejected <s:property value="%{#staff.numberOfRejectedPosts}"/> posts</p>
                                <p class="col-md-12">Each post has <s:property value="%{#staff.averageViews}"/> views and <s:property value="%{#staff.averageComments}"/> comments</p>
                            </div>
                        </div>
                    </s:a>
                </s:if>
            </s:iterator>
            <a href="createStaff">
                <div class="col-md-6">
                    <div class="grid-staff">
                        <div class="grid-staff-create">
                            <font>Create new staff</font>
                        </div>
                    </div>
                </div>
            </a>
            <script>
                $(window).on('resize', function(){
                    $('.grid-staff-create').outerHeight($('.grid-staff').height() - 40);
                }).trigger('resize');
            </script>
        </div>
    </body>
</html>

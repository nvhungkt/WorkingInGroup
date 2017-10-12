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
        <h1>Manage ${requestScope.type}</h1>
        <s:iterator var="staff" value="%{listStaff}">
            <s:if test="%{type == 'Collaborators'}">
                <div>
                    <h3><s:property value="%{#staff.fullName}"/></h3>
                    <i>ID will be hidden: <s:property value="%{#staff.collaboratorID}"/></i>
                    <p>Username: <s:property value="%{#staff.userName}"/></p>
                    <p>Has new post every <s:property value="%{#staff.averageTimeForNewPost}"/> hours</p>
                    <p>Each post has <s:property value="%{#staff.averageViews}"/> views and <s:property value="%{#staff.averageComments}"/> comments</p>
                    <p>Total accepted posts: <s:property value="%{#staff.numberOfAcceptedPosts}"/></p>
                    <p>Total pending posts: <s:property value="%{#staff.numberOfPendingPosts}"/></p>
                    <p>Total rejected posts: <s:property value="%{#staff.numberOfRejectedPosts}"/></p>
                </div>
            </s:if>
            
            <s:if test="%{type == 'Employees'}">
                <div>
                    <h3><s:property value="%{#staff.fullName}"/></h3>
                    <i>ID will be hidden: <s:property value="%{#staff.employeeID}"/></i>
                    <p>Username: <s:property value="%{#staff.userName}"/></p>
                    <p>Reviews posts every <s:property value="%{#staff.averageTimeForNewPost}"/> hours</p>
                    <p>Each post has <s:property value="%{#staff.averageViews}"/> views and <s:property value="%{#staff.averageComments}"/> comments</p>
                    <p>Has accepted <s:property value="%{#staff.numberOfAcceptedPosts}"/> posts</p>
                    <p>Has rejected <s:property value="%{#staff.numberOfRejectedPosts}"/> posts</p>
                </div>
            </s:if>
        </s:iterator>
        <div><hr/><h2>Create new staff</h2><hr/></div>
    </body>
</html>

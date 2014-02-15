
<%@ page import="defectMonitoring.User" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'user.label', default: 'User')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-user" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		
		<div id="page-body" role="main">
		
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
				<thead>
					<tr>
					
						<g:sortableColumn property="login" title="${message(code: 'user.login.label', default: 'Login')}" />
						<g:sortableColumn property="lastName" title="Name" />
						<g:sortableColumn property="status" title="${message(code: 'user.status.label', default: 'Status')}" />
						<g:sortableColumn property="blank" title="Action" />
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${userInstanceList}" status="i" var="userInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
						
						<td>${fieldValue(bean: userInstance, field: "login")}</td>
						<td>${fieldValue(bean: userInstance, field: "lastName")}, ${fieldValue(bean: userInstance, field: "firstName")} ${fieldValue(bean: userInstance, field: "middleInitial")}</td> 
						<td>${fieldValue(bean: userInstance, field: "status")}</td>
						<td>
							<g:link action="show" id="${userInstance.id}">View</g:link>
							<g:link class="editStatus" action="editStatus" id="${userInstance?.id}">Edit Status</g:link>
							<g:link class="editRole" action="editRole" id="${userInstance?.id}">Edit Role</g:link>
							<g:link class="changePassword" action="changePassword" id="${userInstance?.id}">Reset Password</g:link>
						</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${userInstanceTotal}" />
			</div>
		</div>
	</body>
</html>


<%@ page import="defectMonitoring.Project" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'project.label', default: 'Project')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-project" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		
		<div id="page-body" role="main">
		
			<h1>My Projects</h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
				<thead>
					<tr>
					
						<g:sortableColumn property="projectName" title="Name" />
					
						<g:sortableColumn property="dateCreated" title="Date" />
					
						<g:sortableColumn property="projectCreator" title="Creator" />
											
						<g:sortableColumn property="status" title="Status" />
						
						<g:sortableColumn property="blank" title="Action" />
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${projectInstanceList}" status="i" var="projectInstance">
					
					<g:each in="${projectInstance.users}" var="u">
						<g:if test="${u?.encodeAsHTML().toString().equals(session?.user.toString())}">
					
					
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td>${fieldValue(bean: projectInstance, field: "projectName")}</td>
						
						<td><g:formatDate type="date" style="MEDIUM" date="${projectInstance.dateCreated}" /></td>
						
						<td>${fieldValue(bean: projectInstance, field: "projectCreator")}</td>
					
						<td>${fieldValue(bean: projectInstance, field: "status")}</td>
					
						<td>
							
								<g:link action="show" id="${projectInstance.id}">View</g:link>
								<g:link action="editProjectInfo" id="${projectInstance.id}">Edit</g:link>
								<g:link action="editProjectStatus" id="${projectInstance.id}">Update Status</g:link>
						</td>
						
					</tr>
					
					</g:if>
					</g:each>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${projectInstanceTotal}" />
			</div>
		</div>
	</body>
</html>

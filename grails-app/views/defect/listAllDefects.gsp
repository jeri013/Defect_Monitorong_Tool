
<%@ page import="defectMonitoring.Defect" %>
<%@ page import="defectMonitoring.User" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'defect.label', default: 'Defect')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-defect" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		
		<div id="page-body" role="main">
		
			<h1>My Defects</h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table  width="60%">
				<thead>
					<tr>
					
						<g:sortableColumn property="defectName" title="${message(code: 'defect.defectName.label', default: 'Name')}" />
						
						<g:sortableColumn property="ticket" title="${message(code: 'defect.ticket.label', default: 'Ticket')}" />
					
						<g:sortableColumn property="defectSeverity" title="${message(code: 'defect.defectSeverity.label', default: 'Severity')}" />
						
						<g:sortableColumn property="environment" title="${message(code: 'defect.environment.label', default: 'Environment')}" />
					
						<g:sortableColumn property="defectStatus" title="${message(code: 'defect.defectStatus.label', default: 'Status')}" />
						
						<g:sortableColumn property="blank" title="Action" />
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${defectInstanceList}" status="i" var="defectInstance">
					
					<g:each in="${defectInstance.project.users}" var="u">
						<g:if test="${u?.encodeAsHTML().toString().equals(session?.user.toString())}">
							
							
							
						<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
							<td>${fieldValue(bean: defectInstance, field: "defectName")}</td>
							
							<td>${fieldValue(bean: defectInstance, field: "ticket")}</td>
						
							<td>${fieldValue(bean: defectInstance, field: "defectSeverity")}</td>
							
							<td>${fieldValue(bean: defectInstance, field: "environment")}</td>
							
							<td>${fieldValue(bean: defectInstance, field: "defectStatus")}</td>
													
							<td>
							
								<g:link action="show" id="${defectInstance.id}">View</g:link>
								<g:link action="edit" id="${defectInstance.id}">Edit</g:link>
								<g:link action="editDefectStatus" id="${defectInstance.id}">Update Status</g:link>
								
							</td>
						
						</tr>
					
					</g:if>
					</g:each>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${defectInstanceTotal}" />
			</div>
		</div>
	</body>
</html>

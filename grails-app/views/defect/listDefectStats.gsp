
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
					
						<g:sortableColumn property="defectName" title="Name" />
							
							<g:sortableColumn property="dateCreated" title="Date Filed" />
						
							<g:sortableColumn property="dateCreated" title="Age" />
						
							<g:sortableColumn property="defectStatus" title="Status" />
													
							<g:sortableColumn property="blank" title="Action" />
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${defectInstanceList}" status="i" var="defectInstance">
					
					
							
						<g:set var="age" value="${new Date() - defectInstance.dateCreated}" />
							
						<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
							<td>${fieldValue(bean: defectInstance, field: "defectName")}</td>
							
							<td><g:formatDate type="date" style="MEDIUM" date="${defectInstance.dateCreated}" /></td>
						
							<td>${age}</td>
							
							<td>${fieldValue(bean: defectInstance, field: "defectStatus")}</td>
						
							
							<td>
							
								<g:link action="stats" id="${defectInstance.id}">Statistics</g:link>
								
							</td>
						
						</tr>
					
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${defectInstanceTotal}" />
			</div>
		</div>
	</body>
</html>

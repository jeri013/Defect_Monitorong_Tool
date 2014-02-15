
<%@ page import="defectMonitoring.Project" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'project.label', default: 'Project')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-project" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		
		<div id="page-body" role="main">
			<g:if test="${projectInstance?.projectName}">
				<h1>${projectInstance?.projectName} Details</h1>
			</g:if>
			<g:else>
				<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			</g:else>
			
			
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list project">
			
				<%--<g:if test="${projectInstance?.projectName}">
				<li class="fieldcontain">
					<span id="projectName-label" class="property-label"><g:message code="project.projectName.label" default="Project Name" /></span>
					
						<span class="property-value" aria-labelledby="projectName-label"><g:fieldValue bean="${projectInstance}" field="projectName"/></span>
					
				</li>
				</g:if>--%>
			
				<g:if test="${projectInstance?.projectDescription}">
				<li class="fieldcontain">
					<span id="projectDescription-label" class="property-label"><g:message code="project.projectDescription.label" default="Project Description" /></span>
					
						<span class="property-value" aria-labelledby="projectDescription-label"><g:fieldValue bean="${projectInstance}" field="projectDescription"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${projectInstance?.status}">
				<li class="fieldcontain">
					<span id="status-label" class="property-label"><g:message code="project.status.label" default="Status" /></span>
					
						<span class="property-value" aria-labelledby="status-label"><g:fieldValue bean="${projectInstance}" field="status"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${projectInstance?.projectCreator}">
				<li class="fieldcontain">
					<span id="projectCreator-label" class="property-label"><g:message code="project.projectCreator.label" default="Project Creator" /></span>
					
						<span class="property-value" aria-labelledby="projectCreator-label"><g:fieldValue bean="${projectInstance}" field="projectCreator"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${projectInstance?.dateCreated}">
				<li class="fieldcontain">
					<span id="dateCreated-label" class="property-label"><g:message code="project.dateCreated.label" default="Date Created" /></span>
					
						<span class="property-value" aria-labelledby="dateCreated-label"><g:formatDate type="date" style="MEDIUM" date="${projectInstance?.dateCreated}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${projectInstance?.lastUpdated}">
				<li class="fieldcontain">
					<span id="lastUpdated-label" class="property-label"><g:message code="project.lastUpdated.label" default="Last Updated" /></span>
					
						<span class="property-value" aria-labelledby="lastUpdated-label"><g:formatDate type="date" style="MEDIUM" date="${projectInstance?.lastUpdated}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${projectInstance?.users}">
				<li class="fieldcontain">
					<span id="users-label" class="property-label"><g:message code="project.users.label" default="Users" /></span>
					
						<g:each in="${projectInstance.users}" var="u">
						<span class="property-value" aria-labelledby="users-label">
							<g:link controller="user" action="show" id="${u.id}">${u?.encodeAsHTML()}</g:link>
						</span>
						</g:each>
					
				</li>
				</g:if>
				
				<g:if test="${projectInstance?.defect}">
				<li class="fieldcontain">
					<span id="defect-label" class="property-label"><g:message code="project.defect.label" default="Defect" /></span>
					
						<g:each in="${projectInstance.defect}" var="d">
						<span class="property-value" aria-labelledby="defect-label"><g:link controller="defect" action="show" id="${d.id}">${d?.encodeAsHTML()}</g:link></span>
						</g:each>
					
				</li>
				</g:if>
				
				<g:if test="${projectInstance?.comments}">
				<li class="fieldcontain">
					<span id="comments-label" class="property-label"><g:message code="project.comments.label" default="Comments" /></span>
					
						<span class="property-value" aria-labelledby="comments-label"><g:fieldValue bean="${projectInstance}" field="comments"/></span>
					
				</li>
				</g:if>
				
			</ol>
			<g:form>
				<fieldset class="buttons">
					<g:hiddenField name="id" value="${projectInstance?.id}" />
					<g:link action="stats" id="${projectInstance?.id}">Statistics</g:link>
					<a class="home" href="${createLink(uri: '/')}">Cancel</a>
					<%--<g:link class="edit" action="edit" id="${projectInstance?.id}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />--%>
				</fieldset>
			</g:form>
		</div>
	</body>
</html>

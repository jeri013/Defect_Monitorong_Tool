
<%@ page import="defectMonitoring.Project" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'project.label', default: 'Project')}" />
		<title>Defect Statistics</title>
	</head>
	<body>
		<a href="#show-project" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		
		<div id="page-body" role="main">
			<h1>${defectInstance?.defectName} Statistics</h1>
			</br>
			<h4>Defect Status: ${defectInstance?.defectStatus}</h4>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			
			<ol class="property-list defect">
			
				<g:if test="${defectInstance?.project}">
				<li class="fieldcontain">
					<span id="project-label" class="property-label"><g:message code="defect.project.label" default="Project" /></span>
					
						<span class="property-value" aria-labelledby="project-label"><g:link controller="project" action="show" id="${defectInstance?.project?.id}">${defectInstance?.project?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
				
				<g:if test="${defectInstance?.dateCreated}">
				<li class="fieldcontain">
					<span id="stgDeploymentDate-label" class="property-label">Date Filed </span>
					
						<span class="property-value" aria-labelledby="stgDeploymentDate-label"><g:formatDate type="date" style="MEDIUM" date="${defectInstance?.dateCreated}" /></span>
					
				</li>
				</g:if>
				
				<g:if test="${defectInstance?.lastUpdated}">
				<li class="fieldcontain">
					<span id="stgDeploymentDate-label" class="property-label">last Updated </span>
					
						<span class="property-value" aria-labelledby="stgDeploymentDate-label"><g:formatDate type="date" style="MEDIUM" date="${defectInstance?.lastUpdated}" /></span>
					
				</li>
				</g:if>
				
				<g:set var="age" value="${new Date() - defectInstance.dateCreated}" />
				
				<g:if test="${defectInstance?.dateCreated}">
				<li class="fieldcontain">
					<span id="stgDeploymentDate-label" class="property-label">Defect Age </span>
					
						<span class="property-value" aria-labelledby="stgDeploymentDate-label">${age}</span>
					
				</li>
				</g:if>
				
			</ol>
			
			<g:form>
				<fieldset class="buttons">
					<g:hiddenField name="id" value="${projectInstance?.id}" />
					<a class="home" href="${createLink(uri: '/')}">Cancel</a>
					<%--<g:link class="edit" action="edit" id="${projectInstance?.id}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />--%>
				</fieldset>
			</g:form>
		</div>
	</body>
</html>

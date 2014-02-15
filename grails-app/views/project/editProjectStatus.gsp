<%@ page import="defectMonitoring.Project" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'project.label', default: 'Project')}" />
		<title><g:message code="default.edit.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#edit-project" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		
		<div id="page-body" role="main">
		
			<g:if test="${projectInstance?.projectName}">
				<h1>Edit ${projectInstance?.projectName} Status</h1>
			</g:if>
			<g:else>
				<h1><g:message code="default.edit.label" args="[entityName]" /></h1>
			</g:else>
			
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<g:hasErrors bean="${projectInstance}">
			<ul class="errors" role="alert">
				<g:eachError bean="${projectInstance}" var="error">
				<li <g:if test="${error in org.springframework.validation.FieldError}">data-field-id="${error.field}"</g:if>><g:message error="${error}"/></li>
				</g:eachError>
			</ul>
			</g:hasErrors>
			<g:form method="post" >
				
				<g:hiddenField name="id" value="${projectInstance?.id}" />
				<g:hiddenField name="version" value="${projectInstance?.version}" />
				<g:hiddenField name="projectName" value="${projectInstance?.projectName}" />
				<g:hiddenField name="projectDescription" value="${projectInstance?.projectDescription}" />
				<g:hiddenField name="comments" value="${projectInstance?.comments}" />
				<g:hiddenField name="projectCreator" value="${projectInstance?.projectCreator}" />
				
				<fieldset class="form">
				
				<div class="fieldcontain ${hasErrors(bean: projectInstance, field: 'status', 'error')} ">
					<label for="status"> <g:message code="project.status.label"
							default="Status" /></label>
					<g:select name="status"
						from="${projectInstance.constraints.status.inList}"
						value="${projectInstance?.status}"
						valueMessagePrefix="project.status" />
				</div>


			</fieldset>
				<fieldset class="buttons">
					<g:actionSubmit class="save" action="update" value="${message(code: 'default.button.update.label', default: 'Update')}" />
					<a class="home" href="${createLink(uri: '/')}">Cancel</a>
				</fieldset>
			</g:form>
		</div>
	</body>
</html>

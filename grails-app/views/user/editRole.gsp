<%@ page import="defectMonitoring.User" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'user.label', default: 'User')}" />
		<title><g:message code="default.edit.label" args="[entityName]" /></title>
	</head>
	<body>
		
		<a href="#edit-user" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
				
			<div id="page-body" role="main">
		
			
			
			<g:if test="${userInstance?.login}">
				<h1>Edit ${userInstance?.login} Details</h1>
			</g:if>
			<g:else>
				<h1><g:message code="default.edit.label" args="[entityName]" /></h1>
			</g:else>
			
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			
			<g:hasErrors bean="${userInstance}">
			<ul class="errors" role="alert">
				<g:eachError bean="${userInstance}" var="error">
				<li <g:if test="${error in org.springframework.validation.FieldError}">data-field-id="${error.field}"</g:if>><g:message error="${error}"/></li>
				</g:eachError>
			</ul>
			</g:hasErrors>
			
			<g:form method="post" >
				<g:hiddenField name="id" value="${userInstance?.id}" />
				<g:hiddenField name="version" value="${userInstance?.version}" />
				<g:hiddenField name="status" value="${userInstance?.status}" />
				
				<g:hiddenField name="login" value="${userInstance?.login}" />
				<g:hiddenField name="password" value="${userInstance?.password}" />
				<g:hiddenField name="firstName" value="${userInstance?.firstName}" />
				<g:hiddenField name="middleInitial" value="${userInstance?.middleInitial}" />
				<g:hiddenField name="lastName" value="${userInstance?.lastName}" />
				<g:hiddenField name="email" value="${userInstance?.email}" />
				
				<fieldset class="form">

				<h1>User: ${userInstance?.lastName}, ${userInstance?.firstName} ${userInstance?.middleInitial}</h1>
				
				
				<div class="fieldcontain ${hasErrors(bean: userInstance, field: 'role', 'error')} ">
					<label for="role"> <g:message code="user.role.label" default="Role" /> </label>
					<g:select name="role"
						from="${userInstance.constraints.role.inList}"
						value="${userInstance?.role}" valueMessagePrefix="user.role"/>
				</div>
				



			</fieldset>
				<fieldset class="buttons">
					<g:actionSubmit class="save" action="update" value="${message(code: 'default.button.update.label', default: 'Update')}" />
					<g:actionSubmit class="index" action="index" value="Cancel" />
				</fieldset>
			</g:form>
			
		</div>
	</body>
</html>

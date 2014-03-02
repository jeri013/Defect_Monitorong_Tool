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
		
			<h1>Edit ${userInstance?.login} Information</h1>
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
				<g:hiddenField name="role" value="${userInstance?.role}" />
				<g:hiddenField name="status" value="${userInstance?.status}" />
				<g:hiddenField name="login" value="${userInstance?.login}" />
				<g:hiddenField name="password" value="${userInstance?.password}" />
				
					<fieldset class="form">
	
					<div
						class="fieldcontain ${hasErrors(bean: userInstance, field: 'firstName', 'error')} required">
						<label for="firstName"> <g:message
								code="user.firstName.label" default="First Name" /> <span
							class="required-indicator">*</span>
						</label>
						<g:textField name="firstName" maxlength="20" required=""
							value="${userInstance?.firstName}" />
					</div>

				<div
					class="fieldcontain ${hasErrors(bean: userInstance, field: 'middleInitial', 'error')} ">
					<label for="middleInitial"> <g:message
							code="user.middleInitial.label" default="Middle Initial" />

					</label>
					<g:textField name="middleInitial" maxlength="2"
						value="${userInstance?.middleInitial}" />
				</div>

				<div
					class="fieldcontain ${hasErrors(bean: userInstance, field: 'lastName', 'error')} required">
					<label for="lastName"> <g:message
							code="user.lastName.label" default="Last Name" /> <span
						class="required-indicator">*</span>
					</label>
					<g:textField name="lastName" maxlength="20" required=""
						value="${userInstance?.lastName}" />
				</div>

				<div
					class="fieldcontain ${hasErrors(bean: userInstance, field: 'email', 'error')} ">
					<label for="email"> <g:message code="user.email.label"
							default="Email" />

					</label>
					<g:field type="email" name="email" value="${userInstance?.email}" />
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

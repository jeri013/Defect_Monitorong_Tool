<%@ page import="defectMonitoring.User" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'user.label', default: 'User')}" />
		<title><g:message code="default.create.label" args="[entityName]" /></title>
	</head>
	<body>
		
		<a href="#create-user" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		
		<div id="page-body" role="main">
			
			<h1><g:message code="default.create.label" args="[entityName]" /></h1>
			
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
			
			<g:form action="save" >
				<fieldset class="form">
					<div class="dialog">
					<div class="fieldcontain ${hasErrors(bean: userInstance, field: 'login', 'error')} required">
						<label for="login">
							<g:message code="user.login.label" default="Login" />
							<span class="required-indicator">*</span>
						</label>
						<g:textField name="login" maxlength="20" required="" value="${userInstance?.login}"/>
					</div>
					
					<div class="fieldcontain ${hasErrors(bean: userInstance, field: 'password', 'error')} required">
						<label for="password">
							<g:message code="user.password.label" default="Password" />
							<span class="required-indicator">*</span>
						</label>
						<g:field type="password" name="password" maxlength="15" required="" value="${userInstance?.password}"/>
					</div>
					
					<div class="fieldcontain ${hasErrors(bean: userInstance, field: 'firstName', 'error')} required">
						<label for="firstName">
							<g:message code="user.firstName.label" default="First Name" />
							<span class="required-indicator">*</span>
						</label>
						<g:textField name="firstName" maxlength="20" required="" value="${userInstance?.firstName}"/>
					</div>
					
					<div class="fieldcontain ${hasErrors(bean: userInstance, field: 'middleInitial', 'error')} ">
						<label for="middleInitial">
							<g:message code="user.middleInitial.label" default="Middle Initial" />
							
						</label>
						<g:textField name="middleInitial" maxlength="2" value="${userInstance?.middleInitial}"/>
					</div>
					
					<div class="fieldcontain ${hasErrors(bean: userInstance, field: 'lastName', 'error')} required">
						<label for="lastName">
							<g:message code="user.lastName.label" default="Last Name" />
							<span class="required-indicator">*</span>
						</label>
						<g:textField name="lastName" maxlength="20" required="" value="${userInstance?.lastName}"/>
					</div>
					
					<div class="fieldcontain ${hasErrors(bean: userInstance, field: 'email', 'error')} ">
						<label for="email">
							<g:message code="user.email.label" default="Email" />
							
						</label>
						<g:field type="email" name="email" value="${userInstance?.email}"/>
					</div>
					
					<div class="fieldcontain ${hasErrors(bean: userInstance, field: 'role', 'error')} ">
						<label for="role">
							<g:message code="user.role.label" default="Role" />
							
						</label>
						<g:select name="role" from="${userInstance.constraints.role.inList}" value="${userInstance?.role}" valueMessagePrefix="user.role" noSelection="['': '']"/>
					</div>
					
					<div class="fieldcontain ${hasErrors(bean: userInstance, field: 'status', 'error')} ">
						<%--<label for="status">
							<g:message code="user.status.label" default="Status" />
							
						</label>--%>
						<%--<g:select name="status" from="${userInstance.constraints.status.inList}" value="${userInstance?.status}" valueMessagePrefix="user.status" noSelection="['': '']"/>--%>
						<g:hiddenField name="status" value="${userInstance?.status}" />
					</div>
                   	</div>
				</fieldset>
				<fieldset class="buttons">
					<g:submitButton name="create" class="save" value="${message(code: 'default.button.create.label', default: 'Create')}" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>

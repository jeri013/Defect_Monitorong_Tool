<%@ page import="defectMonitoring.Defect" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'defect.label', default: 'Defect')}" />
		<title><g:message code="default.create.label" args="[entityName]" /></title>
		
	</head>
	<body>
		<a href="#create-defect" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		
		<div id="page-body" role="main">
		
			<h1>Search</h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<g:hasErrors bean="${defectInstance}">
			<ul class="errors" role="alert">
				<g:eachError bean="${defectInstance}" var="error">
				<li <g:if test="${error in org.springframework.validation.FieldError}">data-field-id="${error.field}"</g:if>><g:message error="${error}"/></li>
				</g:eachError>
			</ul>
			</g:hasErrors>
			
			<g:form url='[controller: "search", action: "index"]' id="searchableForm" name="searchableForm" method="get">
        		<g:textField name="q" value="${params.q}" size="50"/> <input type="submit" value="Search" />
    		</g:form>
			
		</div>
	</body>
</html>

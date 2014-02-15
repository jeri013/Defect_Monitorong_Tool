<%@ page import="defectMonitoring.Defect" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'defect.label', default: 'Defect')}" />
		<title><g:message code="default.edit.label" args="[entityName]" /></title>
		<g:javascript>
		  Event.observe(window, 'load', changeTest(), false);
		  </g:javascript> 
		<script type="text/javascript">
		
			function changeTest() {
				if(document.getElementById('defectStatus').value == "Done" ||document.getElementById('defectStatus').value == "Resolved (no fix)" ||document.getElementById('defectStatus').value == "Rejected")
				{
					document.getElementById('resolution').disabled = false;
					document.getElementById('resolution').style.borderColor="red"
					document.getElementById('labelStatus').style.color="gray"
					document.getElementById('resolution').style.color="black"
					document.getElementById('resDiv').style.display="block"
					
				}
				else
				{
					document.getElementById('resolution').disabled = true;
					document.getElementById('resolution').style.borderColor="white"
					document.getElementById('labelStatus').style.color="white"
					document.getElementById('resolution').style.color="white"
					document.getElementById('resDiv').style.display="none"
					
				}
				
				
			}
		</script>
				
	</head>
	<body onLoad="changeTest(document)">
		<a href="#edit-defect" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		
		<div id="page-body" role="main">
		
			<g:if test="${defectInstance?.defectName}">
				<h1>Edit ${defectInstance?.defectName} Status</h1>
			</g:if>
			<g:else>
				<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			</g:else>
			
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
			<g:form method="post">
				<g:hiddenField name="id" value="${defectInstance?.id}" />
				<g:hiddenField name="version" value="${defectInstance?.version}" />
				<g:hiddenField name="reporter" value="${defectInstance?.reporter}" />
				
				<fieldset class="form">

				<div class="fieldcontain ${hasErrors(bean: defectInstance, field: 'defectStatus', 'error')} ">
						<label for="defectStatus" >
							<g:message code="defect.defectStatus.label" default="Defect Status" />
						</label>
						<g:select name="defectStatus" id="defectStatus" from="${defectInstance.constraints.defectStatus.inList}" 
						value="${defectInstance?.defectStatus}" valueMessagePrefix="defect.defectStatus" onchange="changeTest()"/>
					</div>

				<div id="resDiv"
					class="fieldcontain ${hasErrors(bean: defectInstance, field: 'resolution', 'error')} ">
					<label for="resolution" id="labelStatus"> Resolution</label>
					<g:textArea name="resolution" id="resolution" cols="20" rows="3" maxlength="500"
						value="${defectInstance?.resolution}" disabled="true" />
				</div>
			</fieldset>
				<fieldset class="buttons">
					<g:actionSubmit class="save" action="update" value="${message(code: 'default.button.update.label', default: 'Update')}"/>					
					<a class="home" href="${createLink(uri: '/')}">Cancel</a>
				</fieldset>
			</g:form>
		</div>
	</body>
</html>

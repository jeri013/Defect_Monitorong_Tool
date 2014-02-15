<%@ page import="defectMonitoring.Defect" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'defect.label', default: 'Defect')}" />
		<title><g:message code="default.edit.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#edit-defect" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		
		<div id="page-body" role="main">
		
			<g:if test="${defectInstance?.defectName}">
				<h1>Edit ${defectInstance?.defectName} Details</h1>
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
			<g:form method="post" >
				<g:hiddenField name="id" value="${defectInstance?.id}" />
				<g:hiddenField name="version" value="${defectInstance?.version}" />
				<g:hiddenField name="defectStatus" value="${defectInstance?.defectStatus}" />
				<g:hiddenField name="reporter" value="${defectInstance?.reporter}" />
				
				<fieldset class="form">
										
					<div class="fieldcontain ${hasErrors(bean: defectInstance, field: 'defectName', 'error')} required">
						<label for="defectName">
							<g:message code="defect.defectName.label" default="Defect Name" />
							<span class="required-indicator">*</span>
						</label>
						<g:textField name="defectName" maxlength="50" required="" value="${defectInstance?.defectName}"/>
					</div>
					
					<div class="fieldcontain ${hasErrors(bean: defectInstance, field: 'ticket', 'error')} ">
						<label for="ticket">
							<g:message code="defect.ticket.label" default="Ticket" />
						</label>
						<g:textField name="ticket" maxlength="50" value="${defectInstance?.ticket}"/>
					</div>
						
					<div class="fieldcontain ${hasErrors(bean: defectInstance, field: 'project', 'error')} required">
						<label for="project">
							<g:message code="defect.project.label" default="Project" />
							<span class="required-indicator">*</span>
						</label>
						<g:select id="project" name="project.id" from="${defectMonitoring.Project.findAllByStatus('OPEN')}" optionKey="id" required="" value="${defectInstance?.project?.id}" class="many-to-one"/>
					</div>			
										
					<div class="fieldcontain ${hasErrors(bean: defectInstance, field: 'defectOverview', 'error')} required">
						<label for="defectOverview">
							<g:message code="defect.defectOverview.label" default="Defect Overview" />
							<span class="required-indicator">*</span>
						</label>
						<g:textArea name="defectOverview" cols="40" rows="5" maxlength="500" required="" value="${defectInstance?.defectOverview}"/>
					</div>
					
					<div class="fieldcontain ${hasErrors(bean: defectInstance, field: 'environment', 'error')} ">
						<label for="environment">
							<g:message code="defect.environment.label" default="Environment" />
						</label>
						<g:select name="environment" from="${defectInstance.constraints.environment.inList}" value="${defectInstance?.environment}" valueMessagePrefix="defect.environment"/>
					</div>
					
					<div class="fieldcontain ${hasErrors(bean: defectInstance, field: 'stgDeploymentDate', 'error')}">
						<label for="stgDeploymentDate">
							<g:message code="defect.stgDeploymentDate.label" default="Staging Deployment Date" />
						</label>
						<g:datePicker name="stgDeploymentDate" precision="day"  value="${defectInstance?.stgDeploymentDate}"  />
					</div>
					
					<div class="fieldcontain ${hasErrors(bean: defectInstance, field: 'releaseVersion', 'error')} ">
						<label for="releaseVersion">
							<g:message code="defect.releaseVersion.label" default="Release Version" />
						</label>
						<g:textField name="releaseVersion" maxlength="10" value="${defectInstance?.releaseVersion}"/>
					</div>
					
					<div class="fieldcontain ${hasErrors(bean: defectInstance, field: 'stepsToReproduce', 'error')} required">
						<label for="stepsToReproduce">
							<g:message code="defect.stepsToReproduce.label" default="Steps To Reproduce" />
							<span class="required-indicator">*</span>
						</label>
						<g:textArea name="stepsToReproduce" cols="40" rows="5" maxlength="500" required="" value="${defectInstance?.stepsToReproduce}"/>
					</div>
					
					<div class="fieldcontain ${hasErrors(bean: defectInstance, field: 'defectSeverity', 'error')} ">
						<label for="defectSeverity">
							<g:message code="defect.defectSeverity.label" default="Defect Severity" />
							
						</label>
						<g:select name="defectSeverity" from="${defectInstance.constraints.defectSeverity.inList}" value="${defectInstance?.defectSeverity}" valueMessagePrefix="defect.defectSeverity"/>
					</div>

					<g:if test="${defectMonitoring.Defect.count() > 0}">
						<div
							class="fieldcontain ${hasErrors(bean: defectInstance, field: 'relatedTo', 'error')} ">
							<label for="relatedTo"> <g:message
									code="defect.relatedTo.label" default="Related To" />
							</label>
							<g:select id="s" name="defects"
								from="${defectMonitoring.Defect.list()}" optionKey="id"
								onChange="listbox_moveacross('s','d')" size="5"
								multiple="multiple" style="width:100px;font-size: 9px" />
							<g:select id="d" name="relatedTo" from="${[]}" optionKey="id"
								size="5" multiple="multiple"
								value="${defectInstance?.relatedTo*.id}" class="many-to-many"
								onChange="listbox_moveacross('d','s')"
								style="width:100px;font-size: 9px" />
							<label style="font-size: 8px; font-color: red; text-align: left">Add
								related defects by selecting from left. Remove related defects by
								selecting from the right.</label>
							<%--<g:select name="relatedTo" from="${defectMonitoring.Defect.list()}" multiple="multiple" optionKey="id" size="5" value="${defectInstance?.relatedTo*.id}" class="many-to-many" />--%>
						</div>
					</g:if>



					<div class="fieldcontain ${hasErrors(bean: defectInstance, field: 'comments', 'error')} ">
						<label for="comments">
							<g:message code="defect.comments.label" default="Comments" />
							
						</label>
						<g:textArea name="comments" cols="40" rows="5" maxlength="500" value="${defectInstance?.comments}"/>
					</div>
					
				</fieldset>
				<fieldset class="buttons">
					<g:actionSubmit class="save" action="update" value="${message(code: 'default.button.update.label', default: 'Update')}" />
					<%--<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" formnovalidate="" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />--%>
					<a class="home" href="${createLink(uri: '/')}">Cancel</a>
				</fieldset>
			</g:form>
		</div>
	</body>
</html>

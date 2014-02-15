<%@ page import="defectMonitoring.Defect" %>



<div class="fieldcontain ${hasErrors(bean: defectInstance, field: 'ticket', 'error')} ">
	<label for="ticket">
		<g:message code="defect.ticket.label" default="Ticket" />
		
	</label>
	<g:textField name="ticket" maxlength="50" value="${defectInstance?.ticket}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: defectInstance, field: 'defectName', 'error')} required">
	<label for="defectName">
		<g:message code="defect.defectName.label" default="Defect Name" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="defectName" maxlength="50" required="" value="${defectInstance?.defectName}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: defectInstance, field: 'defectOverview', 'error')} required">
	<label for="defectOverview">
		<g:message code="defect.defectOverview.label" default="Defect Overview" />
		<span class="required-indicator">*</span>
	</label>
	<g:textArea name="defectOverview" cols="40" rows="5" maxlength="500" required="" value="${defectInstance?.defectOverview}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: defectInstance, field: 'stepsToReproduce', 'error')} required">
	<label for="stepsToReproduce">
		<g:message code="defect.stepsToReproduce.label" default="Steps To Reproduce" />
		<span class="required-indicator">*</span>
	</label>
	<g:textArea name="stepsToReproduce" cols="40" rows="5" maxlength="500" required="" value="${defectInstance?.stepsToReproduce}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: defectInstance, field: 'comments', 'error')} ">
	<label for="comments">
		<g:message code="defect.comments.label" default="Comments" />
		
	</label>
	<g:textArea name="comments" cols="40" rows="5" maxlength="500" value="${defectInstance?.comments}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: defectInstance, field: 'resolution', 'error')} ">
	<label for="resolution">
		<g:message code="defect.resolution.label" default="Resolution" />
		
	</label>
	<g:textArea name="resolution" cols="40" rows="5" maxlength="500" value="${defectInstance?.resolution}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: defectInstance, field: 'environment', 'error')} ">
	<label for="environment">
		<g:message code="defect.environment.label" default="Environment" />
		
	</label>
	<g:select name="environment" from="${defectInstance.constraints.environment.inList}" value="${defectInstance?.environment}" valueMessagePrefix="defect.environment" noSelection="['': '']"/>
</div>

<div class="fieldcontain ${hasErrors(bean: defectInstance, field: 'defectStatus', 'error')} ">
	<label for="defectStatus">
		<g:message code="defect.defectStatus.label" default="Defect Status" />
		
	</label>
	<g:select name="defectStatus" from="${defectInstance.constraints.defectStatus.inList}" value="${defectInstance?.defectStatus}" valueMessagePrefix="defect.defectStatus" noSelection="['': '']"/>
</div>

<div class="fieldcontain ${hasErrors(bean: defectInstance, field: 'defectSeverity', 'error')} ">
	<label for="defectSeverity">
		<g:message code="defect.defectSeverity.label" default="Defect Severity" />
		
	</label>
	<g:select name="defectSeverity" from="${defectInstance.constraints.defectSeverity.inList}" value="${defectInstance?.defectSeverity}" valueMessagePrefix="defect.defectSeverity" noSelection="['': '']"/>
</div>

<div class="fieldcontain ${hasErrors(bean: defectInstance, field: 'releaseVersion', 'error')} ">
	<label for="releaseVersion">
		<g:message code="defect.releaseVersion.label" default="Release Version" />
		
	</label>
	<g:textField name="releaseVersion" maxlength="10" value="${defectInstance?.releaseVersion}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: defectInstance, field: 'reporter', 'error')} required">
	<label for="reporter">
		<g:message code="defect.reporter.label" default="Reporter" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="reporter" required="" value="${defectInstance?.reporter}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: defectInstance, field: 'project', 'error')} required">
	<label for="project">
		<g:message code="defect.project.label" default="Project" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="project" name="project.id" from="${defectMonitoring.Project.list()}" optionKey="id" required="" value="${defectInstance?.project?.id}" class="many-to-one"/>
</div>

<div class="fieldcontain ${hasErrors(bean: defectInstance, field: 'relatedTo', 'error')} ">
	<label for="relatedTo">
		<g:message code="defect.relatedTo.label" default="Related To" />
		
	</label>
	<g:select name="relatedTo" from="${defectMonitoring.Defect.list()}" multiple="multiple" optionKey="id" size="5" value="${defectInstance?.relatedTo*.id}" class="many-to-many"/>
</div>

<div class="fieldcontain ${hasErrors(bean: defectInstance, field: 'stgDeploymentDate', 'error')} required">
	<label for="stgDeploymentDate">
		<g:message code="defect.stgDeploymentDate.label" default="Stg Deployment Date" />
		<span class="required-indicator">*</span>
	</label>
	<g:datePicker name="stgDeploymentDate" precision="day"  value="${defectInstance?.stgDeploymentDate}"  />
</div>



<%@ page import="defectMonitoring.Defect" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'defect.label', default: 'Defect')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-defect" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div id="page-body" role="main">
			
			<g:if test="${defectInstance?.defectName}">
				<h1>${defectInstance?.defectName} Details</h1>
			</g:if>
			<g:else>
				<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			</g:else>
			
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
				
				<g:if test="${defectInstance?.ticket}">
				<li class="fieldcontain">
					<span id="ticket-label" class="property-label"><g:message code="defect.ticket.label" default="Ticket" /></span>
					
						<span class="property-value" aria-labelledby="ticket-label"><g:fieldValue bean="${defectInstance}" field="ticket"/></span>
					
				</li>
				</g:if>
			
				<%--<g:if test="${defectInstance?.defectName}">
				<li class="fieldcontain">
					<span id="defectName-label" class="property-label"><g:message code="defect.defectName.label" default="Defect Name" /></span>
					
						<span class="property-value" aria-labelledby="defectName-label"><g:fieldValue bean="${defectInstance}" field="defectName"/></span>
					
				</li>
				</g:if>--%>
			
				<g:if test="${defectInstance?.defectOverview}">
				<li class="fieldcontain">
					<span id="defectOverview-label" class="property-label"><g:message code="defect.defectOverview.label" default="Overview" /></span>
					
						<span class="property-value" aria-labelledby="defectOverview-label"><g:fieldValue bean="${defectInstance}" field="defectOverview"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${defectInstance?.stepsToReproduce}">
				<li class="fieldcontain">
					<span id="stepsToReproduce-label" class="property-label"><g:message code="defect.stepsToReproduce.label" default="Steps To Reproduce" /></span>
					
						<span class="property-value" aria-labelledby="stepsToReproduce-label"><g:fieldValue bean="${defectInstance}" field="stepsToReproduce"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${defectInstance?.defectSeverity}">
				<li class="fieldcontain">
					<span id="defectSeverity-label" class="property-label"><g:message code="defect.defectSeverity.label" default="Defect Severity" /></span>
					
						<span class="property-value" aria-labelledby="defectSeverity-label"><g:fieldValue bean="${defectInstance}" field="defectSeverity"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${defectInstance?.environment}">
				<li class="fieldcontain">
					<span id="environment-label" class="property-label"><g:message code="defect.environment.label" default="Environment" /></span>
					
						<span class="property-value" aria-labelledby="environment-label"><g:fieldValue bean="${defectInstance}" field="environment"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${defectInstance?.defectStatus}">
				<li class="fieldcontain">
					<span id="defectStatus-label" class="property-label"><g:message code="defect.defectStatus.label" default="Defect Status" /></span>
					
						<span class="property-value" aria-labelledby="defectStatus-label"><g:fieldValue bean="${defectInstance}" field="defectStatus"/></span>
					
				</li>
				</g:if>
							
				<g:if test="${defectInstance?.releaseVersion}">
				<li class="fieldcontain">
					<span id="releaseVersion-label" class="property-label"><g:message code="defect.releaseVersion.label" default="Release Version" /></span>
					
						<span class="property-value" aria-labelledby="release-label"><g:fieldValue bean="${defectInstance}" field="releaseVersion"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${defectInstance?.reporter}">
				<li class="fieldcontain">
					<span id="reporter-label" class="property-label"><g:message code="defect.reporter.label" default="Reporter" /></span>
					
						<span class="property-value" aria-labelledby="reporter-label"><g:fieldValue bean="${defectInstance}" field="reporter"/></span>
					
				</li>
				</g:if>
			
				
			
				<g:if test="${defectInstance?.relatedTo}">
				<li class="fieldcontain">
					<span id="relatedTo-label" class="property-label"><g:message code="defect.relatedTo.label" default="Related To" /></span>
					
						<g:each in="${defectInstance.relatedTo}" var="r">
						<span class="property-value" aria-labelledby="relatedTo-label"><g:link controller="defect" action="show" id="${r.id}">${r?.encodeAsHTML()}</g:link></span>
						</g:each>
					
				</li>
				</g:if>
			
				<g:if test="${defectInstance?.stgDeploymentDate}">
				<li class="fieldcontain">
					<span id="stgDeploymentDate-label" class="property-label"><g:message code="defect.stgDeploymentDate.label" default="Stg Deployment Date" /></span>
					
						<span class="property-value" aria-labelledby="stgDeploymentDate-label"><g:formatDate type="date" style="MEDIUM" date="${defectInstance?.stgDeploymentDate}" /></span>
					
				</li>
				</g:if>
				
				<g:if test="${defectInstance?.comments}">
				<li class="fieldcontain">
					<span id="comments-label" class="property-label"><g:message code="defect.comments.label" default="Comments" /></span>
					
						<span class="property-value" aria-labelledby="comments-label"><g:fieldValue bean="${defectInstance}" field="comments"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${defectInstance?.resolution}">
				<li class="fieldcontain">
					<span id="resolution-label" class="property-label"><g:message code="defect.resolution.label" default="Resolution" /></span>
					
						<span class="property-value" aria-labelledby="resolution-label"><g:fieldValue bean="${defectInstance}" field="resolution"/></span>
					
				</li>
				</g:if>
			
			</ol>
			<g:form>
				<fieldset class="buttons">
					<g:hiddenField name="id" value="${defectInstance?.id}" />
					<%--<g:link class="edit" action="edit" id="${defectInstance?.id}"><g:message code="default.button.edit.label" default="Edit" /></g:link>--%>
					<%--<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />--%>
					
					<g:link action="stats" id="${defectInstance?.id}">Statistics</g:link>
					<a class="home" href="${createLink(uri: '/')}">Cancel</a>
				</fieldset>
			</g:form>
		</div>
	</body>
</html>

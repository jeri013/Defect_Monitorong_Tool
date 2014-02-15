<%@ page import="defectMonitoring.Project" %>



<div class="fieldcontain ${hasErrors(bean: projectInstance, field: 'projectName', 'error')} required">
	<label for="projectName">
		<g:message code="project.projectName.label" default="Project Name" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="projectName" maxlength="50" required="" value="${projectInstance?.projectName}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: projectInstance, field: 'projectDescription', 'error')} required">
	<label for="projectDescription">
		<g:message code="project.projectDescription.label" default="Project Description" />
		<span class="required-indicator">*</span>
	</label>
	<g:textArea name="projectDescription" cols="40" rows="5" maxlength="500" required="" value="${projectInstance?.projectDescription}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: projectInstance, field: 'status', 'error')} ">
	<label for="status">
		<g:message code="project.status.label" default="Status" />
		
	</label>
	<g:select name="status" from="${projectInstance.constraints.status.inList}" value="${projectInstance?.status}" valueMessagePrefix="project.status" noSelection="['': '']"/>
</div>

<div class="fieldcontain ${hasErrors(bean: projectInstance, field: 'projectCreator', 'error')} required">
	<label for="projectCreator">
		<g:message code="project.projectCreator.label" default="Project Creator" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="projectCreator" required="" value="${projectInstance?.projectCreator}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: projectInstance, field: 'comments', 'error')} ">
	<label for="comments">
		<g:message code="project.comments.label" default="Comments" />
		
	</label>
	<g:textField name="comments" value="${projectInstance?.comments}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: projectInstance, field: 'defect', 'error')} ">
	<label for="defect">
		<g:message code="project.defect.label" default="Defect" />
		
	</label>
	
<ul class="one-to-many">
<g:each in="${projectInstance?.defect?}" var="d">
    <li><g:link controller="defect" action="show" id="${d.id}">${d?.encodeAsHTML()}</g:link></li>
</g:each>
<li class="add">
<g:link controller="defect" action="create" params="['project.id': projectInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'defect.label', default: 'Defect')])}</g:link>
</li>
</ul>

</div>

<div class="fieldcontain ${hasErrors(bean: projectInstance, field: 'users', 'error')} ">
	<label for="users">
		<g:message code="project.users.label" default="Users" />
		
	</label>
	<g:select name="users" from="${defectMonitoring.User.list()}" multiple="multiple" optionKey="id" size="5" value="${projectInstance?.users*.id}" class="many-to-many"/>
</div>


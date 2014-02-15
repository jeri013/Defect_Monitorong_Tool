<%@ page import="defectMonitoring.Project" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'project.label', default: 'Project')}" />
		<title><g:message code="default.create.label" args="[entityName]" /></title>
		
		<script type="text/javascript">

		window.onload=init;
		
			function listbox_moveacross(sourceID, destID) {
				var src = document.getElementById(sourceID);
				var dest = document.getElementById(destID);
			
				for(var count=0; count < src.options.length; count++) {
			
					if(src.options[count].selected == true) {
							var option = src.options[count];
			
							var newOption = document.createElement("option");
							newOption.value = option.value;
							newOption.text = option.text;
							newOption.selected = true;
							try {
									 dest.add(newOption, null); //Standard
									 src.remove(count, null);
							 }catch(error) {
									 dest.add(newOption); // IE only
									 src.remove(count);
							 }
							count--;
					}
				}
			}

			function listbox_selectall(listID, isSelect) {
				var listbox = document.getElementById(listID);
				for(var count=0; count < listbox.options.length; count++) {
					listbox.options[count].selected = isSelect;
				}
			}

			function init()
			{
				alert(session.user);
			}
		</script>
		
	</head>
	<body>
		<a href="#create-project" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		
		<div id="page-body" role="main">
			<h1><g:message code="default.create.label" args="[entityName]" /></h1>
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
			<g:form action="save" >
			
				
				<fieldset class="form">
					<div class="fieldcontain ${hasErrors(bean: projectInstance, field: 'projectName', 'error')} required">
					<label for="projectName"> 
						<g:message code="project.projectName.label" default="Project Name" /> 
						<span class="required-indicator">*</span>
					</label>
					<g:textField name="projectName" maxlength="50" required="" value="${projectInstance?.projectName}" />
				</div>

				<div class="fieldcontain ${hasErrors(bean: projectInstance, field: 'projectDescription', 'error')} required">
					<label for="projectDescription"> 
						<g:message code="project.projectDescription.label" default="Project Description" /> 
						<span class="required-indicator">*</span>
					</label>
					<g:textArea name="projectDescription" cols="40" rows="5" maxlength="500" required="" value="${projectInstance?.projectDescription}" />
				</div>

				<div class="fieldcontain ${hasErrors(bean: projectInstance, field: 'comments', 'error')} ">
					<label for="comments"> <g:message code="project.comments.label" default="Comments" /> </label>
					<g:textField name="comments"  cols="40" rows="3" maxlength="500" value="${projectInstance?.comments}" />
				</div>

				<div class="fieldcontain ${hasErrors(bean: projectInstance, field: 'projectCreator', 'error')} required">
					<g:hiddenField name="projectCreator" value="${session?.user}" />
				</div>

				
				<div class="fieldcontain ${hasErrors(bean: projectInstance, field: 'users', 'error')}" >
				<label for="users">Members</label>
				<%--<g:select name="users" from="${defectMonitoring.User.list()}" multiple="multiple" optionKey="id" size="5" value="${projectInstance?.users*.id}" class="many-to-many"/>--%>
				
				<g:select id="s" name="members"  from="${defectMonitoring.User.list()}" optionKey="id" onChange="listbox_moveacross('s','d')" size="5" multiple="multiple" style="width:100px;font-size: 9px" />
				<g:select id="d" name="users" from="${[]}" optionKey="id" size="5" multiple="multiple" value="${projectInstance?.users*.id}"  class="many-to-many" onChange="listbox_moveacross('d','s')" style="width:100px;font-size: 9px" />

					<%--<div class="container" style="border: 2px solid #ccc; width: 100px; height: 100px; overflow-y: scroll; display: inline-block; vertical-align:top;">
							<g:each var='u' in='${defectMonitoring.User.list()}'>
								<g:if test="${u?.encodeAsHTML().toString().equals(session?.user.toString())}">
									<input type="checkbox" name="roleIds" value="${u.id}" disabled="disabled" checked="checked" />
									${u?.encodeAsHTML()}</br>
								</g:if>
								<g:else>
									<input type="checkbox" name="roleIds" value="${u.id}" />
									${u?.encodeAsHTML()}</br>
								</g:else>
							</g:each>
						</div>--%>
						
					<label style="font-size: 8px; font-color: red; text-align:left">Add members by selecting from left. Remove members by selecting from the right.</label>
				
				</div>
			
 
		 
					<g:hiddenField name="status" from="${projectInstance.constraints.status.inList}" value="${projectInstance?.status}" valueMessagePrefix="project.status" />
				
				
				
				</fieldset>
				<fieldset class="buttons">
					<g:submitButton name="create" class="save" value="${message(code: 'default.button.create.label', default: 'Create')}" onClick="listbox_selectall('d',true)" />
					<a class="home" href="${createLink(uri: '/')}">Cancel</a>
				</fieldset>
			</g:form>
		</div>
	</body>
</html>

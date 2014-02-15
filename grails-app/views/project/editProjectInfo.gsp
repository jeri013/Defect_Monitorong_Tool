<%@ page import="defectMonitoring.Project" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'project.label', default: 'Project')}" />
		<title><g:message code="default.edit.label" args="[entityName]" /></title>
		
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
				
				listbox_moveacross('s','d');
			}
		</script>
		
		<%--<g:javascript>
		  Event.observe(window, 'load', sample, false);
		</g:javascript>--%> 
	</head>
	<body>
		<a href="#edit-project" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		
		<div id="page-body" role="main">
		
			<g:if test="${projectInstance?.projectName}">
				<h1>Edit ${projectInstance?.projectName} Details</h1>
			</g:if>
			<g:else>
				<h1><g:message code="default.edit.label" args="[entityName]" /></h1>
			</g:else>
			
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
			
			<g:form method="post">
				
				<g:hiddenField name="id" value="${projectInstance?.id}" />
				<g:hiddenField name="version" value="${projectInstance?.version}" />
				<g:hiddenField name="projectCreator" value="${projectInstance?.projectCreator}" />
				
				<fieldset class="form">

				<div class="fieldcontain ${hasErrors(bean: projectInstance, field: 'projectName', 'error')} required">
					<label for="projectName"> <g:message
							code="project.projectName.label" default="Project Name" /> <span
						class="required-indicator">*</span>
					</label>
					<g:textField name="projectName" maxlength="50" required=""
						value="${projectInstance?.projectName}" />
				</div>

				<div class="fieldcontain ${hasErrors(bean: projectInstance, field: 'projectDescription', 'error')} required">
					<label for="projectDescription"> <g:message
							code="project.projectDescription.label"
							default="Project Description" /> <span
						class="required-indicator">*</span>
					</label>
					<g:textArea name="projectDescription" cols="40" rows="5"
						maxlength="500" required=""
						value="${projectInstance?.projectDescription}" />
				</div>

				<div class="fieldcontain ${hasErrors(bean: projectInstance, field: 'comments', 'error')} ">
					<label for="comments"> <g:message
							code="project.comments.label" default="Comments" />

					</label>
					<g:textField name="comments" value="${projectInstance?.comments}" />
				</div>

				<%--<div class="fieldcontain ${hasErrors(bean: projectInstance, field: 'users', 'error')} ">
					<label for="users">Members</label>
					<g:select name="users" from="${defectMonitoring.User.list()}"
						multiple="multiple" optionKey="id" size="5"
						value="${projectInstance?.users*.id}" class="many-to-many" />
				</div>--%>
				
				<div class="fieldcontain ${hasErrors(bean: projectInstance, field: 'users', 'error')} ">
				<label for="users">Members</label>
				<g:select id="s" name="members"  from="${defectMonitoring.User.list()}" optionKey="id" onChange="listbox_moveacross('s','d')" value="${projectInstance?.users*.id}" size="5" multiple="multiple" style="width:100px;font-size: 9px" />
				<g:select id="d" name="users" from="${[]}" optionKey="id" size="5" multiple="multiple" value="${projectInstance?.users*.id}"  class="many-to-many" onChange="listbox_moveacross('d','s')" style="width:100px;font-size: 9px" />
				<label style="font-size: 8px; font-color: red; text-align:left">Add members by selecting from left. Remove members by selecting from the right.</label>
				</div>


			</fieldset>
				<fieldset class="buttons">
					<g:actionSubmit class="save" action="update" value="${message(code: 'default.button.update.label', default: 'Update')}" onClick="listbox_selectall('d',true)" />
					<a class="home" href="${createLink(uri: '/')}">Cancel</a>
				</fieldset>
			</g:form>
		</div>
	</body>
</html>

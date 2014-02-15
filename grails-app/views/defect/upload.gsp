<%@ page import="defectMonitoring.Defect" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'defect.label', default: 'Defect')}" />
		<title><g:message code="default.create.label" args="[entityName]" /></title>
		
		<script type="text/javascript">


		var hash = {
				  'xls'  : 1,
				  'xls' : 1,
				};

				function check_extension(filename,submitId) {
				      var re = /\..+$/;
				      var ext = filename.match(re);
				      var submitEl = document.getElementById(submitId);
				      
				      //if (hash[ext]) {
				      if (ext ==".xls") {
				    	
				        submitEl.disabled = false;
				        return true;
				      } else {
				        alert("Invalid filename, please select another file");
				        submitEl.disabled = true;

				        return false;
				      }
				}

		</script>
		
	</head>
	<body>
		<a href="#create-defect" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		
		<div id="page-body" role="main">
		
			<h1>Upload Defects from File</h1>
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
			<g:form action="execUpload" method="post" enctype="multipart/form-data" >
			
			<fieldset class="form">
                <div class="dialog">
                                <div class="fieldcontain ${hasErrors(bean: defectInstance, field: 'project', 'error')} required">
									<label for="project">
										<g:message code="defect.project.label" default="Project" />
										<span class="required-indicator">*</span>
									</label>
									<g:select id="project" name="project.id" from="${defectMonitoring.Project.findAllByStatus('OPEN')}" optionKey="id" required="" value="${defectInstance?.project?.id}" class="many-to-one"/>
								</div>
                                <div class="fieldcontain ${hasErrors(bean: defectInstance, field: 'defectName', 'errors')}">
                                    <label for="age"><g:message code="person.age.label" default="Select your file..." /></label>
                                    <input type="file" name="myFile" onchange="check_extension(this.value,'upload');" />
                                </div>
                    
                </div>
                </fieldset>
                <fieldset class="buttons">
					<g:submitButton name="create" class="save" value="Upload" id="upload" />
                    	<a class="home" href="${createLink(uri: '/')}">Cancel</a>
				</fieldset>
            </g:form>
		</div>
	</body>
</html>

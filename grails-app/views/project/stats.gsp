
<%@ page import="defectMonitoring.Project" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'project.label', default: 'Project')}" />
		<title>Project Statistics</title>
	</head>
	<body>
		<a href="#show-project" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		
		<div id="page-body" role="main">
			<h1>${projectInstance?.projectName} Statistics</h1>
			</br>
			<h4>Project Status: ${projectInstance?.status}</h4>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			
			<ol class="property-list project">
			
							
				<g:set var="totalDefectCnt" value="${0}" />
				<g:set var="todoDefectCnt" value="${0}" />
				<g:set var="onGoingDefectCnt" value="${0}" />
				<g:set var="doneDefectCnt" value="${0}" />
				<g:set var="stgDefectCnt" value="${0}" />
				<g:set var="prodDefectCnt" value="${0}" />
				<g:set var="rejectDefectCnt" value="${0}" />
				<g:set var="resolvedDefectCnt" value="${0}" />
				<g:set var="percentDefectCnt" value="${0}" />
				
				<g:if test="${projectInstance?.defect}">
				<li class="fieldcontain">
						<g:each in="${projectInstance.defect}" var="d">
							<g:set var="totalDefectCnt" value="${totalDefectCnt + 1}" />
							
						</g:each>
						
					<h4>Total Number of Defects: ${totalDefectCnt}</h4></br>
					
					<g:each in="${projectInstance.defect.defectStatus}" var="t">
						<g:if test="${t == "To Do"}">
								<g:set var="todoDefectCnt" value="${todoDefectCnt + 1}" />
						</g:if>
						<g:if test="${t == "On Going"}">
								<g:set var="onGoingDefectCnt" value="${onGoingDefectCnt + 1}" />
						</g:if>
						<g:if test="${t == "Done"}">
								<g:set var="doneDefectCnt" value="${doneDefectCnt + 1}" />
						</g:if>
						<g:if test="${t == "Deployed to STG"}">
								<g:set var="stgDefectCnt" value="${stgDefectCnt + 1}" />
						</g:if>
						<g:if test="${t == "Deployed to PROD"}">
								<g:set var="prodDefectCnt" value="${prodDefectCnt + 1}" />
						</g:if>
						<g:if test="${t == "Rejected"}">
								<g:set var="rejectDefectCnt" value="${rejectDefectCnt + 1}" />
						</g:if>
						<g:if test="${t == "Resolved (no fix)"}">
								<g:set var="resolvedDefectCnt" value="${resolvedDefectCnt + 1}" />
						</g:if>
					</g:each>
					
					<g:set var="percentDefectCnt" value="${((resolvedDefectCnt + doneDefectCnt)/totalDefectCnt)*100}" />
					
					<span id="defect-label" class="property-label">To Do: ${todoDefectCnt}</span></br>
					<span id="defect-label" class="property-label">On Going: ${onGoingDefectCnt}</span></br>
					<span id="defect-label" class="property-label">Done: ${doneDefectCnt}</span></br>	
					<span id="defect-label" class="property-label">Deployed to STG: ${stgDefectCnt}</span></br>
					<span id="defect-label" class="property-label">Deployed to PROD: ${prodDefectCnt}</span></br>
					<span id="defect-label" class="property-label">Rejected: ${rejectDefectCnt}</span></br>
					<span id="defect-label" class="property-label">Resolved (no fix): ${resolvedDefectCnt}</span></br></br>
					<h4>Total: ${percentDefectCnt}% Done<h4></br>
				</li>
				
				<g:if test="${projectInstance?.defect}">
				
					<table  width="60%">
					<thead>
						<tr>
						
							<g:sortableColumn property="defectName" title="Name" />
							
							<g:sortableColumn property="dateCreated" title="Date Filed" />
						
							<g:sortableColumn property="dateCreated" title="Age" />
						
							<g:sortableColumn property="defectStatus" title="Status" />
													
							<g:sortableColumn property="blank" title="Action" />
						
						</tr>
					</thead>
					<tbody>
						
					<g:each in="${projectInstance.defect}" var="d">
						<g:set var="age" value="${new Date() - d.dateCreated}" />
					<tr>
							
							<td>${d?.encodeAsHTML()}</td>
							<td><g:formatDate type="date" style="MEDIUM" date="${d?.dateCreated}" /></td>
							<td>${age}</td>
							<td>${d?.defectStatus}</td>
							<td><g:link controller="defect" action="stats" id="${d?.id}">Statistics</g:link></td>
							
					</tr>
					</g:each>
						
					</tbody>
					</table>
					
				</g:if>
				
				</g:if>
				<g:else>
					<h4>Total Number of Defects: ${totalDefectCnt}<h4></br>
				</g:else>
			
			</ol>
			<g:form>
				<fieldset class="buttons">
					<g:hiddenField name="id" value="${projectInstance?.id}" />
					<a class="home" href="${createLink(uri: '/')}">Cancel</a>
					<%--<g:link class="edit" action="edit" id="${projectInstance?.id}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />--%>
				</fieldset>
			</g:form>
		</div>
	</body>
</html>

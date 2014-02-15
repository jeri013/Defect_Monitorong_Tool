
<%@ page import="defectMonitoring.Project" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'project.label', default: 'Project')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-project" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		
		<div id="page-body" role="main">
		
			<h1>Search Results</h1>
			
			<g:if test="${haveResults}">
			  <div class="results">
			    <g:each var="result" in="${searchResult.results}" status="index">
			      <div class="result">
			        <g:set var="className" value="${ClassUtils.getShortName(result.getClass())}" />
			        <g:set var="link"
			               value="${createLink(controller: className[0].toLowerCase() +
			                 className[1..-1],
			               action: 'show',
			               id: result.id)}" />
			        <div class="name"><a href="${link}">${className} #${result.id}</a></div>
			        <g:set var="desc" value="${result.toString()}" />
			        <g:if test="${desc.size() > 120}">
			          <g:set var="desc" value="${desc[0..120] + '...'}" />
			        </g:if>
			        <div class="desc">${desc.encodeAsHTML()}</div>
			        <div class="displayLink">${link}</div>
			      </div>
			    </g:each>
			  </div>
			
			  <!-- snip -->
			</g:if>
		</div>
	</body>
</html>

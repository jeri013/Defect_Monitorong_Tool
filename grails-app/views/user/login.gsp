
<%@ page import="defectMonitoring.User" %>
<!DOCTYPE html>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
		<meta name="layout" content="main" />
		<title>Login</title>
		
	</head>
	<body>
	
		<a href="#page-body" class="skip">
			<g:message code="default.link.skip.label" default="Skip to content&hellip;"/>
		</a>
		
		<div id="page-body" role="main">
			<h1>Login</h1>
		<p>
			<g:if test="${flash.message}">
				<div class="message">
					${flash.message}
				</div>
			</g:if>
			
			<g:form action="doLogin" method="post">
				<div class="dialog">
					<table>
						<tbody>
							<tr class="prop">
								<td valign="top" class="name"><label for="login">Login:</label>
								</td>
								<td valign="top"><input type="text" id="login" name="login" />
								</td>
							</tr>
							<tr class="prop">
								<td valign="top" class="name"><label for="password">Password:</label>
								</td>
								<td valign="top"><input type="password" id="password" name="password" /></td>
							</tr>
						</tbody>
					</table>
				</div>
				
				<div class="buttons">
					<span class="button"> <input type="submit" value="Login" />
					</span>
				</div>
			</g:form>
		</p>


	</div>
	</body>
	
</html>

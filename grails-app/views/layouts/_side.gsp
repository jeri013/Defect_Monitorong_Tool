<g:if test="${session?.user}">
<div id="stats" role="complementary">
			
			<ul id="listCategories">
				
				<g:if test="${session?.user?.admin}">
				<li>User Management
					<ul>
						<li><g:link controller="User" action="list">All Users</g:link></li>
						<li><g:link controller="User" action="create">New User</g:link></li>
					</ul>
				</li>
				</g:if>
				
				<li>Project Management
					<ul>
						<li><g:link controller="Project" action="list">All Projects</g:link></li>
						<g:if test="${!session?.user?.admin}">
						<li><g:link controller="Project" action="listProjects">My Projects</g:link></li>
						</g:if>
						<li><g:link controller="Project" action="create">New Project</g:link></li>
					</ul>
				</li>
				
				<li>Defect Management
					<ul>
						<li><g:link controller="Defect" action="list">All Defects</g:link></li>
						<g:if test="${!session?.user?.admin}">
						<li><g:link controller="Defect" action="listAllDefects">My Defects</g:link></li>
						</g:if>
						<li><g:link controller="Defect" action="create">New Defects</g:link></li>
						
						<%--<li><g:link controller="Defect" action="listDefectStatus">Update Defect Status</g:link></li>--%>
						
					</ul>
				</li>
				
				<li>Upload
					<ul>
						<li><g:link controller="Defect" action="upload">Upload from File</g:link></li>
					</ul>
				</li>
				
				<li>Statistics
					<ul>
						<li><g:link controller="Project" action="listProjectsStats">Projects</g:link></li>
						<li><g:link controller="Defect" action="listDefectStats">Defects</g:link></li>
					</ul>
				</li>
				
				<li>My Account
					<ul>
						<li><g:link controller="User" action="editUserInfo">Edit Information</g:link></li>
						<li><g:link controller="User" action="changePassword">Change Password</g:link></li>
					</ul>
				</li>
				
			</ul>
			
			
		
		</div>
	
	
	
</g:if>
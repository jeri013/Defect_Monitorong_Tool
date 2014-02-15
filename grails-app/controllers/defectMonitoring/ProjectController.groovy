package defectMonitoring

import org.springframework.dao.DataIntegrityViolationException

class ProjectController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

   
	def index() {
        redirect(action: "list", params: params)
    }

    def list(Integer max) {
		if(!session.user) {
			// i.e. user not logged in
			redirect(controller:'user',action:'login')
			return false
		}
		else
		{
	        params.max = Math.min(max ?: 10, 100)
	        [projectInstanceList: Project.list(params), projectInstanceTotal: Project.count()]
		}
    }

	/*def listProjects(Integer max) {
		params.max = Math.min(max ?: 10, 100)
		def user = session.user
		def query= "from Project where projectCreator = '"+ user +"'";
		def projectList = Project.findAll(query)
		def projectTotalCount = Project.findAll(query).size()
		[projectInstanceList: projectList, projectInstanceTotal: projectTotalCount]
	}*/
	
	def stats(Long id){
		if(!session.user) {
			// i.e. user not logged in
			redirect(controller:'user',action:'login')
			return false
		}
		else
		{
			def projectInstance = Project.get(id)
			if (!projectInstance) {
				flash.message = message(code: 'default.not.found.message', args: [message(code: 'project.label', default: 'Project'), id])
				redirect(action: "list")
				return
			}
	
			[projectInstance: projectInstance]
		}
	}
	
	def listProjects(Integer max) {
		if(!session.user) {
			// i.e. user not logged in
			redirect(controller:'user',action:'login')
			return false
		}
		else
		{
			params.max = Math.min(max ?: 10, 100)
			[projectInstanceList: Project.list(params), projectInstanceTotal: Project.count()]
		}
	}
	
	def listProjectsStats(Integer max) {
		if(!session.user) {
			// i.e. user not logged in
			redirect(controller:'user',action:'login')
			return false
		}
		else
		{
			params.max = Math.min(max ?: 10, 100)
			[projectInstanceList: Project.list(params), projectInstanceTotal: Project.count()]
		}
	}
	
	def listProjectStatus(Integer max) {
		if(!session.user) {
			// i.e. user not logged in
			redirect(controller:'user',action:'login')
			return false
		}
		else
		{
			params.max = Math.min(max ?: 10, 100)
			[projectInstanceList: Project.list(params), projectInstanceTotal: Project.count()]
		}
	}
	
    def create() {
		if(!session.user) {
			// i.e. user not logged in
			redirect(controller:'user',action:'login')
			return false
		}
		else
		{
			[projectInstance: new Project(params)]
		}
    }

    def save() {
		if(!session.user) {
			// i.e. user not logged in
			redirect(controller:'user',action:'login')
			return false
		}
		else
		{
	        def projectInstance = new Project(params)
	        if (!projectInstance.save(flush: true)) {
	            render(view: "create", model: [projectInstance: projectInstance])
	            return
	        }
	
	        flash.message = message(code: 'default.created.message', args: [message(code: 'project.label', default: 'Project'), projectInstance.id])
	        redirect(action: "show", id: projectInstance.id)
		}
    }

    def show(Long id) {
		if(!session.user) {
			// i.e. user not logged in
			redirect(controller:'user',action:'login')
			return false
		}
		else
		{
			def projectInstance = Project.get(id)
	        if (!projectInstance) {
	            flash.message = message(code: 'default.not.found.message', args: [message(code: 'project.label', default: 'Project'), id])
	            redirect(action: "list")
	            return
	        }
	
	        [projectInstance: projectInstance]
		}
    }

    def edit(Long id) {
		if(!session.user) {
			// i.e. user not logged in
			redirect(controller:'user',action:'login')
			return false
		}
		else
		{
			def projectInstance = Project.get(id)
	        if (!projectInstance) {
	            flash.message = message(code: 'default.not.found.message', args: [message(code: 'project.label', default: 'Project'), id])
	            redirect(action: "list")
	            return
	        }
	
	        [projectInstance: projectInstance]
		}
    }

	def editProjectStatus(Long id) {
		if(!session.user) {
			// i.e. user not logged in
			redirect(controller:'user',action:'login')
			return false
		}
		else
		{
			def projectInstance = Project.get(id)
			if (!projectInstance) {
				flash.message = message(code: 'default.not.found.message', args: [message(code: 'project.label', default: 'Project'), id])
				redirect(action: "list")
				return
			}
	
			[projectInstance: projectInstance]
		}
	}
	
	def editProjectInfo(Long id) {
		if(!session.user) {
			// i.e. user not logged in
			redirect(controller:'user',action:'login')
			return false
		}
		else
		{
			def projectInstance = Project.get(id)
			if (!projectInstance) {
				flash.message = message(code: 'default.not.found.message', args: [message(code: 'project.label', default: 'Project'), id])
				redirect(action: "list")
				return
			}
	
			[projectInstance: projectInstance]
		}
	}
	
    def update(Long id, Long version) {
		if(!session.user) {
			// i.e. user not logged in
			redirect(controller:'user',action:'login')
			return false
		}
		else
		{
			def projectInstance = Project.get(id)
	        if (!projectInstance) {
	            flash.message = message(code: 'default.not.found.message', args: [message(code: 'project.label', default: 'Project'), id])
	            redirect(action: "list")
	            return
	        }
	
	        if (version != null) {
	            if (projectInstance.version > version) {
	                projectInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
	                          [message(code: 'project.label', default: 'Project')] as Object[],
	                          "Another user has updated this Project while you were editing")
	                render(view: "edit", model: [projectInstance: projectInstance])
	                return
	            }
	        }
	
	        projectInstance.properties = params
	
	        if (!projectInstance.save(flush: true)) {
	            render(view: "edit", model: [projectInstance: projectInstance])
	            return
	        }
	
	        flash.message = message(code: 'default.updated.message', args: [message(code: 'project.label', default: 'Project'), projectInstance.id])
	        redirect(action: "show", id: projectInstance.id)
		}
    }

    def delete(Long id) {
		if(!session.user) {
			// i.e. user not logged in
			redirect(controller:'user',action:'login')
			return false
		}
		else
		{
			def projectInstance = Project.get(id)
	        if (!projectInstance) {
	            flash.message = message(code: 'default.not.found.message', args: [message(code: 'project.label', default: 'Project'), id])
	            redirect(action: "list")
	            return
	        }
	
	        try {
	            projectInstance.delete(flush: true)
	            flash.message = message(code: 'default.deleted.message', args: [message(code: 'project.label', default: 'Project'), id])
	            redirect(action: "list")
	        }
	        catch (DataIntegrityViolationException e) {
	            flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'project.label', default: 'Project'), id])
	            redirect(action: "show", id: id)
	        }
	    }
    }
}

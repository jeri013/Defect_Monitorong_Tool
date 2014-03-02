package defectMonitoring

import org.springframework.dao.DataIntegrityViolationException

import defectMonitoring.User;

class UserController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

	def login(){}
	def main(){}
	
	def doLogin = {
		def user = User.findWhere(login:params['login'],password:params['password'])
		//def user = User.findByLoginAndPassword(params.login, params.password.encodeAsSHA())
	    //user should be active
		//println user.status
		
		if (user.status == "ACT"){
			session.user = user
			flash.message = "Hello ${user.login}!"
			redirect(controller:'user',action:'index')
		}else{
			flash.message = "Sorry, ${params.login}. Please try again."
			redirect(controller:'user',action:'login')
		}
	 }
	
	def logout = {
		if(!session.user) {
			flash.message = "Goodbye ${session.user.login}"
		}
		session.user = null
		redirect(action:"login")
	}
	
    def index() {
        //redirect(action: "list", params: params)
		checkUser()
    }
	
	def checkUser() {
		if(!session.user) {
		// i.e. user not logged in
		redirect(controller:'user',action:'login')
		return false
		}
		else
		{
			render(view:'/main')
		}
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
	        [userInstanceList: User.list(params), userInstanceTotal: User.count()]
		}
    }
	
	def listStatus(Integer max) {
		if(!session.user) {
			// i.e. user not logged in
			redirect(controller:'user',action:'login')
			return false
		}
		else
		{
			params.max = Math.min(max ?: 10, 100)
			[userInstanceList: User.list(params), userInstanceTotal: User.count()]
		}
	}
	
	def listRole(Integer max) {
		if(!session.user) {
			// i.e. user not logged in
			redirect(controller:'user',action:'login')
			return false
		}
		else
		{
			params.max = Math.min(max ?: 10, 100)
			[userInstanceList: User.list(params), userInstanceTotal: User.count()]
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
			[userInstance: new User(params)]
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
			def userInstance = new User(params)
	        if (!userInstance.save(flush: true)) {
	            render(view: "create", model: [userInstance: userInstance])
	            return
	        }
	
	        flash.message = message(code: 'default.created.message', args: [message(code: 'user.label', default: 'User'), userInstance.id])
	        redirect(action: "show", id: userInstance.id)
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
			def userInstance = User.get(id)
	        if (!userInstance) {
	            flash.message = message(code: 'default.not.found.message', args: [message(code: 'user.label', default: 'User'), id])
	            redirect(action: "list")
	            return
	        }
	
	        [userInstance: userInstance]
		}
    }

	def editUserInfo() {
		if(!session.user) {
			// i.e. user not logged in
			redirect(controller:'user',action:'login')
			return false
		}
		else
		{
			def userInstance = User.get(session.user.id)
			
			if (!userInstance) {
				flash.message = message(code: 'default.not.found.message', args: [message(code: 'user.label', default: 'User'), session.user.id])
				redirect(action: "list")
				return
			}
	
			[userInstance: userInstance]
		}
	}
	
	def changePassword() {
		if(!session.user) {
			// i.e. user not logged in
			redirect(controller:'user',action:'login')
			return false
		}
		else
		{
			def userInstance = User.get(session.user.id)
			
			if (!userInstance) {
				flash.message = message(code: 'default.not.found.message', args: [message(code: 'user.label', default: 'User'), session.user.id])
				redirect(action: "list")
				return
			}
	
			[userInstance: userInstance]
		}
	}
	
	def resetPassword(Long id) {
		if(!session.user) {
			// i.e. user not logged in
			redirect(controller:'user',action:'login')
			return false
		}
		else
		{
			def userInstance = User.get(id)
			
			if (!userInstance) {
				flash.message = message(code: 'default.not.found.message', args: [message(code: 'user.label', default: 'User'), id])
				redirect(action: "list")
				return
			}
	
			[userInstance: userInstance]
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
			def userInstance = User.get(id)
	        if (!userInstance) {
	            flash.message = message(code: 'default.not.found.message', args: [message(code: 'user.label', default: 'User'), id])
	            redirect(action: "list")
	            return
	        }
	
	        [userInstance: userInstance]
		}
    }
	
	def editStatus(Long id) {
		if(!session.user) {
			// i.e. user not logged in
			redirect(controller:'user',action:'login')
			return false
		}
		else
		{
			def userInstance = User.get(id)
			
			if (!userInstance) {
				flash.message = message(code: 'default.not.found.message', args: [message(code: 'user.label', default: 'User'), id])
				redirect(action: "list")
				return
			}
	
			[userInstance: userInstance]
		}
	}
	
	def editRole(Long id) {
		if(!session.user) {
			// i.e. user not logged in
			redirect(controller:'user',action:'login')
			return false
		}
		else
		{
			def userInstance = User.get(id)
			
			if (!userInstance) {
				flash.message = message(code: 'default.not.found.message', args: [message(code: 'user.label', default: 'User'), id])
				redirect(action: "list")
				return
			}
	
			[userInstance: userInstance]
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
			def userInstance = User.get(id)
	        if (!userInstance) {
	            flash.message = message(code: 'default.not.found.message', args: [message(code: 'user.label', default: 'User'), id])
	            redirect(action: "list")
	            return
	        }
	
	        if (version != null) {
	            if (userInstance.version > version) {
	                userInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
	                          [message(code: 'user.label', default: 'User')] as Object[],
	                          "Another user has updated this User while you were editing")
	                render(view: "edit", model: [userInstance: userInstance])
	                return
	            }
	        }
	
	        userInstance.properties = params
	
	        if (!userInstance.save(flush: true)) {
	            render(view: "edit", model: [userInstance: userInstance])
	            return
	        }
	
	        flash.message = message(code: 'default.updated.message', args: [message(code: 'user.label', default: 'User'), userInstance.id])
	        redirect(action: "show", id: userInstance.id)
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
			def userInstance = User.get(id)
	        if (!userInstance) {
	            flash.message = message(code: 'default.not.found.message', args: [message(code: 'user.label', default: 'User'), id])
	            redirect(action: "list")
	            return
	        }
	
	        try {
	            userInstance.delete(flush: true)
	            flash.message = message(code: 'default.deleted.message', args: [message(code: 'user.label', default: 'User'), id])
	            redirect(action: "list")
	        }
	        catch (DataIntegrityViolationException e) {
	            flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'user.label', default: 'User'), id])
	            redirect(action: "show", id: id)
	        }
	    }
    }
}

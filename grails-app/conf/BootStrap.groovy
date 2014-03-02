import defectMonitoring.User;

class BootStrap {

    def init = { servletContext ->
	/*	def admin = new User(
				login:"admin",
				password:"admin",
				firstName:"admin",
				middleInitial:"a",
				lastName:"admin",
				email:"admin@admin.com",
				role:"admin",
				status:"ACT",
				DateCreated:(new Date() - 365*30),
				lastUpdated:(new Date() - 365*30)
				)
		admin.save()
		if(admin.hasErrors()){
			println admin.errors
		}
		
		def user = new User(
			login:"user",
			password:"user",
			firstName:"user",
			middleInitial:"u",
			lastName:"user",
			email:"user@admin.com",
			role:"user",
			status:"ACT",
			DateCreated:(new Date() - 365*30),
			lastUpdated:(new Date() - 365*30)
			)
	user.save()
	if(user.hasErrors()){
		println user.errors
	}
		*/		 
    }
	
    def destroy = {
    }
}

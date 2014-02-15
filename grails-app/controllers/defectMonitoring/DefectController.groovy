package defectMonitoring

import java.text.SimpleDateFormat
import java.util.Date;

import org.junit.After;
import org.springframework.dao.DataIntegrityViolationException

import jxl.*;

class DefectController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }
	
	def stats(Long id){
		if(!session.user) {
			// i.e. user not logged in
			redirect(controller:'user',action:'login')
			return false
		}
		else
		{
			def defectInstance = Defect.get(id)
			if (!defectInstance) {
				flash.message = message(code: 'default.not.found.message', args: [message(code: 'defect.label', default: 'Defect'), id])
				redirect(action: "list")
				return
			}
	
			[defectInstance: defectInstance]
		}
	}
	
	def upload = {
		if(!session.user) {
			// i.e. user not logged in
			redirect(controller:'user',action:'login')
			return false
		}
		else
		{
			if(Project.count()==0){
				flash.message = "Please Create a Project First before Uploading a File."
				redirect(controller:"Project",action: "listProjects")
			}
			else
			{
				return;
			}
		}
	}
	
	def execUpload = {
		log.debug "ENTER execUpload"
		def f = request.getFile('myFile')
		log.debug "class = ${f.class.simpleName}"
		
		if(!f.empty) {
		   def workbook = Workbook.getWorkbook(f.getInputStream());
		   def sheet = workbook.getSheet(0);
		   def totalRows = sheet.getRows()
		   def msg = ""
		   
		   
		   (1..(totalRows-1)).each{row ->
			   String ticket = sheet.getCell(1,row).getContents()
			   String dateReceived = sheet.getCell(2,row).getContents()
			   if(!dateReceived.equals(""))
			   {
				   
			   }
			   String defectName = sheet.getCell(3,row).getContents()
			   String environment = sheet.getCell(4,row).getContents()
			   if(environment.equals(""))
			   {
				   environment = "TEST"
			   }
			   if(!environment.equalsIgnoreCase("TEST")||!environment.equalsIgnoreCase("STG")||!environment.equalsIgnoreCase("PROD"))
			   {
				   environment = "TEST"
			   }
			   String defectStatus = sheet.getCell(5,row).getContents()
			   if(defectStatus.equals(""))
			   {
				   defectStatus = "To Do"
			   }
			   if(!defectStatus.equalsIgnoreCase("To Do")||!defectStatus.equalsIgnoreCase("On Going")||!defectStatus.equalsIgnoreCase("Done")||
				  !defectStatus.equalsIgnoreCase("Deployed to STG")||!defectStatus.equalsIgnoreCase("Deployed to PROD")||
				  !defectStatus.equalsIgnoreCase("Rejected")||!defectStatus.equalsIgnoreCase("Resolved (no fix)"))
			   {
				   defectStatus = "To Do"
			   }
			   String defectSeverity = sheet.getCell(6,row).getContents()
			   if(defectSeverity.equals(""))
			   {
				   defectSeverity = "1"
			   }
			   if(!defectSeverity.equals("1")||!defectSeverity.equals("2")||!defectSeverity.equals("3")||!defectSeverity.equals("4"))
			   {
				   defectSeverity = "1"
			   }
			   String defectOverview = sheet.getCell(7,row).getContents()
			   if(defectOverview.equals(""))
			   {
				   defectOverview = "[Edit to include overview]"
			   }
			   String stepsToReproduce = sheet.getCell(8,row).getContents()
			   if(stepsToReproduce.equals(""))
			   {
				   stepsToReproduce = "[Edit to include steps to reproduce]"
			   }
			   String releaseVersion = sheet.getCell(9,row).getContents()
			   if(releaseVersion.equals(""))
			   {
				   releaseVersion = "0"
			   }
			   String stgDeploymentDate = sheet.getCell(10,row).getContents()
			   Date utilDate
			   java.sql.Date sqlStgDate
			   SimpleDateFormat formatter = new SimpleDateFormat("MM/dd/yyyy");
			   if(stgDeploymentDate.equals(""))
			   {
				   utilDate = new Date();
				   sqlStgDate = new java.sql.Date(utilDate.getTime());
			   }
			   else
			   {
				   //cast to java.sql.Date
				   utilDate = formatter.parse(stgDeploymentDate);
				   sqlStgDate = new java.sql.Date(utilDate.getTime());
				   
			   }
			   String reporter = sheet.getCell(11,row).getContents()
			   if(reporter.equals(""))
			   {
				   reporter = session.user
			   }
			   String comments = sheet.getCell(12,row).getContents()
			   String resolution = sheet.getCell(13,row).getContents()
			   String relatedTo = sheet.getCell(14,row).getContents()
			   
			   def defectInstance = new Defect(params)
			   defectInstance.ticket = ticket
			   defectInstance.defectName = defectName
			   defectInstance.defectOverview = defectOverview
			   defectInstance.stepsToReproduce = stepsToReproduce
			   defectInstance.comments = comments
			   defectInstance.resolution = resolution
			   defectInstance.environment = environment
			   defectInstance.releaseVersion = releaseVersion
			   defectInstance.reporter = reporter
			   defectInstance.stgDeploymentDate = sqlStgDate
			   //println defectInstance.ticket
			   
			   //msg += "stgDeploymentDate = $stgDeploymentDate"
			   if(!defectInstance.save(flush:true)){
				   defectInstance.errors.each {
					   println it
				   }
			   }
		   }
		   
		   flash.message = 'file uploaded successfully! '
		   redirect(action:'upload')
		}
		else {
		   flash.message = 'file cannot be empty'
		   redirect(action:'upload')
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
        	[defectInstanceList: Defect.list(params), defectInstanceTotal: Defect.count()]
		}
    }
	
	def listAllDefects(Integer max) {
		if(!session.user) {
			// i.e. user not logged in
			redirect(controller:'user',action:'login')
			return false
		}
		else
		{
			params.max = Math.min(max ?: 10, 100)
			[defectInstanceList: Defect.list(params), defectInstanceTotal: Defect.count()]
		}
	}
	
	def listDefectStats(Integer max) {
		if(!session.user) {
			// i.e. user not logged in
			redirect(controller:'user',action:'login')
			return false
		}
		else
		{
			params.max = Math.min(max ?: 10, 100)
			[defectInstanceList: Defect.list(params), defectInstanceTotal: Defect.count()]
		}
	}
	
	def listDefectStatus(Integer max) {
		if(!session.user) {
			// i.e. user not logged in
			redirect(controller:'user',action:'login')
			return false
		}
		else
		{
			params.max = Math.min(max ?: 10, 100)
			[defectInstanceList: Defect.list(params), defectInstanceTotal: Defect.count()]
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
			if(Project.count()==0){
				flash.message = "Please Create a Project First before Creating a New Defect."
				redirect(controller:"Project",action: "listProjects")
			}
			else
			{
				
				[defectInstance: new Defect(params)]
			}
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
			def defectInstance = new Defect(params)
	        if (!defectInstance.save(flush: true)) {
	            render(view: "create", model: [defectInstance: defectInstance])
	            return
	        }
	
	        flash.message = message(code: 'default.created.message', args: [message(code: 'defect.label', default: 'Defect'), defectInstance.id])
	        redirect(action: "show", id: defectInstance.id)
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
			def defectInstance = Defect.get(id)
	        if (!defectInstance) {
	            flash.message = message(code: 'default.not.found.message', args: [message(code: 'defect.label', default: 'Defect'), id])
	            redirect(action: "list")
	            return
	        }
	
	        [defectInstance: defectInstance]
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
			def defectInstance = Defect.get(id)
	        if (!defectInstance) {
	            flash.message = message(code: 'default.not.found.message', args: [message(code: 'defect.label', default: 'Defect'), id])
	            redirect(action: "list")
	            return
	        }
	
	        [defectInstance: defectInstance]
		}
    }
	
	def editDefectStatus(Long id) {
		if(!session.user) {
			// i.e. user not logged in
			redirect(controller:'user',action:'login')
			return false
		}
		else
		{
			def defectInstance = Defect.get(id)
			if (!defectInstance) {
				flash.message = message(code: 'default.not.found.message', args: [message(code: 'defect.label', default: 'Defect'), id])
				redirect(action: "list")
				return
			}
	
			[defectInstance: defectInstance]
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
			def defectInstance = Defect.get(id)
	        if (!defectInstance) {
	            flash.message = message(code: 'default.not.found.message', args: [message(code: 'defect.label', default: 'Defect'), id])
	            redirect(action: "list")
	            return
	        }
	
	        if (version != null) {
	            if (defectInstance.version > version) {
	                defectInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
	                          [message(code: 'defect.label', default: 'Defect')] as Object[],
	                          "Another user has updated this Defect while you were editing")
	                render(view: "edit", model: [defectInstance: defectInstance])
	                return
	            }
	        }
	
	        defectInstance.properties = params
	
	        if (!defectInstance.save(flush: true)) {
	            render(view: "edit", model: [defectInstance: defectInstance])
	            return
	        }
	
	        flash.message = message(code: 'default.updated.message', args: [message(code: 'defect.label', default: 'Defect'), defectInstance.id])
	        redirect(action: "show", id: defectInstance.id)
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
			def defectInstance = Defect.get(id)
	        if (!defectInstance) {
	            flash.message = message(code: 'default.not.found.message', args: [message(code: 'defect.label', default: 'Defect'), id])
	            redirect(action: "list")
	            return
	        }
	
	        try {
	            defectInstance.delete(flush: true)
	            flash.message = message(code: 'default.deleted.message', args: [message(code: 'defect.label', default: 'Defect'), id])
	            redirect(action: "list")
	        }
	        catch (DataIntegrityViolationException e) {
	            flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'defect.label', default: 'Defect'), id])
	            redirect(action: "show", id: id)
	        }
	    }
    }
}

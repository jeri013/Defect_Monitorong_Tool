package defectMonitoring

class Project {

	static searchable = true
	
	String projectName
	String projectDescription
	String status = "OPEN"
	String projectCreator
	
	String comments
	
	Date dateCreated
	Date lastUpdated
	
	static hasMany = [users:User, defect:Defect]
	//static hasMany = [users:User]
	
    static constraints = {
		
		projectName(blank:false, maxSize:50)
		projectDescription(blank:false, maxSize:500, widget:'textarea')
		
		status(inList:["OPEN", "CANCELLED", "CLOSED"])
		
		projectCreator(blank:false)
		
		comments(maxSize:500, widget:'textarea')
    }
	
	String toString(){
		projectName
	}
}

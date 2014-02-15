package defectMonitoring

import java.util.Date;

class Defect {

	static searchable = true
    
	String ticket
	String defectName
	String environment = "DEV"
	String defectStatus = "To Do"
	String defectSeverity = "1"
	String defectOverview
	String stepsToReproduce
	String releaseVersion
	Date stgDeploymentDate
	String reporter
	String comments
	String resolution
	
	Date dateCreated
	Date lastUpdated
	
	static hasMany = [relatedTo:Defect] 
	
	static belongsTo = [project:Project]
	
    static constraints = {
		
		ticket(maxSize:50)
		
		defectName(blank:false, maxSize:50)
		defectOverview(blank:false, maxSize:500, widget:'textarea')
		stepsToReproduce(blank:false, maxSize:500, widget:'textarea')
		
		comments(maxSize:500, widget:'textarea')
		resolution(maxSize:500, widget:'textarea')
		
		environment(inList:["TEST", "STG", "PROD"])
		defectStatus(inList:["To Do", "On Going", "Done", "Deployed to STG", "Deployed to PROD", "Rejected", "Resolved (no fix)"])
		defectSeverity(inList:["1", "2", "3", "4"])
		
		stgDeploymentDate (nullable:true)
		
		releaseVersion(maxSize:10)
		
		reporter(blank:false)
		
		
    }
	
	String toString(){
		defectName
	}
}

package defectMonitoring

class User {

	static searchable = {except = ['id', 'version']}
	
    String login
	String password
	String firstName
	String middleInitial
	String lastName
	String email
	String role = "user"
	String status = "ACT"
	Date DateCreated
	Date lastUpdated
	
	
    static constraints = {
		login(blank:false, maxSize:20, unique:true)
		password(blank:false, maxSize:15, password:true)
		firstName(blank:false, maxSize:20)
		middleInitial(maxSize:2)
		lastName(blank:false, maxSize:20)
		email(email:true)
		role(inList:["admin", "user"])
		status(inList:["ACT", "INA"])
    }
	
	
	String toString(){
		login
	}
	
	static transients = ['admin']
	
	boolean isAdmin(){
		return role == "admin"
	}
	
	static mapping = {
		table 'users'
		password column: '`password`'
	 }
}

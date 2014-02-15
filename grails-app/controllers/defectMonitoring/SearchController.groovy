package defectMonitoring
import org.compass.core.engine.SearchEngineQueryParseException

class SearchController {

	def searchableService
	
	def index = {
        if (!params.q?.trim()) {
            return [:]
        }
        try {
            return [searchResult: searchableService.search(params.q, params)]
        } catch (SearchEngineQueryParseException ex) {
            return [parseException: true]
        }
    }

    /**
     * Perform a bulk index of every searchable object in the database
     */
    def indexAll = {
        Thread.start {
            searchableService.index()
        }
        render("bulk index started in a background thread")
    }

    /**
     * Perform a bulk index of every searchable object in the database
     */
    def unindexAll = {
        searchableService.unindex()
        render("unindexAll done")
    }
	
    def search() { }
	
	def listSearch(Integer max) {
		params.max = Math.min(max ?: 10, 100)
		println params.q
		def userList = User.createCriteria().list () {
			if ( params.q ) {
				ilike("login", "%${params.q}%")
				ilike("firstName", "%${params.q}%")
				ilike("lastName", "%${params.q}%")
				ilike("email", "%${params.q}%")
			}
		}
 
		[userInstanceList: userList, userInstanceTotal:  User.count()]
	}
	
}

dataSource {
    pooled = true
    //driverClassName = "org.h2.Driver"
	driverClassName = "com.mysql.jdbc.Driver"
	dialect = "org.hibernate.dialect.MySQL5InnoDBDialect"
	//driverClassName = "org.postgresql.Driver"
	//dialect = "org.hibernate.dialect.PostgreSQLDialect"
    //username = "sa"
    //password = ""
}
hibernate {
    cache.use_second_level_cache = true
    cache.use_query_cache = false
    cache.region.factory_class = 'net.sf.ehcache.hibernate.EhCacheRegionFactory'
	//cache.provider_class='net.sf.ehcache.hibernate.EhCacheProvider'
}
// environment specific settings
environments {
    development {
        dataSource {
            dbCreate = "update" // one of 'create', 'create-drop', 'update', 'validate', ''
            //url = "jdbc:h2:mem:devDb;MVCC=TRUE;LOCK_TIMEOUT=10000"
			url = "jdbc:mysql://127.0.0.1/defect_monitoring?useUnicode=yes&characterEncoding=UTF-8"
			//url = "jdbc:postgresql://localhost/defect_monitoring"
			//username = "postgres"
			//password = "adminadmin"
			username = "root"
			password = ""
        }
    }
    test {
        dataSource {
            dbCreate = "update"
            //url = "jdbc:h2:mem:testDb;MVCC=TRUE;LOCK_TIMEOUT=10000"
			url = "jdbc:mysql://127.0.0.1/defect_monitoring?useUnicode=yes&characterEncoding=UTF-8"
			username = "root"
			password = ""
			//url = "jdbc:postgresql://localhost/defect_monitoring"
			//username = "postgres"
			//password = "adminadmin"
        }
    }
    production {
        dataSource {
            dbCreate = "update"
            //url = "jdbc:h2:prodDb;MVCC=TRUE;LOCK_TIMEOUT=10000"
			url = "jdbc:mysql://127.0.0.1/defect_monitoring?useUnicode=yes&characterEncoding=UTF-8"
			username = "root"
			password = ""
            pooled = true
            properties {
               maxActive = -1
               minEvictableIdleTimeMillis=1800000
               timeBetweenEvictionRunsMillis=1800000
               numTestsPerEvictionRun=3
               testOnBorrow=true
               testWhileIdle=true
               testOnReturn=true
               validationQuery="SELECT 1"
            }
			
			/*url = "jdbc:postgresql://localhost/defect_monitoring"
			username = "postgres"
			password = "adminadmin"*/
        }
    }
}

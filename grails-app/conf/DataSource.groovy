dataSource {
    pooled = true
    driverClassName = "org.h2.Driver"
    username = "sa"
    password = ""
}
hibernate {
    cache.use_second_level_cache = true
    cache.use_query_cache = false
    cache.region.factory_class = 'net.sf.ehcache.hibernate.EhCacheRegionFactory'
}
// environment specific settings
environments {
    development {
        dataSource {
            dbCreate = "create-drop" // one of 'create', 'create-drop', 'update', 'validate', ''
            url = 'jdbc:mysql://localhost:3306/tbasdb'
            driverClassName = 'com.mysql.jdbc.Driver'
            dialect = 'org.hibernate.dialect.MySQLDialect'
            logSql = true
            username = 'root' // do not change settings
            password = '' // do not change settings
        }
    }
    test {
        dataSource {
            dbCreate = 'create-drop' // for mock testing purposes only
            jndiName = "java:comp/env/jdbc/tbasdb"
            pooled = true
            logSql = false
            properties {
                 minEvictableIdleTimeMillis = 1800000
                 timeBetweenEvictionRunsMillis = 1800000
                 numTestsPerEvictionRun = 3
                 testOnBorrow = true
                 testWhileIdle = true
                 testOnReturn = true
                 validationQuery = "SELECT 1"
            }
        }
    }
    production {
        dataSource {
            dbCreate = "update"
            url = "jdbc:h2:prodDb;MVCC=TRUE;LOCK_TIMEOUT=10000"
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
        }
    }
}

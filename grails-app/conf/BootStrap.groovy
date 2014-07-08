class BootStrap {

    def init = { servletContext ->
    	def adminRole = new Role(authority: 'ROLE_ADMIN').save(flush: true)

	    def testUser = new Account(username: 'admin', enabled: true, password: 'admin')
	    testUser.save(flush: true)

	    AccountRole.create testUser, adminRole, true

	    assert Account.count() == 1
	    assert AccountRole.count() == 1
    }
    def destroy = {
    }
}

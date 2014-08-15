import org.springframework.web.multipart.MultipartFile


class WeighingScaleController {
	
	static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

	def index() {
		redirect action: 'create'
	}

	def create = {
		println "DEBUG| triggered create"
		render view: 'create'
	}

	def printReciept = {
		def file = request.getFile('myFile')
		println "DEBUG| ${params}"
		println "DEBUG| my file: ${file}"
		render(view: 'create', model: [name: params.name])
	}

}

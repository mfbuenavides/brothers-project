import org.springframework.dao.DataIntegrityViolationException
import grails.plugins.springsecurity.Secured
import org.codehaus.groovy.grails.plugins.jasper.JasperExportFormat
import org.codehaus.groovy.grails.plugins.jasper.JasperReportDef
import com.threebrothers.ReportType
import java.text.*


class ReportsController {

    static allowedMethods  =  [generateReport: 'POST']
   
    def reportsService
    def jasperService

    def index() {
    	
        render(view: "index")
    }
    
    def generate = { ReportCommand cmd ->
    	println "start date: " + cmd.startDate
    	println "end date: " + cmd.endDate
    	println "report type: " + cmd.reportType
    	
    	switch(cmd.reportType){
    		case "Medicine":
    			generateMedicineReport();
    			break;
    		
    		case "Mortality":
    			generateMortalityReport(cmd.reportType, cmd.startDate, cmd.endDate);
    			break;
    		
    	}
    
    }
    
    
    def generateMedicineReport(){
    	def data = []
    	params.path = grailsApplication.config.jasper.dir.reports.toString()
    	println "params.path: " + params.path
    	
    	params._file = 'medicine'    	
    	params._format = 'PDF'
    	params._name = 'medicine'    	
    
    	
		chain(controller:'jasper',action:'index',model:[data: data], params:params)
		
    }
    
    def generateMortalityReport(reportType, startDate, endDate){
    	params._file = 'mortalityReport'
    	params._format = 'PDF'
    	params._name = 'MortalityReport'
    	
    	DateFormat df = new SimpleDateFormat("MM/dd/yyyy")        
    	def data = new DataModel()
    	def mortList = reportsService.generateReport(ReportType.MORTALITY, startDate, endDate)
    	
    	def mortModel
    	mortList.each{ mortality ->
    		mortModel = new MortalityModel()
    		mortModel.name = mortality.raiser.firstName + " " + mortality.raiser.firstName + " (" + mortality.raiser.batchNumber + ")"
    		mortModel.date = df.format(mortality.dateOfDeath).toString()
    		mortModel.quantity = mortality.numberOfHeads + " heads"
    		mortModel.remarks =  mortality.causeOfDeath 
    	
    		
    		data.mortalityList.add(mortModel)
    	}
    	data = [data]
    	chain(controller:'jasper',action:'index',model:[data: data], params:params)
    	
    }

}

class ReportCommand {
	Date startDate
	Date endDate
	String reportType
}

class DataModel{
	def mortalityList = []
}

class MortalityModel {
	String name
	String date
	String quantity
	String quantityUnit
	String remarks
}

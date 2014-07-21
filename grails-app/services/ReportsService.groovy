import com.threebrothers.ReportType

class ReportsService {

	static transactional = true

	def generateReport(ReportType reportType, Date startDate, Date endDate) {

		List data = []

		switch(reportType) {
			case ReportType.SALES:
				data = Sales.executeQuery('select s from Sales s where s.dateSold >= :start and s.dateSold <= :end', [start: startDate, end: endDate])
			break

			case ReportType.MORTALITY:
				data = Mortality.executeQuery('select m from Mortality m where m.dateOfDeath >= :start and m.dateOfDeath <= :end', [start: startDate, end: endDate])
			break

			case ReportType.MEDICINE:
				data = Medicine.getAll()
			break
		}
		
		data
	}

}
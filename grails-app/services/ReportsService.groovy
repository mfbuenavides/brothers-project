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

			case ReportType.CASH_FLOW:
				data = CashFlow.executeQuery('select c from CashFlow c where c.transactionDate >= :start and c.transactionDate <= :end', [start: startDate, end: endDate])
			break

			case ReportType.BANKING:
				data = Banking.executeQuery('select b from BankTransaction b where b.date >= :start and b.date <= :end', [start: startDate, end: endDate])
			break

			case ReportType.POPULATION:
				data = Population.executeQuery("""select p from Population p where p.initialCapital.dateStarted >= :start and p.initialCapital.dateStarted and 
												p.initialCapital.expectedHaulDate >= :start and p.initialCapital.expectedHaulDate <= :end)""", 
												[start: startDate, end: endDate])				
			break
		}
		
		data
	}

}
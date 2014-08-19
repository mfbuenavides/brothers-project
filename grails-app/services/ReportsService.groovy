import com.threebrothers.ReportType

class ReportsService {

	static transactional = true

	def generateReport(ReportType reportType, Date startDate, Date endDate) {

		def data

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

			case ReportType.FINANCIAL_STATEMENT:
				data =[:]
				Map salesCost = [:]
				Map otherExpenses = [:]

				//query sales cost logic here
				def salesData = Sales.executeQuery('select s from Sales s where s.dateSold >=:start and s.dateSold <=:end',[start: startDate, end: endDate])

				//other expenses data
				def cashFlowData = CashFlow.executeQuery('select cf from CashFlow cf where cf.transactionDate >= :start and cf.transactionDate <= :end', 
												[start: startDate, end: endDate])

				//put into map
				cashFlowData.each {
					if (OperatingExpenses.OTHERS == it.paidFor) {
						otherExpenses << [item: it.otherExpenses, amount: it.amount]
					} else 
						otherExpenses << [item: it.paidFor.name, amount: it.amount]
				}

				data << otherExpenses
			break
		}

		data
	}

}
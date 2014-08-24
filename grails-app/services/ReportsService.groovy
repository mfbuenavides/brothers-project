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
				Map otherExpenses = [:]

				//query sales cost logic here
				def salesData = Sales.executeQuery('select s from Sales s where s.dateSold >=:start and s.dateSold <=:end',[start: startDate, end: endDate])

				//other expenses data
				def cashFlowData = CashFlow.executeQuery('select cf from CashFlow cf where cf.transactionDate >= :start and cf.transactionDate <= :end', 
												[start: startDate, end: endDate])

				//pending piglet cost for sales price
				double pigletCost = salesData ? salesData.initialCapital.unique().sum { it.netAmount } : null 
				double totalSales = salesData ? salesData.sum { it.amount } : null
				double truckingExpenses = salesData ? salesData.initialCapital.unique().sum { it.truckingExpenses } : null
				double feedsCost = salesData ? salesData.initialCapital.unique().feedsInventory.unique().flatten().sum { it.amount } : null
				double medCost = salesData ? salesData.initialCapital.unique().medicineInventory.unique().flatten().sum { it.cost } : null

				//put sales cost into map
				Map salesCost = [
					pigletCost: pigletCost,
					totalSales: totalSales,
					truckingExpenses: truckingExpenses,
					feedsCost: feedsCost,
					medicineCost: medCost
				]

				//put other expenses into map
				cashFlowData.each {
					if (OperatingExpenses.OTHERS == it.paidFor) {
						otherExpenses << [item: it.otherExpenses, amount: it.amount]
					} else 
						otherExpenses << [item: it.paidFor.name, amount: it.amount]
				}
				
				data << salesCost
				data << otherExpenses
			break
		}

		data
	}

}
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page isELIgnored="false"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Savings and Investments</title>
<script src="https://cdn.tailwindcss.com"></script>
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css">
</head>
<body>
	<jsp:include page="/WEB-INF/views/header.jsp" />

	<div class="p-8 mt-20 mx-auto">
		<h1 class="text-3xl font-bold mb-8">Savings and Investments</h1>

		<!-- Investment Form -->
		<div class="bg-blue-50 p-6 rounded-lg mb-8">
			<form:form action="investmentsCalculate" method="POST"
				class="space-y-6">
				<div class="grid grid-cols-1 md:grid-cols-2 gap-6">
					<div>
						<label class="block mb-2">Investment Type</label> <select
							name="investmentType"
							class="w-full p-3 border border-gray-300 rounded-lg">
							<option value="">Select Investment</option>
							<option value="BSP" ${selectedType == 'BSP' ? 'selected' : ''}>Basic
								Savings Plan</option>
							<option value="SPP" ${selectedType == 'SPP' ? 'selected' : ''}>Savings
								Plan Plus</option>
							<option value="MSI" ${selectedType == 'MSI' ? 'selected' : ''}>Managed
								Stocked Investments</option>
						</select>
					</div>

					<div>
						<label class="block mb-2">Initial Lump Sum</label> <input
							type="number" name="initialLumpSum" value="${selectedInitial}"
							class="w-full p-3 border border-gray-300 rounded-lg"
							placeholder="£" />
					</div>

					<div>
						<label class="block mb-2">Monthly Investment</label> <input
							type="number" name="monthlyInvestment" value="${selectedMonthly}"
							class="w-full p-3 border border-gray-300 rounded-lg"
							placeholder="£" />
					</div>

					<div class="bg-blue-100 p-4 rounded-lg">
						<p class="flex items-center">
							<i class="fas fa-info-circle mr-2 text-blue-500"></i> Investment
							Plans Information
						</p>
						<p class="flex items-center mt-2">
							<i class="fas fa-check-circle mr-2 text-green-500"></i> Basic
							Plan: 1.2% - 2.4% returns
						</p>
						<p class="flex items-center mt-2">
							<i class="fas fa-check-circle mr-2 text-green-500"></i> Plus
							Plan: 3% - 5.5% returns
						</p>
						<p class="flex items-center mt-2">
							<i class="fas fa-check-circle mr-2 text-green-500"></i> Managed
							Stocks: 4% - 23% returns
						</p>
					</div>
				</div>

				<div class="flex justify-end mt-4">
					<button type="submit"
						class="w-1/4 p-3 bg-green-500 text-white rounded-lg flex items-center justify-center">
						<i class="fas fa-calculator mr-2"></i> Calculate Investment
					</button>
				</div>
			</form:form>
		</div>

		<!-- Results Section -->
		<c:if test="${not empty calculationResult}">
			<div class="bg-blue-50 p-6 rounded-lg mb-8">
				<h2 class="text-xl font-bold mb-4">Investment Projections</h2>

				<!-- Year Projections -->
				<c:forEach items="one,five,ten" var="period" varStatus="status">
					<c:set var="yearNumber"
						value="${status.index == 0 ? '1' : status.index == 1 ? '5' : '10'}" />

					<div class="mb-8">
						<h3 class="font-bold mb-4">${yearNumber}Year Projection</h3>
						<div class="grid grid-cols-1 md:grid-cols-4 gap-4">
							<div class="bg-blue-100 p-4 rounded-lg">
								<p>Minimum Return</p>
								<p class="text-center font-bold">
									<fmt:formatNumber
										value="${calculationResult[period += 'YearMin']}"
										type="currency" currencySymbol="£" />
								</p>
							</div>
							<div class="bg-blue-100 p-4 rounded-lg">
								<p>Maximum Return</p>
								<p class="text-center font-bold">
									<fmt:formatNumber
										value="${calculationResult[period += 'YearMax']}"
										type="currency" currencySymbol="£" />
								</p>
							</div>
							<div class="bg-blue-100 p-4 rounded-lg">
								<p>Total Fees</p>
								<p class="text-center font-bold">
									<fmt:formatNumber
										value="${calculationResult[period += 'YearFees']}"
										type="currency" currencySymbol="£" />
								</p>
							</div>
							<div class="bg-blue-100 p-4 rounded-lg">
								<p>Total Tax</p>
								<p class="text-center font-bold">
									<fmt:formatNumber
										value="${calculationResult[period += 'YearMaxTax']}"
										type="currency" currencySymbol="£" />
								</p>
							</div>
						</div>
					</div>
				</c:forEach>

				<!-- Save Investment Button -->
				<div class="flex justify-end mt-6">
					<form:form action="investmentsSave" method="POST">
						<input type="hidden" name="investmentType" value="${selectedType}" />
						<input type="hidden" name="initialLumpSum"
							value="${selectedInitial}" /> <input type="hidden"
							name="monthlyInvestment" value="${selectedMonthly}" />
						<button type="submit"
							class="px-6 py-3 bg-green-500 text-white rounded-lg flex items-center justify-center">
							<i class="fas fa-save mr-2"></i> Save Investment
						</button>
					</form:form>
				</div>
			</div>
		</c:if>

		<!-- Messages -->
		<c:if test="${not empty success}">
			<div
				class="bg-green-100 border-l-4 border-green-500 text-green-700 p-4 mb-4">
				${success}</div>
		</c:if>
		<c:if test="${not empty error}">
			<div
				class="bg-red-100 border-l-4 border-red-500 text-red-700 p-4 mb-4">
				${error}</div>
		</c:if>
	</div>

	<jsp:include page="/WEB-INF/views/footer.jsp" />
</body>
</html>

<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Enomy-Finances Dashboard</title>
<script src="https://cdn.tailwindcss.com"></script>
</head>
<body class="bg-gray-100 text-gray-900">

	<!-- Navbar -->
	<jsp:include page="/WEB-INF/views/header.jsp" />
	<!-- Sidebar + Content Wrapper -->
	<div class=" mt-[60px]">

		<!-- Main Content -->
		<main class="flex-1 p-6">

			<!-- User Overview -->
			<div class="bg-white p-6 shadow-md rounded-lg mb-6">
				<h2 class="text-2xl font-bold text-[#22446C]">Welcome,
					${user.fname} ${user.lname}</h2>
				<p class="text-gray-600">Your financial summary at a glance.</p>
			</div>

			<!-- Grid Layout for Financial Summary -->
			<div class="grid grid-cols-1 md:grid-cols-3 gap-6">

				<!-- Account Balance -->
				<div class="bg-white p-6 shadow-md rounded-lg">
					<h3 class="text-xl font-semibold text-[#22446C]">Account
						Balance</h3>
					<p class="text-3xl font-bold mt-2">£12,450.50</p>
				</div>

				<!-- Investments -->
				<div class="bg-white p-6 shadow-md rounded-lg">
					<h3 class="text-xl font-semibold text-[#22446C]">Investments</h3>
					<p class="text-3xl font-bold mt-2">£28,900.00</p>
				</div>

				<!-- Currency Holdings -->
				<div class="bg-white p-6 shadow-md rounded-lg">
					<h3 class="text-xl font-semibold text-[#22446C]">Currency
						Holdings</h3>
					<p class="text-lg mt-2">USD: $3,500 | EUR: €2,000</p>
				</div>

			</div>


			<!-- Recent Transactions -->
			<div class="mt-6 bg-white p-6 items-center shadow-md rounded-lg">
				<h3 class="text-2xl font-semibold text-[#22446C] mb-4">Recent
					Transactions</h3>
				<table class="w-full text-center border-collapse">
					<thead>
						<tr class="bg-[#22446C] text-white">
							<th class="px-4 py-2">Date</th>
							<th class="px-4 py-2">Type</th>
							<th class="px-4 py-2">Amount</th>
							<th class="px-4 py-2">Status</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach items="${investments}" var="investment"
							varStatus="loop">
							<c:if test="${loop.index < 3}">
								<tr class="border-b">
									<td class="px-4 py-2"><c:if
											test="${not empty investment.investmentDate}">
        ${investment.investmentDate.dayOfMonth}/${investment.investmentDate.monthValue}/${investment.investmentDate.year}
    </c:if></td>
									<td class="px-4 py-2">Investment
										(${investment.investmentType})</td>
									<td class="px-4 py-2">£<fmt:formatNumber
											value="${investment.initialLumpSum}" pattern="#,##0.00" /></td>
									<td class="px-4 py-2 text-green-600">Completed</td>
								</tr>
							</c:if>
						</c:forEach>
						<c:forEach items="${exchanges}" var="exchange" varStatus="loop">
							<c:if test="${loop.index < 3}">
								<tr class="border-b">
									<td class="px-4 py-2"><c:if
											test="${not empty exchange.transactionDate}">
        ${exchange.transactionDate.dayOfMonth}/${exchange.transactionDate.monthValue}/${exchange.transactionDate.year}
    </c:if></td>
									<td class="px-4 py-2">Currency Exchange
										(${exchange.fromCurrency} to ${exchange.toCurrency})</td>
									<td class="px-4 py-2">${exchange.fromCurrency}<fmt:formatNumber
											value="${exchange.originalAmount}" pattern="#,##0.00" /></td>
									<td class="px-4 py-2 text-green-600">Completed</td>
								</tr>
							</c:if>
						</c:forEach>
					</tbody>
				</table>
			</div>
		</main>
	</div>
	<!-- Footer -->
	<jsp:include page="/WEB-INF/views/footer.jsp" />

</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page isELIgnored="false"%>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Admin Dashboard</title>
<script src="https://cdn.tailwindcss.com"></script>
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css">
</head>
<body class="bg-gray-100">

	<jsp:include page="/WEB-INF/views/header.jsp" />

	<div class="max-w-7xl mx-auto mt-20 mb-8">
		<h1 class="text-4xl font-bold text-left mb-8">Admin Dashboard</h1>

		<div class="grid grid-cols-1 lg:grid-cols-3 gap-4">
			<div class="lg:col-span-2">
				<!-- Users Section -->
				<div class="bg-white p-4 rounded-lg shadow-md mb-4">
					<div class="flex justify-between items-center mb-2">
						<h2 class="text-xl font-semibold">Registered Users</h2>
						<span class="text-sm text-gray-500">${totalUsers} total
							users</span>
					</div>
					<div class="overflow-x-auto">
						<table class="w-full text-center">
							<thead class="bg-[#22446C] text-white">
								<tr>
									<th class="p-2">Name</th>
									<th class="p-2">Email</th>
									<th class="p-2">Phone Number</th>
									<th class="p-2">Role</th>
								</tr>
							</thead>
							<tbody>
								<c:forEach items="${users}" var="user">
									<tr class="even:bg-gray-100">
										<td class="p-2">${user.fname}${user.lname}</td>
										<td class="p-2">${user.email}</td>
										<td class="p-2">${user.contactNumber}</td>
										<td class="p-2"><c:forEach items="${user.roles}"
												var="role" varStatus="status">
					                        ${role.roleName}${!status.last ? ', ' : ''}
					                    </c:forEach></td>
									</tr>
								</c:forEach>
							</tbody>
						</table>
					</div>
				</div>

				<!-- Investments Section -->
				<div class="bg-white p-4 rounded-lg shadow-md mb-4">
					<div class="flex justify-between items-center mb-2">
						<h2 class="text-xl font-semibold">Investment Transactions</h2>
						<span class="text-sm text-gray-500">${totalInvestments}
							total investments</span>
					</div>
					<div class="overflow-x-auto">
						<table class="w-full text-center">
							<thead class="bg-[#22446C] text-white">
								<tr>
									<th class="p-2">User</th>
									<th class="p-2">Type</th>
									<th class="p-2">Initial Sum</th>
									<th class="p-2">Monthly</th>
									<th class="p-2">Return</th>
									<th class="p-2">Date</th>
								</tr>
							</thead>
							<tbody>
								<c:forEach items="${investments}" var="investment">
									<tr class="even:bg-gray-100">
										<td class="p-2">${investment.user.fname}${investment.user.lname}</td>
										<td class="p-2">${investment.investmentType}</td>
										<td class="p-2">£<fmt:formatNumber
												value="${investment.initialLumpSum}" pattern="#,##0.00" /></td>
										<td class="p-2">£<fmt:formatNumber
												value="${investment.monthlyInvestment}" pattern="#,##0.00" /></td>
										<td class="p-2">£<fmt:formatNumber
												value="${investment.oneYearReturn}" pattern="#,##0.00" /></td>
										<td class="p-2">
											${investment.investmentDate.dayOfMonth}/${investment.investmentDate.monthValue}/${investment.investmentDate.year}
										</td>
									</tr>
								</c:forEach>
							</tbody>
						</table>
					</div>
				</div>

				<!-- Currency Exchange Section -->
				<div class="bg-white p-4 rounded-lg shadow-md mb-4">
					<div class="flex justify-between items-center mb-2">
						<h2 class="text-xl font-semibold">Currency Exchange
							Transactions</h2>
					</div>
					<div class="overflow-x-auto">
						<table class="w-full text-center">
							<thead class="bg-[#22446C] text-white">
								<tr>
									<th class="p-2">User</th>
									<th class="p-2">From</th>
									<th class="p-2">To</th>
									<th class="p-2">Amount</th>
									<th class="p-2">Rate</th>
									<th class="p-2">Date</th>
								</tr>
							</thead>
							<tbody>
								<c:forEach items="${exchanges}" var="exchange">
									<tr class="even:bg-gray-100">
										<td class="p-2">${exchange.user.fname}
											${exchange.user.lname}</td>
										<td class="p-2">${exchange.fromCurrency}</td>
										<td class="p-2">${exchange.toCurrency}</td>
										<td class="p-2">${exchange.fromCurrency} <fmt:formatNumber
												value="${exchange.originalAmount}" pattern="#,##0.00" />
										</td>
										<td class="p-2"><fmt:formatNumber
												value="${exchange.exchangeRate}" pattern="#,##0.00" /></td>
										<td class="p-2"><c:if
												test="${not empty exchange.transactionDate}">
                        ${exchange.transactionDate.dayOfMonth}/${exchange.transactionDate.monthValue}/${exchange.transactionDate.year}
                    </c:if></td>
									</tr>
								</c:forEach>
							</tbody>
						</table>
					</div>
				</div>
			</div>

			<!-- Statistics Cards -->
			<div class="lg:col-span-1 space-y-4">
				<div class="bg-white p-4 rounded-lg shadow-md">
					<div class="flex flex-col items-center justify-center">
						<div
							class="bg-blue-100 rounded-full w-16 h-16 flex items-center justify-center mb-2">
							<i class="fas fa-users text-blue-500 text-xl"></i>
						</div>
						<div class="text-center">
							<p class="text-lg">Total Users</p>
							<p class="text-2xl font-bold">${totalUsers}</p>
						</div>
					</div>
				</div>

				<div class="bg-white p-4 rounded-lg shadow-md">
					<div class="flex flex-col items-center justify-center">
						<div
							class="bg-green-100 rounded-full w-16 h-16 flex items-center justify-center mb-2">
							<i class="fas fa-chart-line text-green-500 text-xl"></i>
						</div>
						<div class="text-center">
							<p class="text-lg">Total Investments</p>
							<p class="text-2xl font-bold">${totalInvestments}</p>
						</div>
					</div>
				</div>

				<div class="bg-white p-4 rounded-lg shadow-md">
					<div class="flex flex-col items-center justify-center">
						<div
							class="bg-yellow-100 rounded-full w-16 h-16 flex items-center justify-center mb-2">
							<i class="fas fa-exchange-alt text-yellow-500 text-xl"></i>
						</div>
						<div class="text-center">
							<p class="text-lg">Total Exchanges</p>
							<p class="text-2xl font-bold">${exchanges.size()}</p>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>

	<jsp:include page="/WEB-INF/views/footer.jsp" />

</body>
</html>

<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page isELIgnored="false"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Currency Exchange</title>
<script src="https://cdn.tailwindcss.com"></script>
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css">
</head>
<body>

	<!-- Navbar -->
	<jsp:include page="/WEB-INF/views/header.jsp" />

	<div class="mt-20 mx-auto p-8">
		<h1 class="text-3xl font-bold mb-8">Currency Exchange</h1>
		<div class="bg-blue-50 p-6 rounded-lg mb-8">
			<form:form modelAttribute="currencyExchange" action="exchange"
				method="post" class="grid grid-cols-1 md:grid-cols-2 gap-6">
				<div>
					<label class="block mb-2">From Currency</label>
					<form:select path="fromCurrency"
						class="w-full p-3 border border-gray-300 rounded-lg"
						required="true">
						<form:option value="">Select Currency</form:option>
						<form:options items="${currencies}" />
					</form:select>
					<form:errors path="fromCurrency" class="text-red-500 text-sm" />
				</div>

				<div>
					<label class="block mb-2">To Currency</label>
					<form:select path="toCurrency"
						class="w-full p-3 border border-gray-300 rounded-lg"
						required="true">
						<form:option value="">Select Currency</form:option>
						<form:options items="${currencies}" />
					</form:select>
					<form:errors path="toCurrency" class="text-red-500 text-sm" />
				</div>

				<div>
					<label class="block mb-2">Amount</label>
					<form:input path="originalAmount" type="number" min="300"
						max="5000" step="0.01"
						class="w-full p-3 border border-gray-300 rounded-lg"
						placeholder="Enter Amount" required="true" />
					<p class="text-sm text-gray-500 mt-1">Min: 300 - Max: 5000</p>
					<form:errors path="originalAmount" class="text-red-500 text-sm" />
				</div>

				<div class="flex justify-end items-end col-span-1 md:col-span-2">
					<button type="submit"
						class="w-1/4 p-3 bg-green-500 text-white rounded-lg hover:bg-green-600">
						Calculate</button>
				</div>
			</form:form>
		</div>

		<%-- Show Exchange Results Only If Available --%>
		<c:if test="${not empty exchange}">
			<div class="bg-blue-50 p-6 rounded-lg mb-8">
				<h2 class="text-xl font-bold mb-4">Exchange Result</h2>
				<div class="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-3 gap-6">
					<div class="bg-blue-100 p-4 rounded-lg">
						<p class="font-bold">Original Amount</p>
						<p class="text-center">${exchange.originalAmount}</p>
					</div>
					<div class="bg-blue-100 p-4 rounded-lg">
						<p class="font-bold">Exchange Rate</p>
						<p class="text-center">1 = ${exchange.exchangeRate}</p>
					</div>
					<div class="bg-blue-100 p-4 rounded-lg">
						<p class="font-bold">Converted Amount</p>
						<p class="text-center">${exchange.convertedAmount}</p>
					</div>
					<div class="bg-blue-100 p-4 rounded-lg">
						<p class="font-bold">Fee Percentage</p>
						<p class="text-center">${exchange.feePercentage}%</p>
					</div>
					<div class="bg-blue-100 p-4 rounded-lg">
						<p class="font-bold">Fee Amount</p>
						<p class="text-center">${exchange.feeAmount}</p>
					</div>
					<div class="bg-blue-100 p-4 rounded-lg">
						<p class="font-bold">Final Amount</p>
						<p class="text-center">${exchange.finalAmount}</p>
					</div>
				</div>
			</div>
		</c:if>

	</div>

	<!-- Footer -->
	<jsp:include page="/WEB-INF/views/footer.jsp" />

</body>
</html>

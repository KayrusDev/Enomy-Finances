<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page isELIgnored="false"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Registration Confirmation - Enomy-Finances</title>
<script src="https://cdn.tailwindcss.com"></script>
<style>
/* Moving gradient background */
body {
	background: linear-gradient(45deg, #22446c, #3a6fa6, #5e9edf, #0071b9);
	background-size: 300% 300%;
	animation: gradientMove 10s infinite alternate;
}

@
keyframes gradientMove { 0% {
	background-position: 0% 50%;
}
100
%
{
background-position
:
100%
50%;
}
}
</style>
</head>
<body class="flex items-center justify-center min-h-screen">

	<div
		class="bg-white shadow-lg max-w-4xl w-full mx-4 md:mx-0 flex flex-col md:flex-row rounded-lg">
		<!-- Left Section -->
		<div
			class="bg-[#22446C] rounded-t-lg md:rounded-l-lg md:rounded-tr-none p-8 w-full md:w-1/2 flex flex-col items-center text-white">
			<div class="p-4 mb-4">
				<svg xmlns="http://www.w3.org/2000/svg" width="50" height="50"
					viewBox="0 0 24 24" fill="none" stroke="currentColor"
					stroke-width="2" stroke-linecap="round" stroke-linejoin="round"
					class="lucide lucide-clipboard-check text-white">
                    <rect width="8" height="4" x="8" y="2" rx="1" ry="1" />
                    <path
						d="M16 4h2a2 2 0 0 1 2 2v14a2 2 0 0 1-2 2H6a2 2 0 0 1-2-2V6a2 2 0 0 1 2-2h2" />
                    <path d="m9 14 2 2 4-4" />
                </svg>
			</div>
			<h2 class="text-2xl font-bold mb-2">Registration Successful!</h2>
			<p class="text-center mb-6 px-4">
				Thank you for registering with <span class="font-bold">Enomy-Finances</span>.
				Your account has been created successfully.
			</p>

			<div class="bg-white p-4 rounded-lg shadow-md w-full text-[#22446C]">
				<h3 class="font-bold mb-2">Next Steps:</h3>
				<ul class="text-lg space-y-2">
					<li>📧 Check Your Email</li>
					<li>🔐 Secure Your Account</li>
					<li>💳 Explore Services</li>
				</ul>
			</div>
		</div>

		<!-- Right Section -->
		<div
			class="bg-gray-100 p-8 w-full md:w-1/2 rounded-b-lg md:rounded-br-lg md:rounded-bl-none flex flex-col justify-center">
			<h3 class="text-xl font-bold text-[#1F2937] text-left mb-6">Account
				Details</h3>

			<!-- Centering Account Details -->
			<div class="flex flex-col items-center space-y-4">
				<table class="w-full text-[#1F2937]">
					<tbody>
						<tr class="border-b border-gray-300">
							<td class="font-bold py-2">Name:</td>
							<td class="py-2 text-right">${user.fname} ${user.lname}</td>
						</tr>
						<tr class="border-b border-gray-300">
							<td class="font-bold py-2">Email:</td>
							<td class="py-2 text-right">${user.email}</td>
						</tr>
						<tr class="border-b border-gray-300">
							<td class="font-bold py-2">Contact:</td>
							<td class="py-2 text-right">${user.contactNumber}</td>
						</tr>
						<tr>
							<td class="font-bold py-2">Account Type:</td>
							<td class="py-2 text-right">Personal Account</td>
						</tr>
					</tbody>
				</table>
			</div>

			<!-- Buttons moved lower -->
			<div class="flex justify-center space-x-4 mt-10">
				<a href="login"
					class="bg-[#22446C] text-white py-2 px-4 rounded-md text-lg text-base hover:bg-[#1A3552] transition">
					Proceed to Login </a> <a href="index"
					class="bg-gray-300 text-black py-2 px-4 rounded-md text-base text-lg  hover:bg-gray-400 transition">
					Return to Home </a>
			</div>
		</div>
	</div>

</body>
</html>

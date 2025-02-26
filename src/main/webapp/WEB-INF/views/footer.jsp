<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <script src="https://unpkg.com/@tailwindcss/browser@4"></script>
</head>
<body>
    <footer class="bg-[#22446c] text-white py-10">
        <div class="flex flex-col items-center container mx-auto sm:flex-row sm:justify-between sm:items-start">
            <!-- Logo Section -->
            <div class="flex flex-col items-center sm:items-start mb-8 sm:mb-0">
                <img src="<c:url value='/images/enomy.png'/>" alt="Bank Logo" class="h-12 mb-4">
                <p class="text-sm">
                    Enomy-Finances - Empowering your financial future.
                </p>
            </div>
        
            <!-- Contact Details -->
            <div class="text-center sm:text-left mb-8 sm:mb-0">
                <h3 class="text-lg font-semibold mb-4">Contact Us</h3>
                <p class="text-sm">
                    Phone: <a href="tel:+1234567890" class="hover:text-[#3ae1ef]">+1 (234) 567-890</a><br>
                    Email: <a href="mailto:support@enomybanks.com" class="hover:text-[#3ae1ef]">support@enomybanks.com</a><br>
                    Address: 123 Finance St., New York, NY 10001
                </p>
            </div>
        
            <!-- Banking Services -->
            <div class="text-center sm:text-left">
                <h3 class="text-lg font-semibold mb-4">Our Services</h3>
                <ul class="text-sm space-y-2">
                    <li><a href="#" class="hover:text-[#3ae1ef]">Savings & Deposits</a></li>
                    <li><a href="#" class="hover:text-[#3ae1ef]">Mortgage Solutions</a></li>
                    <li><a href="#" class="hover:text-[#3ae1ef]">Currency Conversion</a></li>
                    <li><a href="#" class="hover:text-[#3ae1ef]">Investment Portfolios</a></li>
                </ul>
            </div>
        </div>
      
        <!-- Footer Bottom -->
        <div class="mt-8 border-t border-[white] pt-4 text-center">
            <p class="text-sm">
                &copy; 2025 Enomy-Finances. All rights reserved. | 
                <a href="#" class="hover:text-[#3ae1ef]">Privacy Policy</a> | 
                <a href="#" class="hover:text-[#3ae1ef]">Terms of Service</a>
            </p>
        </div>
    </footer>
</body>
</html>
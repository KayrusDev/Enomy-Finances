<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
    <title>Enomy-Finances</title>
    <script src="https://cdn.tailwindcss.com"></script>
    <script src="https://unpkg.com/lucide@latest"></script>
</head>
<body class="bg-gray-50 text-[#22446C]">

    <!-- Hero Section with Blurry Dark Background -->
    <section class="relative bg-cover bg-center h-[600px] flex items-center justify-center text-white"
        style="background-image: url('<c:url value="/images/rqt5o0kd.png"/>');">
        
        <!-- Dark and Blurry Overlay -->
        <div class="absolute inset-0 bg-black bg-opacity-40 backdrop-blur-md"></div>

        <!-- Hero Content -->
        <div class="relative z-10 text-center">
            <h1 class="text-5xl font-bold text-[#F2A900]">Welcome to Enomy-Finances</h1>
            <p class="text-lg mt-2 text-[#F4F4F4]">Your Trusted Partner in Mortgages, Savings, and Investments</p>
            <div class="mt-4">
                <a href="#features" class="bg-[#22446C] hover:bg-[#1B365D] text-white py-2 px-4 rounded-lg">Learn More</a>
                <a href="/EnomyFinances/register" class="bg-[#40B682] hover:bg-[#2E5A8C] text-white py-2 px-4 rounded-lg">Get Started</a>
            </div>
        </div>
    </section>
    
    <!-- Features Section -->
    <section id="features" class="py-20 bg-gray-100 text-[#22446C]">
        <div class="max-w-5xl mx-auto text-center">
            <h2 class="text-4xl font-bold mb-8 text-[#F2A900]">Our Services</h2>
            <div class="grid grid-cols-1 md:grid-cols-3 gap-8">
                <div class="p-8 bg-white shadow-lg rounded-lg flex flex-col items-center">
                    <i data-lucide="coins" class="w-12 h-12 text-[#22446C] mb-4"></i>
                    <h3 class="text-2xl font-semibold text-[#1B365D]">Currency Conversion</h3>
                    <p class="mt-3 text-[#2E5A8C] text-center">Get real-time conversion rates and calculate currency exchange costs with ease.</p>
                </div>
                <div class="p-8 bg-white shadow-lg rounded-lg flex flex-col items-center">
                    <i data-lucide="line-chart" class="w-12 h-12 text-[#40B682] mb-4"></i>
                    <h3 class="text-2xl font-semibold text-[#1B365D]">Investment Planning</h3>
                    <p class="mt-3 text-[#2E5A8C] text-center">Receive personalized investment quotes and plan your financial future.</p>
                </div>
                <div class="p-8 bg-white shadow-lg rounded-lg flex flex-col items-center">
                    <i data-lucide="shield-check" class="w-12 h-12 text-[#E63946] mb-4"></i>
                    <h3 class="text-2xl font-semibold text-[#1B365D]">Secure Data Storage</h3>
                    <p class="mt-3 text-[#2E5A8C] text-center">Your financial data is securely stored and managed with the highest security standards.</p>
                </div>
            </div>
        </div>
    </section>
    
    <!-- Contact Section -->
    <section class="py-20 text-[#22446C]">
        <div class="max-w-4xl mx-auto text-center">
            <h2 class="text-4xl font-bold mb-8 text-[#F2A900]">Get in Touch</h2>
            <p class="text-lg text-[#2E5A8C] mb-6">Have questions? Contact us for more information about our services.</p>
            <form class="mt-6 bg-white p-8 shadow-lg rounded-lg max-w-2xl mx-auto">
                <div class="mb-4 relative">
                    <i data-lucide="user" class="w-5 h-5 absolute left-4 top-4 text-[#C0C7D1]"></i>
                    <input type="text" placeholder="Your Name" class="w-full pl-12 p-4 border border-gray-300 rounded-lg focus:ring-2 focus:ring-[#22446C]">
                </div>
                <div class="mb-4 relative">
                    <i data-lucide="mail" class="w-5 h-5 absolute left-4 top-4 text-[#C0C7D1]"></i>
                    <input type="email" placeholder="Your Email" class="w-full pl-12 p-4 border border-gray-300 rounded-lg focus:ring-2 focus:ring-[#22446C]">
                </div>
                <div class="mb-4 relative">
                    <i data-lucide="message-circle" class="w-5 h-5 absolute left-4 top-4 text-[#C0C7D1]"></i>
                    <textarea placeholder="Your Message" class="w-full pl-12 p-4 border border-gray-300 rounded-lg h-32 focus:ring-2 focus:ring-[#22446C]"></textarea>
                </div>
                <button class="w-full bg-[#22446C] hover:bg-[#1B365D] text-white py-3 rounded-lg text-lg font-medium transition">
                    Send Message
                </button>
            </form>
        </div>
    </section>

    <script>
        lucide.createIcons();
    </script>
</body>
</html>
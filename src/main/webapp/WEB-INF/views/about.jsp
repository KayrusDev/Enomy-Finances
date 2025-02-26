<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>About Enomy-Finances</title>
    <script src="https://cdn.tailwindcss.com"></script>
</head>
<body class="bg-gray-100 text-gray-900">

         <!-- Navbar -->
        <jsp:include page="/WEB-INF/views/header.jsp" />

           <!-- Container -->
    <div class="w-full mx-auto mt-[50px] bg-white ">

  <!-- Section 1: About Enomy-Finances -->
  <section class=" h-[500px] w-full flex flex-col justify-center items-center text-center">
    <h2 class="text-3xl font-bold text-black mb-4">About Enomy-Finances</h2>
    <p class="text-lg text-black w-full md:w-1/2">
        Enomy-Finances is a leading financial services company providing expert advice on 
        <strong>mortgages, savings, and investments</strong>. Our mission is to empower individuals and 
        businesses to make informed financial decisions by offering tailored solutions that maximize 
        their financial potential.
    </p>
</section>

<!-- Section 2: Our Services -->
<section class="mb-12 text-white bg-cover bg-center bg-no-repeat h-[600px] w-full flex justify-center items-center" style="background-image: url('<c:url value="/images/9ixqi1c3.png"/>');">
    <div class="h-full flex flex-col justify-center items-center">
        <h2 class="text-3xl font-bold text-white mb-4">Our Services</h2>
        <ul class="list-none pl-0 text-lg">
            <li class="flex items-center mb-2">
                <svg xmlns="http://www.w3.org/2000/svg" width="15" height="15" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="lucide lucide-circle-check-big mr-2 text-green-400"><path d="M21.801 10A10 10 0 1 1 17 3.335"/><path d="m9 11 3 3L22 4"/></svg>
                Budgeting and debt consolidation advice
            </li>
            <li class="flex items-center mb-2">
                <svg xmlns="http://www.w3.org/2000/svg" width="15" height="15" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="lucide lucide-circle-check-big mr-2 text-green-400"><path d="M21.801 10A10 10 0 1 1 17 3.335"/><path d="m9 11 3 3L22 4"/></svg>
                Access to savings and investment opportunities
            </li>
            <li class="flex items-center mb-2">
                <svg xmlns="http://www.w3.org/2000/svg" width="15" height="15" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="lucide lucide-circle-check-big mr-2 text-green-400"><path d="M21.801 10A10 10 0 1 1 17 3.335"/><path d="m9 11 3 3L22 4"/></svg>
                Investment portfolio management
            </li>
            <li class="flex items-center mb-2">
                <svg xmlns="http://www.w3.org/2000/svg" width="15" height="15" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="lucide lucide-circle-check-big mr-2 text-green-400"><path d="M21.801 10A10 10 0 1 1 17 3.335"/><path d="m9 11 3 3L22 4"/></svg>
                Real-time currency conversion and exchange rate calculations
            </li>
            <li class="flex items-center mb-2">
                <svg xmlns="http://www.w3.org/2000/svg" width="15" height="15" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="lucide lucide-circle-check-big mr-2 text-green-400"><path d="M21.801 10A10 10 0 1 1 17 3.335"/><path d="m9 11 3 3L22 4"/></svg>
                Personalized investment quotes and projections
            </li>
        </ul>
    </div>
</section>

        <!-- Section 3: Why Choose Us? -->
        <section class="mb-12 h-[500px] w-full flex flex-col justify-center items-center">
            <h2 class="text-3xl font-bold text-[#22446C] mb-4">Why Choose Us?</h2>
            <p class="text-lg mb-4">
                Enomy-Finances is committed to innovation and client satisfaction. Our new computer 
                system will provide:
            </p>
            <ul class="list-none pl-0 text-lg text-left">
                <li class="flex items-center mb-2">
                    <svg xmlns="http://www.w3.org/2000/svg" width="15" height="15" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="lucide lucide-circle-check-big mr-2 text-blue-800"><path d="M21.801 10A10 10 0 1 1 17 3.335"/><path d="m9 11 3 3L22 4"/></svg>
                    Secure storage of user data, transaction records, and saved quotes
                </li>
                <li class="flex items-center mb-2">
                    <svg xmlns="http://www.w3.org/2000/svg" width="15" height="15" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="lucide lucide-circle-check-big mr-2 text-blue-800"><path d="M21.801 10A10 10 0 1 1 17 3.335"/><path d="m9 11 3 3L22 4"/></svg>
                    A simple and user-friendly interface with graphical data representation
                </li>
                <li class="flex items-center mb-2">
                    <svg xmlns="http://www.w3.org/2000/svg" width="15" height="15" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="lucide lucide-circle-check-big mr-2 text-blue-800"><path d="M21.801 10A10 10 0 1 1 17 3.335"/><path d="m9 11 3 3L22 4"/></svg>
                    Real-time financial insights for better decision-making
                </li>
                <li class="flex items-center mb-2">
                    <svg xmlns="http://www.w3.org/2000/svg" width="15" height="15" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="lucide lucide-circle-check-big mr-2 text-blue-800"><path d="M21.801 10A10 10 0 1 1 17 3.335"/><path d="m9 11 3 3L22 4"/></svg>
                    Web-based access for greater flexibility and convenience
                </li>
                <li class="flex items-center mb-2">
                    <svg xmlns="http://www.w3.org/2000/svg" width="15" height="15" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="lucide lucide-circle-check-big mr-2 text-blue-800"><path d="M21.801 10A10 10 0 1 1 17 3.335"/><path d="m9 11 3 3L22 4"/></svg>
                    Seamless error handling with automatic logging and caching
                </li>
            </ul>
        </section>

         <!-- Section 4: Contact Us -->
         <section class="bg-cover bg-center bg-no-repeat h-auto w-full" style="background-image: url('<c:url value="/images/ixmy3sdj.png"/>');">
            <div class="bg-black bg-opacity-50 p-6 h-full flex flex-col justify-center items-center">
                <h2 class="text-3xl font-bold text-white mb-4">Contact Us</h2>
                <p class="text-lg text-white mb-4">
                    Have questions? Get in touch with us to learn more about our services and how we can 
                    help you achieve your financial goals.
                </p>
                <div class="w-full md:w-1/2 lg:w-1/3 bg-white p-6 rounded-lg shadow-lg">
                    <form action="mailto:info@enomy-finances.com" method="post" enctype="text/plain">
                        <div class="mb-4">
                            <label for="email" class="block text-gray-700 text-sm font-bold mb-2">Email:</label>
                            <input type="email" id="email" name="email" class="shadow appearance-none border rounded w-full py-2 px-3 text-gray-700 leading-tight focus:outline-none focus:shadow-outline" required>
                        </div>
                        <div class="mb-4">
                            <label for="message" class="block text-gray-700 text-sm font-bold mb-2">Message:</label>
                            <textarea id="message" name="message" rows="4" class="shadow appearance-none border rounded w-full py-2 px-3 text-gray-700 leading-tight focus:outline-none focus:shadow-outline" required></textarea>
                        </div>
                        <div class="flex items-center justify-between">
                            <button type="submit" class="bg-[#22446C] text-white px-6 py-3 rounded-md hover:bg-[#1A3552] transition">
                                Send
                            </button>
                        </div>
                    </form>
                </div>
            </div>
        </section>

    </div>
 <!-- Footer -->
 <jsp:include page="/WEB-INF/views/footer.jsp" />
        

</body>
</html>

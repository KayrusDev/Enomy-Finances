<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <script src="https://cdn.tailwindcss.com"></script>
</head>
<body>
  <nav class="bg-[#22446c] fixed w-full z-20 top-0 start-0 border-b border-gray-200">
    <div class="max-w-screen-xl flex flex-wrap items-center justify-between mx-auto p-4">
      <a href="#" class="flex items-center space-x-3 rtl:space-x-reverse">
        <img src="<c:url value='/images/enomy.png'/>" class="h-8" alt="Enomy Logo">
        <span class="self-center text-2xl font-semibold whitespace-nowrap text-white">Enomy Finances</span>
      </a>
      
      <div class="flex md:order-2 space-x-3 md:space-x-0 rtl:space-x-reverse">
        <sec:authorize access="isAuthenticated()">
          <form:form action="logout" method="post">
            <button type="submit" class="text-white bg-red-600 hover:bg-red-700 font-medium rounded-lg text-sm px-4 py-2">Logout</button>
          </form:form>
        </sec:authorize>
        
        <sec:authorize access="isAnonymous()">
          <a href="/EnomyFinances/login" class="text-white bg-blue-600 px-4 py-2 rounded-lg hover:bg-blue-700">Sign In</a>
          <a href="/EnomyFinances/register" class="text-white bg-green-600 px-4 py-2 rounded-lg hover:bg-green-700">Open Account</a>
        </sec:authorize>
        
        <button id="mobile-menu-button" type="button" class="inline-flex items-center p-2 w-10 h-10 justify-center text-sm text-gray-500 rounded-lg md:hidden hover:bg-[#22446c] focus:outline-none focus:ring-2 focus:ring-gray-200">
          <span class="sr-only">Open main menu</span>
          <svg class="w-5 h-5" aria-hidden="true" xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 17 14">
            <path stroke="currentColor" stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M1 1h15M1 7h15M1 13h15" />
          </svg>
        </button>
      </div>
      
      <div class="items-center justify-between hidden w-full md:flex md:w-auto md:order-1" id="navbar-sticky">
        <ul class="flex flex-col p-4 md:p-0 mt-4 font-medium border border-gray-100 rounded-lg bg-[#22446c] md:space-x-8 rtl:space-x-reverse md:flex-row md:mt-0 md:border-0">
          <sec:authorize access="hasRole('USER')">
          <li>
            <a href="userdash" class="block py-2 px-3 text-white rounded-sm hover:bg-[#22446c] md:hover:bg-transparent md:hover:text-[#dce1e7]">Dashboard</a>
          </li>
          </sec:authorize>
          <sec:authorize access="hasAnyRole('USER', 'ADMIN')">
            <li>
              <a href="currencyexchange" class="block py-2 px-3 text-white rounded-sm hover:bg-[#22446c] md:hover:bg-transparent md:hover:text-[#dce1e7]">Currency Exchange</a>
            </li>
            <li>
              <a href="investment" class="block py-2 px-3 text-white rounded-sm hover:bg-[#22446c] md:hover:bg-transparent md:hover:text-[#dce1e7]">Savings & Investments</a>
            </li>
          </sec:authorize>
          
          <sec:authorize access="hasRole('ADMIN')">
            <li>
              <a href="adminpage" class="block py-2 px-3 text-white rounded-sm hover:bg-[#22446c] md:hover:bg-transparent md:hover:text-[#dce1e7]">Admin Dashboard</a>
            </li>
          </sec:authorize>
          
          <li>
            <a href="about" class="block py-2 px-3 text-white rounded-sm hover:bg-[#22446c] md:hover:bg-transparent md:hover:text-[#dce1e7]">About</a>
          </li>
        </ul>
      </div>
    </div>
  </nav>

  <script>
    document.addEventListener('DOMContentLoaded', function() {
        document.getElementById('mobile-menu-button').addEventListener('click', function() {
            var menu = document.getElementById('navbar-sticky');
            menu.classList.toggle('hidden');
        });
    });
  </script>
</body> 
</html>

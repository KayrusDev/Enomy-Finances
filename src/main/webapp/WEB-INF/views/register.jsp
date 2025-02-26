<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Create Account</title>
    <script src="https://cdn.tailwindcss.com"></script>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css">
    <style>
        /* Moving gradient background */
        body {
            background: linear-gradient(45deg, #22446c, #3a6fa6, #5e9edf, #0071b9);
            background-size: 300% 300%;
            animation: gradientMove 10s infinite alternate;
        }

        @keyframes gradientMove {
            0% {
                background-position: 0% 50%;
            }

            100% {
                background-position: 100% 50%;
            }
        }

        .input-container {
            position: relative;
        }

        .input-container .icon {
            position: absolute;
            left: 10px;
            top: 50%;
            transform: translateY(-50%);
            color: #9CA3AF;
        }

        .input-container input {
            padding-left: 2.5rem;
        }

        .input-container input:focus {
            outline: none;
        }

        .input-container input:focus + .line {
            width: 100%;
            transition: width 0.4s ease-in-out;
        }

        .line {
            position: absolute;
            bottom: 0;
            left: 50%;
            width: 0;
            height: 2px;
            background-color: #22446c;
            transition: width 0.4s ease-in-out, left 0.4s ease-in-out;
        }

        .input-container input:focus + .line {
            left: 0;
        }
    </style>
</head>

<body class="flex items-center justify-center min-h-screen bg-gray-100">
    <div class="flex flex-col md:flex-row bg-white rounded-lg shadow-lg overflow-hidden max-w-4xl w-full">
        <div class="relative text-white p-8 md:w-1/2 flex flex-col justify-center items-center">
            <!-- Background Image with Blur Effect -->
            <div class="absolute inset-0 bg-cover bg-center blur-sm" style="background-image: url('<c:url value="/images/l9xd6eih.png"/>');">
            </div>
        
            <div class="relative z-10 text-center">
                <h3 class="text-3xl font-bold mb-4">Hello, Friend!</h3>
                <p class="font-bold mb-8">Your Journey to Smarter Finances Starts Here – Sign Up Today.</p>
            </div>
        
            <!-- Bottom Right Positioned Text -->
            <p class="absolute bottom-4 right-4 text-sm font-medium z-10">
                Already have an account? 
                <a href="/EnomyFinances/login" class="text-[#89f9f5] hover:underline">Sign In</a>
            </p>
        </div>
        

        <div class="p-8 md:w-1/2 flex flex-col justify-center">
            <h2 class="text-3xl font-bold mb-4 text-center">Create Account</h2>
            <div class="flex justify-center space-x-4 mb-4">
                <a href="#" class="text-[#5e9edf]-500"><i class="fab fa-facebook-f"></i></a>
                <a href="#" class="text-#5e9edf-500"><i class="fab fa-google"></i></a>
                <a href="#" class="text-#5e9edf-500"><i class="fab fa-linkedin-in"></i></a>
            </div>
            <p class="text-center text-gray-500 mb-4">or use your email for registration</p>
            <form:form action="register" method="post" class="space-y-4">
            <input type="hidden" name="${_csrf.parameterName}"
					value="${_csrf.token}" />
                <div class="input-container mb-4">
                    <i class="fas fa-user icon"></i>
                    <input
                        class="w-full px-4 py-2 text-sm border rounded-lg focus:outline-none focus:ring-0"
                        type="text" placeholder="First Name" name="fname">
                    <div class="line"></div>
                </div>

                <div class="input-container mb-4">
                    <i class="fas fa-user icon"></i>
                    <input
                        class="w-full px-4 py-2 text-sm border rounded-lg focus:outline-none focus:ring-0"
                        type="text" placeholder="Last Name" name="lname">
                    <div class="line"></div>
                </div>

                <div class="input-container mb-4">
                    <i class="fas fa-envelope icon"></i>
                    <input
                        class="w-full px-4 py-2 text-sm border rounded-lg focus:outline-none focus:ring-0"
                        type="email" placeholder="Email" name="email">
                    <div class="line"></div>
                </div>

                <div class="input-container mb-4">
                    <i class="fas fa-phone icon"></i>
                    <input
                        class="w-full px-4 py-2 text-sm border rounded-lg focus:outline-none focus:ring-0"
                        type="tel" placeholder="Phone Number" name="contactNumber">
                    <div class="line"></div>
                </div>

                <div class="input-container mb-4">
                    <i class="fas fa-lock icon"></i>
                    <input
                        class="w-full px-4 py-2 text-sm border rounded-lg focus:outline-none focus:ring-0"
                        type="password" placeholder="Password" name="password">
                    <div class="line"></div>
                </div>

                <div class="input-container mb-4">
                    <i class="fas fa-lock icon"></i>
                    <input
                        class="w-full px-4 py-2 text-sm border rounded-lg focus:outline-none focus:ring-0"
                        type="password" placeholder="Confirm Password" name="confirmPassword">
                    <div class="line"></div>
                </div>

                <button
                    class="bg-blue-900 text-white py-2 px-4 rounded-full w-full hover:bg-blue-800 transition duration-300">SIGN
                    UP</button>
            </form:form>
        </div>
    </div>
</body>

</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Login Form</title>
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
    <div class="flex w-full max-w-4xl bg-white rounded-lg shadow-lg overflow-hidden">
        <!-- Login Section -->
        <div class="w-3/5 p-8">
            <h2 class="text-2xl font-bold text-center text-gray-800">Login</h2>
            <div class="flex justify-center mt-4">
                <a href="#" class="mx-2">
                    <i class="fab fa-facebook-f text-2xl text-gray-600"></i>
                </a>
                <a href="#" class="mx-2">
                    <i class="fab fa-google text-2xl text-gray-600"></i>
                </a>
                <a href="#" class="mx-2">
                    <i class="fab fa-linkedin-in text-2xl text-gray-600"></i>
                </a>
            </div>
            <p class="mt-4 text-center text-gray-600">or use your account</p>
             <form:form action="login" method="post" class="space-y-4">
            <input type="hidden" name="${_csrf.parameterName}"
					value="${_csrf.token}" />
            <div class="mt-4">
                <!-- Email Field -->
                <div class="input-container mb-4">
                    <i class="fas fa-envelope icon"></i>
                    <input name="username"
                        class="w-full px-4 py-2 text-sm border rounded-lg focus:outline-none focus:ring-0"
                        type="email" placeholder="Email">
                    <div class="line"></div>
                </div>

                <!-- Password Field -->
                <div class="input-container mb-4">
                    <i class="fas fa-lock icon"></i>
                    <input
                        class="w-full px-4 py-2 text-sm border rounded-lg focus:outline-none focus:ring-0"
                        type="password" placeholder="Password" name="password">
                    <div class="line"></div>
                </div>

                <!-- Remember Me Checkbox -->
                <div class="flex items-center mb-4">
                    <input
                        id="remember-me"
                        type="checkbox"
                        class="w-4 h-4 accent-blue-600 border-gray-300 rounded focus:ring-blue-500">
                    <label for="remember-me" class="ml-2 text-sm text-gray-600">Remember me</label>
                </div>

                <!-- Sign In Button -->
                <button type="submit"
                    class="w-full px-4 py-2 text-sm font-bold text-white bg-blue-900 rounded-full hover:bg-gray-700">SIGN
                    IN</button>
            </div>
            </form:form>
        </div>

        <!-- Welcome Section -->
        <div class="relative w-2/5 text-white p-8 flex flex-col items-center justify-center overflow-hidden">
            <!-- Background Image with Blur and Dark Overlay -->
            <div class="absolute inset-0 bg-cover bg-center" style="background-image: url('<c:url value="/images/2.jpg"/>'); filter: blur(1.5px);">
                <div class="absolute inset-0 bg-black opacity-40"></div>
            </div>
            
            <!-- Content -->
            <div class="relative z-10">
                <h3 class="text-2xl font-bold text-center">Welcome Back!</h3>
                <p class="mt-4 text-center">Enter your personal details and start your journey with us</p>
            </div>
            
            <!-- "Don't have an account?" Section -->
            <p class="absolute bottom-4 right-4 text-sm text-center">
                Don't have an account? 
                <a href="/EnomyFinances/register" class="text-[#6cd8d5] hover:underline">Sign Up</a>
            </p>
        </div>
    </div>
</body>

</html>
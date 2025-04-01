<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Exam Portal - Login</title>
    <script src="https://cdn.tailwindcss.com"></script>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
</head>
<body class="bg-gray-100 min-h-screen flex items-center justify-center">
    <div class="w-full max-w-md p-8 space-y-8 bg-white rounded-lg shadow-lg">
        <div class="text-center">
            <h1 class="text-3xl font-bold text-indigo-600">Exam Portal</h1>
            <p class="mt-2 text-gray-600">Sign in to your account</p>
        </div>
        
        <% if (request.getParameter("error") != null) { %>
            <div class="bg-red-100 border border-red-400 text-red-700 px-4 py-3 rounded relative" role="alert">
                <span class="block sm:inline"><%= request.getParameter("error") %></span>
            </div>
        <% } %>
        
        <% if (request.getParameter("registered") != null) { %>
            <div class="bg-green-100 border border-green-400 text-green-700 px-4 py-3 rounded relative" role="alert">
                <span class="block sm:inline">Registration successful! Please login.</span>
            </div>
        <% } %>

        <form class="mt-8 space-y-6" action="${pageContext.request.contextPath}/auth/login" method="POST">
            <div class="rounded-md shadow-sm space-y-4">
                <div>
                    <label for="email" class="sr-only">Email address</label>
                    <div class="relative">
                        <div class="absolute inset-y-0 left-0 pl-3 flex items-center pointer-events-none">
                            <i class="fas fa-envelope text-gray-400"></i>
                        </div>
                        <input id="email" name="email" type="email" required 
                               class="pl-10 block w-full px-3 py-2 border border-gray-300 rounded-md shadow-sm placeholder-gray-400 focus:outline-none focus:ring-indigo-500 focus:border-indigo-500" 
                               placeholder="Email address">
                    </div>
                </div>
                <div>
                    <label for="password" class="sr-only">Password</label>
                    <div class="relative">
                        <div class="absolute inset-y-0 left-0 pl-3 flex items-center pointer-events-none">
                            <i class="fas fa-lock text-gray-400"></i>
                        </div>
                        <input id="password" name="password" type="password" required 
                               class="pl-10 block w-full px-3 py-2 border border-gray-300 rounded-md shadow-sm placeholder-gray-400 focus:outline-none focus:ring-indigo-500 focus:border-indigo-500" 
                               placeholder="Password">
                    </div>
                </div>
            </div>

            <div class="flex items-center justify-between">
                <div class="flex items-center">
                    <input id="remember-me" name="remember-me" type="checkbox" 
                           class="h-4 w-4 text-indigo-600 focus:ring-indigo-500 border-gray-300 rounded">
                    <label for="remember-me" class="ml-2 block text-sm text-gray-700">Remember me</label>
                </div>

                <div class="text-sm">
                    <a href="#" class="font-medium text-indigo-600 hover:text-indigo-500">Forgot your password?</a>
                </div>
            </div>

            <div>
                <button type="submit" 
                        class="group relative w-full flex justify-center py-2 px-4 border border-transparent text-sm font-medium rounded-md text-white bg-indigo-600 hover:bg-indigo-700 focus:outline-none focus:ring-2 focus:ring-offset-2 focus:ring-indigo-500">
                    Sign in
                </button>
            </div>
        </form>

        <div class="text-center text-sm">
            <p class="text-gray-600">Don't have an account? 
                <a href="${pageContext.request.contextPath}/register.jsp" class="font-medium text-indigo-600 hover:text-indigo-500">Sign up</a>
            </p>
        </div>
    </div>
</body>
</html>
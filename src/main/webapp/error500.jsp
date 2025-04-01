<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Server Error | Exam Portal</title>
    <script src="https://cdn.tailwindcss.com"></script>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
</head>
<body class="bg-gray-100 min-h-screen flex items-center justify-center">
    <div class="text-center">
        <div class="inline-block p-8 bg-white rounded-lg shadow-lg">
            <div class="text-6xl text-red-500 mb-4">
                <i class="fas fa-server"></i>
            </div>
            <h1 class="text-3xl font-bold text-gray-800 mb-2">500 - Server Error</h1>
            <p class="text-gray-600 mb-6">Something went wrong on our end. Please try again later.</p>
            <div class="mb-6 p-3 bg-red-100 text-red-700 rounded">
                <p class="text-sm">${pageContext.exception.message}</p>
            </div>
            <a href="${pageContext.request.contextPath}/" 
               class="px-4 py-2 bg-indigo-600 text-white rounded-md hover:bg-indigo-700">
                <i class="fas fa-home mr-2"></i>Return to Home
            </a>
        </div>
    </div>
</body>
</html>
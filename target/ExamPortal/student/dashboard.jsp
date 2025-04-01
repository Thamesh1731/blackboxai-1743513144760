<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Student Dashboard | Exam Portal</title>
    <script src="https://cdn.tailwindcss.com"></script>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
</head>
<body class="bg-gray-100">
    <div class="flex h-screen">
        <!-- Sidebar -->
        <div class="w-64 bg-blue-800 text-white shadow-lg">
            <div class="p-4 border-b border-blue-700">
                <h1 class="text-xl font-bold">Exam Portal</h1>
                <p class="text-sm text-blue-200">Student Dashboard</p>
            </div>
            <nav class="p-4">
                <div class="mb-8">
                    <p class="text-xs uppercase text-blue-400 font-bold mb-4">Navigation</p>
                    <ul>
                        <li class="mb-2">
                            <a href="${pageContext.request.contextPath}/student/dashboard.jsp" 
                               class="flex items-center p-2 text-white bg-blue-700 rounded-lg">
                                <i class="fas fa-tachometer-alt mr-3"></i>
                                Dashboard
                            </a>
                        </li>
                        <li class="mb-2">
                            <a href="${pageContext.request.contextPath}/student/tests.jsp" 
                               class="flex items-center p-2 text-white hover:bg-blue-700 rounded-lg">
                                <i class="fas fa-clipboard-list mr-3"></i>
                                Available Tests
                            </a>
                        </li>
                        <li class="mb-2">
                            <a href="${pageContext.request.contextPath}/student/results.jsp" 
                               class="flex items-center p-2 text-white hover:bg-blue-700 rounded-lg">
                                <i class="fas fa-chart-bar mr-3"></i>
                                My Results
                            </a>
                        </li>
                    </ul>
                </div>
                <div>
                    <p class="text-xs uppercase text-blue-400 font-bold mb-4">Account</p>
                    <ul>
                        <li class="mb-2">
                            <a href="${pageContext.request.contextPath}/auth/logout" 
                               class="flex items-center p-2 text-white hover:bg-blue-700 rounded-lg">
                                <i class="fas fa-sign-out-alt mr-3"></i>
                                Logout
                            </a>
                        </li>
                    </ul>
                </div>
            </nav>
        </div>

        <!-- Main Content -->
        <div class="flex-1 overflow-auto">
            <!-- Header -->
            <header class="bg-white shadow-sm">
                <div class="flex justify-between items-center p-4">
                    <h2 class="text-xl font-semibold text-gray-800">Dashboard Overview</h2>
                    <div class="flex items-center space-x-4">
                        <span class="text-sm text-gray-600">Welcome, ${user.name}</span>
                        <div class="w-8 h-8 rounded-full bg-blue-600 flex items-center justify-center text-white">
                            ${fn:substring(user.name, 0, 1)}
                        </div>
                    </div>
                </div>
            </header>

            <!-- Dashboard Content -->
            <main class="p-6">
                <div class="grid grid-cols-1 md:grid-cols-3 gap-6 mb-6">
                    <!-- Stats Cards -->
                    <div class="bg-white rounded-lg shadow p-6">
                        <div class="flex items-center justify-between">
                            <div>
                                <p class="text-gray-500">Available Tests</p>
                                <h3 class="text-2xl font-bold">5</h3>
                            </div>
                            <div class="p-3 rounded-full bg-blue-100 text-blue-600">
                                <i class="fas fa-clipboard-list text-xl"></i>
                            </div>
                        </div>
                    </div>
                    <div class="bg-white rounded-lg shadow p-6">
                        <div class="flex items-center justify-between">
                            <div>
                                <p class="text-gray-500">Completed Tests</p>
                                <h3 class="text-2xl font-bold">3</h3>
                            </div>
                            <div class="p-3 rounded-full bg-green-100 text-green-600">
                                <i class="fas fa-check-circle text-xl"></i>
                            </div>
                        </div>
                    </div>
                    <div class="bg-white rounded-lg shadow p-6">
                        <div class="flex items-center justify-between">
                            <div>
                                <p class="text-gray-500">Average Score</p>
                                <h3 class="text-2xl font-bold">85%</h3>
                            </div>
                            <div class="p-3 rounded-full bg-yellow-100 text-yellow-600">
                                <i class="fas fa-star text-xl"></i>
                            </div>
                        </div>
                    </div>
                </div>

                <!-- Upcoming Tests -->
                <div class="bg-white rounded-lg shadow overflow-hidden mb-6">
                    <div class="p-4 border-b border-gray-200">
                        <h3 class="font-semibold text-lg">Upcoming Tests</h3>
                    </div>
                    <div class="divide-y divide-gray-200">
                        <div class="p-4 hover:bg-gray-50">
                            <div class="flex items-center justify-between">
                                <div>
                                    <p class="font-medium">Midterm Exam</p>
                                    <p class="text-sm text-gray-500">60 minutes, 25 questions</p>
                                </div>
                                <a href="${pageContext.request.contextPath}/student/test.jsp?id=1" 
                                   class="px-4 py-2 bg-blue-600 text-white rounded-md hover:bg-blue-700">
                                    Start Test
                                </a>
                            </div>
                        </div>
                        <div class="p-4 hover:bg-gray-50">
                            <div class="flex items-center justify-between">
                                <div>
                                    <p class="font-medium">Chapter 5 Quiz</p>
                                    <p class="text-sm text-gray-500">30 minutes, 15 questions</p>
                                </div>
                                <a href="${pageContext.request.contextPath}/student/test.jsp?id=2" 
                                   class="px-4 py-2 bg-blue-600 text-white rounded-md hover:bg-blue-700">
                                    Start Test
                                </a>
                            </div>
                        </div>
                    </div>
                </div>

                <!-- Recent Results -->
                <div class="bg-white rounded-lg shadow overflow-hidden">
                    <div class="p-4 border-b border-gray-200">
                        <h3 class="font-semibold text-lg">Recent Results</h3>
                    </div>
                    <div class="divide-y divide-gray-200">
                        <div class="p-4 hover:bg-gray-50">
                            <div class="flex items-center justify-between">
                                <div>
                                    <p class="font-medium">Chapter 4 Quiz</p>
                                    <p class="text-sm text-gray-500">Completed: 2 days ago</p>
                                </div>
                                <span class="px-3 py-1 rounded-full bg-green-100 text-green-800">92%</span>
                            </div>
                        </div>
                        <div class="p-4 hover:bg-gray-50">
                            <div class="flex items-center justify-between">
                                <div>
                                    <p class="font-medium">Chapter 3 Quiz</p>
                                    <p class="text-sm text-gray-500">Completed: 1 week ago</p>
                                </div>
                                <span class="px-3 py-1 rounded-full bg-green-100 text-green-800">88%</span>
                            </div>
                        </div>
                    </div>
                </div>
            </main>
        </div>
    </div>
</body>
</html>
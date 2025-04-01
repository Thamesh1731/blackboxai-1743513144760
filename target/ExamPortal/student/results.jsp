<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Exam Results | Exam Portal</title>
    <script src="https://cdn.tailwindcss.com"></script>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
    <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
</head>
<body class="bg-gray-100">
    <div class="flex h-screen">
        <!-- Sidebar (same as dashboard) -->
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
                               class="flex items-center p-2 text-white hover:bg-blue-700 rounded-lg">
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
                               class="flex items-center p-2 text-white bg-blue-700 rounded-lg">
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
                    <h2 class="text-xl font-semibold text-gray-800">Exam Results</h2>
                    <div class="flex items-center space-x-4">
                        <span class="text-sm text-gray-600">Welcome, ${user.name}</span>
                        <div class="w-8 h-8 rounded-full bg-blue-600 flex items-center justify-center text-white">
                            ${fn:substring(user.name, 0, 1)}
                        </div>
                    </div>
                </div>
            </header>

            <!-- Results Content -->
            <main class="p-6">
                <!-- Score Summary -->
                <div class="grid grid-cols-1 md:grid-cols-3 gap-6 mb-6">
                    <div class="bg-white rounded-lg shadow p-6">
                        <div class="flex items-center justify-between">
                            <div>
                                <p class="text-gray-500">Test Name</p>
                                <h3 class="text-xl font-bold">Midterm Exam</h3>
                            </div>
                            <div class="p-3 rounded-full bg-blue-100 text-blue-600">
                                <i class="fas fa-clipboard-list text-xl"></i>
                            </div>
                        </div>
                    </div>
                    <div class="bg-white rounded-lg shadow p-6">
                        <div class="flex items-center justify-between">
                            <div>
                                <p class="text-gray-500">Your Score</p>
                                <h3 class="text-xl font-bold">85%</h3>
                            </div>
                            <div class="p-3 rounded-full bg-green-100 text-green-600">
                                <i class="fas fa-star text-xl"></i>
                            </div>
                        </div>
                    </div>
                    <div class="bg-white rounded-lg shadow p-6">
                        <div class="flex items-center justify-between">
                            <div>
                                <p class="text-gray-500">Class Average</p>
                                <h3 class="text-xl font-bold">72%</h3>
                            </div>
                            <div class="p-3 rounded-full bg-yellow-100 text-yellow-600">
                                <i class="fas fa-users text-xl"></i>
                            </div>
                        </div>
                    </div>
                </div>

                <!-- Performance Chart -->
                <div class="bg-white rounded-lg shadow p-6 mb-6">
                    <h3 class="text-lg font-medium mb-4">Performance Breakdown</h3>
                    <div class="h-64">
                        <canvas id="performanceChart"></canvas>
                    </div>
                </div>

                <!-- Question Review -->
                <div class="bg-white rounded-lg shadow overflow-hidden">
                    <div class="p-4 border-b border-gray-200">
                        <h3 class="font-semibold text-lg">Question Review</h3>
                    </div>
                    <div class="divide-y divide-gray-200">
                        <!-- Correct Answer Example -->
                        <div class="p-4 hover:bg-gray-50">
                            <div class="flex items-start">
                                <div class="p-2 rounded-full bg-green-100 text-green-600 mr-3 mt-1">
                                    <i class="fas fa-check"></i>
                                </div>
                                <div class="flex-1">
                                    <p class="font-medium">Question 1: What is the capital of France?</p>
                                    <p class="text-sm text-gray-500 mt-1">Your answer: <span class="text-green-600 font-medium">Paris</span></p>
                                    <p class="text-sm text-gray-500">Correct answer: <span class="text-green-600 font-medium">Paris</span></p>
                                </div>
                            </div>
                        </div>
                        <!-- Incorrect Answer Example -->
                        <div class="p-4 hover:bg-gray-50">
                            <div class="flex items-start">
                                <div class="p-2 rounded-full bg-red-100 text-red-600 mr-3 mt-1">
                                    <i class="fas fa-times"></i>
                                </div>
                                <div class="flex-1">
                                    <p class="font-medium">Question 2: Which planet is known as the Red Planet?</p>
                                    <p class="text-sm text-gray-500 mt-1">Your answer: <span class="text-red-600 font-medium">Jupiter</span></p>
                                    <p class="text-sm text-gray-500">Correct answer: <span class="text-green-600 font-medium">Mars</span></p>
                                    <div class="mt-2 p-2 bg-blue-50 rounded border border-blue-100">
                                        <p class="text-sm text-blue-800"><span class="font-medium">Explanation:</span> Mars appears red due to iron oxide on its surface.</p>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

                <!-- Download Button -->
                <div class="mt-6 text-right">
                    <button onclick="downloadResults()" 
                            class="px-4 py-2 bg-indigo-600 text-white rounded-md hover:bg-indigo-700">
                        <i class="fas fa-download mr-2"></i>Download Results
                    </button>
                </div>
            </main>
        </div>
    </div>

    <script>
        // Initialize performance chart
        const ctx = document.getElementById('performanceChart').getContext('2d');
        const performanceChart = new Chart(ctx, {
            type: 'bar',
            data: {
                labels: ['Correct', 'Incorrect', 'Skipped'],
                datasets: [{
                    label: 'Questions',
                    data: [17, 3, 5],
                    backgroundColor: [
                        'rgba(16, 185, 129, 0.7)',
                        'rgba(239, 68, 68, 0.7)',
                        'rgba(156, 163, 175, 0.7)'
                    ],
                    borderColor: [
                        'rgba(16, 185, 129, 1)',
                        'rgba(239, 68, 68, 1)',
                        'rgba(156, 163, 175, 1)'
                    ],
                    borderWidth: 1
                }]
            },
            options: {
                responsive: true,
                maintainAspectRatio: false,
                scales: {
                    y: {
                        beginAtZero: true,
                        max: 25
                    }
                }
            }
        });

        function downloadResults() {
            // In a real implementation, this would generate a PDF report
            alert('Results download functionality would be implemented here');
        }
    </script>
</body>
</html>
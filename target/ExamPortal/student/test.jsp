<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Exam | Exam Portal</title>
    <script src="https://cdn.tailwindcss.com"></script>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
</head>
<body class="bg-gray-100">
    <div class="flex flex-col min-h-screen">
        <!-- Header -->
        <header class="bg-white shadow-sm">
            <div class="flex justify-between items-center p-4">
                <h1 class="text-xl font-semibold text-gray-800">Midterm Exam</h1>
                <div class="flex items-center space-x-4">
                    <div id="timer" class="px-3 py-1 bg-red-100 text-red-800 rounded-full font-bold">
                        60:00
                    </div>
                    <div class="w-8 h-8 rounded-full bg-blue-600 flex items-center justify-center text-white">
                        ${fn:substring(user.name, 0, 1)}
                    </div>
                </div>
            </div>
        </header>

        <!-- Progress Bar -->
        <div class="bg-white shadow-sm">
            <div class="h-1 bg-gray-200">
                <div id="progress" class="h-1 bg-blue-600" style="width: 0%"></div>
            </div>
        </div>

        <!-- Exam Content -->
        <main class="flex-1 p-6">
            <div class="max-w-4xl mx-auto bg-white rounded-lg shadow-lg overflow-hidden">
                <!-- Question Navigation -->
                <div class="bg-gray-50 p-4 border-b border-gray-200">
                    <div class="flex flex-wrap gap-2">
                        <c:forEach begin="1" end="25" varStatus="loop">
                            <button onclick="showQuestion(${loop.index})" 
                                    class="w-8 h-8 rounded-full flex items-center justify-center ${loop.index == 1 ? 'bg-blue-600 text-white' : 'bg-gray-200 text-gray-700'} hover:bg-blue-500 hover:text-white transition-colors">
                                ${loop.index}
                            </button>
                        </c:forEach>
                    </div>
                </div>

                <!-- Current Question -->
                <div class="p-6">
                    <div class="mb-6">
                        <h2 class="text-lg font-medium text-gray-900">Question 1</h2>
                        <p class="mt-2 text-gray-700">What is the capital of France?</p>
                    </div>

                    <div class="space-y-3">
                        <div class="flex items-center">
                            <input id="option1" name="answer" type="radio" class="h-4 w-4 text-blue-600 focus:ring-blue-500 border-gray-300">
                            <label for="option1" class="ml-3 block text-gray-700">London</label>
                        </div>
                        <div class="flex items-center">
                            <input id="option2" name="answer" type="radio" class="h-4 w-4 text-blue-600 focus:ring-blue-500 border-gray-300">
                            <label for="option2" class="ml-3 block text-gray-700">Paris</label>
                        </div>
                        <div class="flex items-center">
                            <input id="option3" name="answer" type="radio" class="h-4 w-4 text-blue-600 focus:ring-blue-500 border-gray-300">
                            <label for="option3" class="ml-3 block text-gray-700">Berlin</label>
                        </div>
                        <div class="flex items-center">
                            <input id="option4" name="answer" type="radio" class="h-4 w-4 text-blue-600 focus:ring-blue-500 border-gray-300">
                            <label for="option4" class="ml-3 block text-gray-700">Madrid</label>
                        </div>
                    </div>
                </div>

                <!-- Navigation Buttons -->
                <div class="bg-gray-50 p-4 border-t border-gray-200 flex justify-between">
                    <button onclick="previousQuestion()" 
                            class="px-4 py-2 bg-gray-200 text-gray-700 rounded-md hover:bg-gray-300">
                        <i class="fas fa-arrow-left mr-2"></i>Previous
                    </button>
                    <button onclick="nextQuestion()" 
                            class="px-4 py-2 bg-blue-600 text-white rounded-md hover:bg-blue-700">
                        Next<i class="fas fa-arrow-right ml-2"></i>
                    </button>
                </div>
            </div>
        </main>

        <!-- Submit Button (Fixed at bottom) -->
        <div class="sticky bottom-0 bg-white shadow-lg p-4">
            <button onclick="submitExam()" 
                    class="w-full py-3 px-4 bg-red-600 text-white rounded-md hover:bg-red-700 font-bold">
                <i class="fas fa-paper-plane mr-2"></i>Submit Exam
            </button>
        </div>
    </div>

    <script>
        // Timer functionality
        let minutes = 60;
        let seconds = 0;
        const timerElement = document.getElementById('timer');
        
        function updateTimer() {
            timerElement.textContent = `${minutes.toString().padStart(2, '0')}:${seconds.toString().padStart(2, '0')}`;
            
            if (seconds === 0) {
                if (minutes === 0) {
                    // Time's up!
                    alert('Time is up! Your exam will be submitted automatically.');
                    submitExam();
                    return;
                }
                minutes--;
                seconds = 59;
            } else {
                seconds--;
            }
            
            setTimeout(updateTimer, 1000);
        }
        
        // Start the timer when page loads
        updateTimer();
        
        // Question navigation
        let currentQuestion = 1;
        const totalQuestions = 25;
        
        function showQuestion(questionNumber) {
            // In a real implementation, this would fetch the question from the server
            currentQuestion = questionNumber;
            updateProgress();
            // Update UI to show current question
            console.log(`Showing question ${questionNumber}`);
        }
        
        function nextQuestion() {
            if (currentQuestion < totalQuestions) {
                showQuestion(currentQuestion + 1);
            }
        }
        
        function previousQuestion() {
            if (currentQuestion > 1) {
                showQuestion(currentQuestion - 1);
            }
        }
        
        function updateProgress() {
            const progress = (currentQuestion / totalQuestions) * 100;
            document.getElementById('progress').style.width = `${progress}%`;
        }
        
        function submitExam() {
            if (confirm('Are you sure you want to submit your exam?')) {
                // In a real implementation, this would submit answers to the server
                alert('Exam submitted successfully!');
                window.location.href = '${pageContext.request.contextPath}/student/results.jsp';
            }
        }
    </script>
</body>
</html>
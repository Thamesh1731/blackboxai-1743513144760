<div class="w-64 bg-indigo-800 text-white shadow-lg">
    <div class="p-4 border-b border-indigo-700">
        <h1 class="text-xl font-bold">Exam Portal</h1>
        <p class="text-sm text-indigo-200">Admin Dashboard</p>
    </div>
    <nav class="p-4">
        <div class="mb-8">
            <p class="text-xs uppercase text-indigo-400 font-bold mb-4">Navigation</p>
            <ul>
                <li class="mb-2">
                    <a href="${pageContext.request.contextPath}/admin/dashboard.jsp" 
                       class="flex items-center p-2 text-white hover:bg-indigo-700 rounded-lg">
                        <i class="fas fa-tachometer-alt mr-3"></i>
                        Dashboard
                    </a>
                </li>
                <li class="mb-2">
                    <a href="${pageContext.request.contextPath}/admin/tests.jsp" 
                       class="flex items-center p-2 text-white bg-indigo-700 rounded-lg">
                        <i class="fas fa-clipboard-list mr-3"></i>
                        Manage Tests
                    </a>
                </li>
                <li class="mb-2">
                    <a href="${pageContext.request.contextPath}/admin/results.jsp" 
                       class="flex items-center p-2 text-white hover:bg-indigo-700 rounded-lg">
                        <i class="fas fa-chart-bar mr-3"></i>
                        View Results
                    </a>
                </li>
                <li class="mb-2">
                    <a href="${pageContext.request.contextPath}/admin/users.jsp" 
                       class="flex items-center p-2 text-white hover:bg-indigo-700 rounded-lg">
                        <i class="fas fa-users mr-3"></i>
                        Manage Users
                    </a>
                </li>
            </ul>
        </div>
        <div>
            <p class="text-xs uppercase text-indigo-400 font-bold mb-4">Account</p>
            <ul>
                <li class="mb-2">
                    <a href="${pageContext.request.contextPath}/auth/logout" 
                       class="flex items-center p-2 text-white hover:bg-indigo-700 rounded-lg">
                        <i class="fas fa-sign-out-alt mr-3"></i>
                        Logout
                    </a>
                </li>
            </ul>
        </div>
    </nav>
</div>
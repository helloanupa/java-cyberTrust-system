<%@ page language="java" import="model.Admin" %>
<%
    Admin admin = (Admin) session.getAttribute("admin");
    if (admin == null) {
        response.sendRedirect("AdminLoginServlet");
        return;
    }
%>
<!DOCTYPE html>
<html lang="en">
<head>
<style>
body  {
  background-image: url("images/bank1.jpg");
}
</style>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Admin Dashboard - Cyber Trust Bank</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css">
    <script src="https://cdn.tailwindcss.com"></script>
</head>

<body class="bg-gray-50">
    <div class="min-h-screen">
        <!-- Header -->
        <header class="bg-white shadow-md">
            <div class="container mx-auto px-6 py-4">
                <div class="flex items-center justify-between">
                    <div class="flex items-center">
                        <a href="admin_dashboard.jsp" class="text-2xl font-bold text-blue-700">
                            <i class="fas fa-university mr-2"></i>Admin Dashboard
                        </a>
                    </div>
                    <div class="flex items-center space-x-4">
                        <span class="text-gray-600">
                            <i class="fas fa-user mr-2"></i><%= admin.getUsername() %>
                        </span>
                        <a  href="admin_login.jsp" class="text-red-600 hover:text-red-700">
                            <i class="fas fa-sign-out-alt mr-2"></i>Logout
                        </a>
                    </div>
                </div>
            </div>
        </header>

        <!-- Main Content -->
        <main class="container mx-auto px-6 py-8">
            <div class="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-3 gap-6">
                <!-- User Management Card -->
           

                <!-- Transaction Management Card -->
                

                <!-- Loan Management Card -->
                <div class="bg-white rounded-lg shadow-md p-6">
                    <div class="flex items-center justify-between mb-4">
                        <h3 class="text-lg font-semibold text-gray-800">Loan Management</h3>
                        <i class="fas fa-hand-holding-usd text-purple-600 text-2xl"></i>
                    </div>
                    <p class="text-gray-600 mb-4">Process and manage loan applications</p>
                    <a href="LoanManagementServlet" class="inline-flex items-center text-blue-600 hover:text-blue-800">
                        Manage Loans
                        <i class="fas fa-arrow-right ml-2"></i>
                    </a>
                </div>

                <!-- Support Tickets Card -->
                <div class="bg-white rounded-lg shadow-md p-6">
                    <div class="flex items-center justify-between mb-4">
                        <h3 class="text-lg font-semibold text-gray-800">Support Tickets</h3>
                        <i class="fas fa-ticket-alt text-yellow-600 text-2xl"></i>
                    </div>
                    <p class="text-gray-600 mb-4">Handle customer support requests</p>
                    <a href="SupportTicketServlet" class="inline-flex items-center text-blue-600 hover:text-blue-800">
                        View Tickets
                        <i class="fas fa-arrow-right ml-2"></i>
                    </a>
                </div>

                <!-- Contact Messages Card -->
                <div class="bg-white rounded-lg shadow-md p-6">
                    <div class="flex items-center justify-between mb-4">
                        <h3 class="text-lg font-semibold text-gray-800">Contact Messages</h3>
                        <i class="fas fa-envelope text-blue-600 text-2xl"></i>
                    </div>
                    <p class="text-gray-600 mb-4">View all contact messages</p>
                    <a href="ContactMessageServlet?action=admin" class="inline-flex items-center text-blue-600 hover:text-blue-800">
                        <i class="fas fa-envelope mr-2"></i>View Contact Messages
                    </a>
                </div>
            </div>
        </main>
    </div>
</body>
</html> 
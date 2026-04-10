<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="model.LoanApplication" %>
<%
    LoanApplication loan = (LoanApplication) request.getAttribute("loan");
    if (loan == null) {
        response.sendRedirect("LoanManagementServlet");
        return;
    }
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>View Loan Application - Admin Dashboard</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css">
    <script src="https://cdn.tailwindcss.com"></script>
    
</head>
<body class="bg-gray-50">
<style>body { background: #f4f8fb; font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif; 
background-image: url("images/bank1.jpg");}</style>
    <div class="min-h-screen">
        <!-- Header -->
        <header class="bg-white shadow-md">
            <div class="container mx-auto px-6 py-4">
                <div class="flex items-center justify-between">
                    <div class="flex items-center">
                        <a href="admin_dashboard.jsp" class="text-2xl font-bold text-blue-700">
                            <i class="fas fa-university mr-2"></i>Cyber Trust Bank
                        </a>
                    </div>
                    <div class="flex items-center space-x-4">
                        <a href="LogoutServlet" class="text-red-600 hover:text-red-700">
                            <i class="fas fa-sign-out-alt mr-2"></i>Logout
                        </a>
                    </div>
                </div>
            </div>
        </header>

        <!-- Main Content -->
        <main class="container mx-auto px-6 py-8">
            <div class="bg-white rounded-lg shadow-md p-8">
                <div class="flex justify-between items-center mb-6">
                    <h1 class="text-3xl font-bold text-gray-800">Loan Application Details</h1>
                    <a href="LoanManagementServlet" class="text-blue-600 hover:text-blue-800">
                        <i class="fas fa-arrow-left mr-2"></i>Back to List
                    </a>
                </div>

                <div class="grid grid-cols-1 md:grid-cols-2 gap-6">
                    <div class="space-y-4">
                        <div>
                            <h3 class="text-sm font-medium text-gray-500">Application ID</h3>
                            <p class="mt-1 text-lg text-gray-900"><%= loan.getId() %></p>
                        </div>
                        <div>
                            <h3 class="text-sm font-medium text-gray-500">Customer Name</h3>
                            <p class="mt-1 text-lg text-gray-900"><%= loan.getFname() %> <%= loan.getLname() %></p>
                        </div>
                        <div>
                            <h3 class="text-sm font-medium text-gray-500">Loan Type</h3>
                            <p class="mt-1 text-lg text-gray-900"><%= loan.getLoanType() %></p>
                        </div>
                        <div>
                            <h3 class="text-sm font-medium text-gray-500">Amount</h3>
                            <p class="mt-1 text-lg text-gray-900">Rs.<%= loan.getAmount() %></p>
                        </div>
                    </div>
                    <div class="space-y-4">
                        <div>
                            <h3 class="text-sm font-medium text-gray-500">Application Date</h3>
                            <p class="mt-1 text-lg text-gray-900"><%= loan.getDob() != null ? loan.getDob().toString() : "" %></p>
                        </div>
                        <div>
                            <h3 class="text-sm font-medium text-gray-500">Status</h3>
                            <p class="mt-1">
                                <span class="px-2 inline-flex text-xs leading-5 font-semibold rounded-full 
                                    <%= loan.getStatus().equals("Pending") ? "bg-yellow-100 text-yellow-800" : 
                                       loan.getStatus().equals("Approved") ? "bg-green-100 text-green-800" : 
                                       "bg-red-100 text-red-800" %>">
                                    <%= loan.getStatus() %>
                                </span>
                            </p>
                        </div>
                        <div>
                            <h3 class="text-sm font-medium text-gray-500">Purpose</h3>
                            <p class="mt-1 text-lg text-gray-900"><%= loan.getPurpose() %></p>
                        </div>
                    </div>
                </div>

                <% if (loan.getStatus().equals("Pending")) { %>
                    <div class="mt-8 border-t pt-6">
                        <h2 class="text-xl font-semibold text-gray-800 mb-4">Update Status</h2>
                        <form action="LoanManagementServlet" method="post" class="space-y-4">
                            <input type="hidden" name="action" value="updateStatus">
                            <input type="hidden" name="id" value="<%= loan.getId() %>">
                            
                            <div>
                                <label class="block text-sm font-medium text-gray-700">Status</label>
                                <select name="status" class="mt-1 block w-full pl-3 pr-10 py-2 text-base border-gray-300 focus:outline-none focus:ring-blue-500 focus:border-blue-500 sm:text-sm rounded-md">
                                    <option value="Approved">Approve</option>
                                    <option value="Rejected">Reject</option>
                                </select>
                            </div>

                            <div>
                                <label class="block text-sm font-medium text-gray-700">Admin Comment</label>
                                <textarea name="adminComment" rows="3" class="mt-1 block w-full border-gray-300 rounded-md shadow-sm focus:ring-blue-500 focus:border-blue-500 sm:text-sm"></textarea>
                            </div>

                            <div>
                                <button type="submit" class="inline-flex justify-center py-2 px-4 border border-transparent shadow-sm text-sm font-medium rounded-md text-white bg-blue-600 hover:bg-blue-700 focus:outline-none focus:ring-2 focus:ring-offset-2 focus:ring-blue-500">
                                    Update Status
                                </button>
                            </div>
                        </form>
                    </div>
                <% } %>
            </div>
        </main>
    </div>
</body>
</html> 
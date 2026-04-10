<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="model.LoanApplication" %>
<%@ page import="java.util.List" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%
    List<LoanApplication> loans = (List<LoanApplication>) request.getAttribute("loans");
    if (loans == null) {
        response.sendRedirect("LoanManagementServlet");
        return;
    }
    SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Loan Applications - Admin Dashboard</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css">
    <script src="https://cdn.tailwindcss.com"></script>
    <style >
   body { background: #f4f8fb; font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif; 
 background-image: url("images/bank1.jpg");}
    </style>
</head>
<body class="bg-gray-50">
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
                    <h1 class="text-3xl font-bold text-gray-800">Loan Applications</h1>
                </div>

                <% if (request.getParameter("success") != null) { %>
                    <div class="bg-green-100 border border-green-400 text-green-700 px-4 py-3 rounded mb-4">
                        Operation completed successfully!
                    </div>
                <% } %>

                <div class="overflow-x-auto">
                    <table class="min-w-full divide-y divide-gray-200">
                        <thead class="bg-gray-50">
                            <tr>
                                <th class="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase tracking-wider">ID</th>
                                <th class="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase tracking-wider">Customer</th>
                                <th class="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase tracking-wider">Amount</th>
                                <th class="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase tracking-wider">Type</th>
                                <th class="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase tracking-wider">Date</th>
                                <th class="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase tracking-wider">Status</th>
                                <th class="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase tracking-wider">Actions</th>
                            </tr>
                        </thead>
                        <tbody class="bg-white divide-y divide-gray-200">
                            <% for (LoanApplication loan : loans) { %>
                                <tr>
                                    <td class="px-6 py-4 whitespace-nowrap text-sm text-gray-500"><%= loan.getId() %></td>
                                    <td class="px-6 py-4 whitespace-nowrap text-sm text-gray-900"><%= loan.getFname() %> <%= loan.getLname() %></td>
                                    <td class="px-6 py-4 whitespace-nowrap text-sm text-gray-900">Rs.<%= loan.getAmount() %></td>
                                    <td class="px-6 py-4 whitespace-nowrap text-sm text-gray-900"><%= loan.getLoanType() %></td>
                                    <td class="px-6 py-4 whitespace-nowrap text-sm text-gray-500">
                                        <%= loan.getDob() != null ? sdf.format(loan.getDob()) : "" %>
                                    </td>
                                    <td class="px-6 py-4 whitespace-nowrap">
                                        <span class="px-2 inline-flex text-xs leading-5 font-semibold rounded-full 
                                            <%= loan.getStatus().equals("Pending") ? "bg-yellow-100 text-yellow-800" : 
                                               loan.getStatus().equals("Approved") ? "bg-green-100 text-green-800" : 
                                               "bg-red-100 text-red-800" %>">
                                            <%= loan.getStatus() %>
                                        </span>
                                    </td>
                                    <td class="px-6 py-4 whitespace-nowrap text-sm font-medium">
                                        <a href="LoanManagementServlet?action=view&id=<%= loan.getId() %>" 
                                           class="text-blue-600 hover:text-blue-900 mr-3">
                                            <i class="fas fa-eye"></i> View
                                        </a>
                                        <form action="LoanManagementServlet" method="post" class="inline">
                                            <input type="hidden" name="action" value="delete">
                                            <input type="hidden" name="id" value="<%= loan.getId() %>">
                                            <button type="submit" class="text-red-600 hover:text-red-900"
                                                    onclick="return confirm('Are you sure you want to delete this loan application?')">
                                                <i class="fas fa-trash"></i> Delete
                                            </button>
                                        </form>
                                    </td>
                                </tr>
                            <% } %>
                        </tbody>
                    </table>
                </div>
            </div>
        </main>
    </div>
</body>
</html> 
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.Map" %>
<%
    List<Map<String, String>> messages = (List<Map<String, String>>) request.getAttribute("messages");
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Admin - Contact Messages</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css">
    <script src="https://cdn.tailwindcss.com"></script>
    <style >
   body { background: #f4f8fb; font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif; 
 background-image: url("images/bank1.jpg");}
    </style>
</head>
<body class="bg-gray-50">
    <div class="min-h-screen">
        <header class="bg-white shadow-md">
            <div class="container mx-auto px-6 py-4 flex justify-between items-center">
                <h1 class="text-2xl font-bold text-blue-700">Contact Messages</h1>
                <a href="admin_dashboard.jsp" class="text-blue-600 hover:text-blue-800">Back to Dashboard</a>
            </div>
        </header>
        <main class="container mx-auto px-6 py-8">
            <% if (request.getAttribute("error") != null) { %>
                <div class="mb-4 p-4 bg-red-100 border border-red-400 text-red-700 rounded">
                    <%= request.getAttribute("error") %>
                </div>
            <% } %>
            <div class="bg-white rounded-lg shadow-md p-8">
                <table class="min-w-full divide-y divide-gray-200">
                    <thead class="bg-gray-50">
                        <tr>
                            <th class="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase tracking-wider">ID</th>
                            <th class="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase tracking-wider">Name</th>
                            <th class="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase tracking-wider">Email</th>
                            <th class="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase tracking-wider">Subject</th>
                            <th class="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase tracking-wider">Message</th>
                            <th class="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase tracking-wider">Timestamp</th>
                            <th class="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase tracking-wider">Status</th>
                            <th class="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase tracking-wider">Actions</th>
                        </tr>
                    </thead>
                    <tbody class="bg-white divide-y divide-gray-200">
                        <% if (messages != null) {
                            for (Map<String, String> msg : messages) { %>
                        <tr>
                            <td class="px-6 py-4 text-sm text-gray-500"><%= msg.get("id") %></td>
                            <td class="px-6 py-4 text-sm text-gray-900"><%= msg.get("name") %></td>
                            <td class="px-6 py-4 text-sm text-gray-900"><%= msg.get("email") %></td>
                            <td class="px-6 py-4 text-sm text-gray-900"><%= msg.get("subject") %></td>
                            <td class="px-6 py-4 text-sm text-gray-900"><%= msg.get("message") %></td>
                            <td class="px-6 py-4 text-sm text-gray-500"><%= msg.get("timestamp") %></td>
                            <td class="px-6 py-4 text-sm text-gray-900"><%= msg.get("status") %></td>
                            <td class="px-6 py-4 text-sm font-medium">
                                <div class="flex space-x-2">
                                    
                                    <form action="ContactMessageServlet" method="post" style="display:inline;">
                                        <input type="hidden" name="action" value="delete">
                                        <input type="hidden" name="id" value="<%= msg.get("id") %>">
                                        <button type="submit" class="text-red-600 hover:text-red-800" 
                                                onclick="return confirm('Are you sure you want to delete this message?')">Delete</button>
                                    </form>
                                </div>
                            </td>
                        </tr>
                        <% } } %>
                    </tbody>
                </table>
            </div>
        </main>
    </div>
</body>
</html> 
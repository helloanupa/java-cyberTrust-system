<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%
    String id = request.getParameter("id") != null ? request.getParameter("id") : (request.getAttribute("id") != null ? request.getAttribute("id").toString() : "");
    String name = request.getAttribute("name") != null ? request.getAttribute("name").toString() : "";
    String email = request.getAttribute("email") != null ? request.getAttribute("email").toString() : "";
    String subject = request.getAttribute("subject") != null ? request.getAttribute("subject").toString() : "";
    String message = request.getAttribute("message") != null ? request.getAttribute("message").toString() : "";
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Update Message - Cyber Trust Bank</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css">
    <script src="https://cdn.tailwindcss.com"></script>
    <style >
   body { background: #f4f8fb; font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif; 
 background-image: url("images/bank1.jpg");}
    </style>
</head>
<body class="bg-gray-50">
    <div class="min-h-screen flex items-center justify-center">
        <div class="bg-white p-8 rounded-lg shadow-md w-full max-w-md">
            <h1 class="text-2xl font-bold mb-6 text-center text-blue-700">Update Your Message</h1>
            <form action="ContactMessageServlet" method="post" class="space-y-4">
                <input type="hidden" name="action" value="update">
                <input type="hidden" name="id" value="<%= id %>">
                <div>
                    <label class="block text-sm font-medium text-gray-700">Name</label>
                    <input type="text" name="name" value="<%= name %>" required class="mt-1 block w-full border-gray-300 rounded-md shadow-sm focus:ring-blue-500 focus:border-blue-500">
                </div>
                <div>
                    <label class="block text-sm font-medium text-gray-700">Email</label>
                    <input type="email" name="email" value="<%= email %>" required class="mt-1 block w-full border-gray-300 rounded-md shadow-sm focus:ring-blue-500 focus:border-blue-500">
                </div>
                <div>
                    <label class="block text-sm font-medium text-gray-700">Subject</label>
                    <input type="text" name="subject" value="<%= subject %>" required class="mt-1 block w-full border-gray-300 rounded-md shadow-sm focus:ring-blue-500 focus:border-blue-500">
                </div>
                <div>
                    <label class="block text-sm font-medium text-gray-700">Message</label>
                    <textarea name="message" rows="4" required class="mt-1 block w-full border-gray-300 rounded-md shadow-sm focus:ring-blue-500 focus:border-blue-500"><%= message %></textarea>
                </div>
                <div class="flex space-x-4">
                    <button type="submit" class="w-1/2 py-2 px-4 bg-yellow-500 text-white rounded-md hover:bg-yellow-600">Update</button>
            </form>
            <form action="ContactMessageServlet" method="post" class="w-1/2">
                <input type="hidden" name="action" value="delete">
                <input type="hidden" name="id" value="<%= id %>">
                <button type="submit" class="w-full py-2 px-4 bg-red-600 text-white rounded-md hover:bg-red-700">Delete</button>
            </form>
                </div>
        </div>
    </div>
</body>
</html> 
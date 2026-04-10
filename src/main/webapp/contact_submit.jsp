<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.util.Map" %>
<%@ page import="dao.ContactMessageDAO" %>
<%
    String idParam = request.getParameter("id");
    Map<String, String> message = null;
    if (idParam != null && !idParam.isEmpty()) {
        try {
            int id = Integer.parseInt(idParam);
            message = new dao.ContactMessageDAO().getById(id);
            request.setAttribute("message", message);
        } catch (Exception e) {
            // Optionally handle error
        }
    }
    String success = request.getParameter("success");
    String error = (String) request.getAttribute("error");
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Message Submitted - Cyber Trust Bank</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css">
    <script src="https://cdn.tailwindcss.com"></script>
    <style>
        .modal {
            display: none;
            position: fixed;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            background-color: rgba(0,0,0,0.5);
            z-index: 1000;
        }
        .modal-content {
            position: relative;
            background-color: white;
            margin: 10% auto;
            padding: 20px;
            width: 80%;
            max-width: 500px;
            border-radius: 8px;
            box-shadow: 0 4px 6px rgba(0,0,0,0.1);
        }
        .close {
            position: absolute;
            right: 10px;
            top: 10px;
            font-size: 24px;
            cursor: pointer;
        }
    </style>
</head>
<body class="bg-gray-50">
    <div class="min-h-screen flex items-center justify-center">
        <div class="bg-white p-8 rounded-lg shadow-md w-full max-w-md text-center">
            <% if (success != null) { %>
                <h1 class="text-2xl font-bold mb-4 text-green-700">
                    <% if ("created".equals(success)) { %>
                        Message Submitted Successfully!
                    <% } else if ("updated".equals(success)) { %>
                        <script>
                            setTimeout(function() {
                                window.location.href = 'index.jsp';
                            }, 1500);
                        </script>
                        Message Updated Successfully! Redirecting...
                    <% } %>
                </h1>
            <% } else { %>
                <h1 class="text-2xl font-bold mb-4 text-blue-700">Contact Message</h1>
            <% } %>

            <% if (error != null) { %>
                <div class="mb-4 p-4 bg-red-100 border border-red-400 text-red-700 rounded">
                    <%= error %>
                </div>
            <% } %>

            <% if (message != null) { %>
                <div class="mb-6 text-left bg-gray-50 p-4 rounded-lg">
                    <h2 class="text-lg font-semibold mb-4">Your Message Details:</h2>
                    <div class="space-y-2">
                        <p><strong>Name:</strong> <%= message.get("name") %></p>
                        <p><strong>Email:</strong> <%= message.get("email") %></p>
                        <p><strong>Subject:</strong> <%= message.get("subject") %></p>
                        <p><strong>Message:</strong> <%= message.get("message") %></p>
                        <p><strong>Status:</strong> <%= message.get("status") %></p>
                        <p><strong>Submitted:</strong> <%= message.get("timestamp") %></p>
                    </div>
                </div>
            <% } %>

            <p class="mb-6">
                <% if (success != null) { %>
                    <% if ("created".equals(success)) { %>
                        Your message has been submitted. Thank you for contacting us.
                    <% } else if ("updated".equals(success)) { %>
                        Your message has been updated successfully.
                    <% } %>
                <% } else { %>
                    <% if (message != null) { %>
                        You can update your message using the button below.
                    <% } else { %>
                        View or update your message below.
                    <% } %>
                <% } %>
            </p>

            <div class="flex justify-center space-x-4">
                <a href="index.jsp" class="py-2 px-4 bg-blue-600 text-white rounded-md hover:bg-blue-700">Go Home</a>
                <% if (message != null) { %>
                    <button onclick="openUpdateModal()" class="py-2 px-4 bg-yellow-500 text-white rounded-md hover:bg-yellow-600">Update Message</button>
                <% } %>
            </div>

            <% if (message != null) { %>
                <!-- Update Modal -->
                <div id="updateModal" class="modal">
                    <div class="modal-content">
                        <span class="close" onclick="closeUpdateModal()">&times;</span>
                        <h2 class="text-xl font-bold mb-4">Update Your Message</h2>
                        <form id="updateForm" action="ContactMessageServlet" method="post" class="text-left">
                            <input type="hidden" name="action" value="update">
                            <input type="hidden" name="id" value="<%= message.get("id") %>">
                            
                            <div class="mb-4">
                                <label class="block text-gray-700 mb-2">Name</label>
                                <input type="text" name="name" value="<%= message.get("name") %>" 
                                       class="w-full px-3 py-2 border rounded focus:outline-none focus:ring-2 focus:ring-blue-500" 
                                       required>
                            </div>
                            
                            <div class="mb-4">
                                <label class="block text-gray-700 mb-2">Email</label>
                                <input type="email" name="email" value="<%= message.get("email") %>" 
                                       class="w-full px-3 py-2 border rounded focus:outline-none focus:ring-2 focus:ring-blue-500" 
                                       required>
                            </div>
                            
                            <div class="mb-4">
                                <label class="block text-gray-700 mb-2">Subject</label>
                                <input type="text" name="subject" value="<%= message.get("subject") %>" 
                                       class="w-full px-3 py-2 border rounded focus:outline-none focus:ring-2 focus:ring-blue-500" 
                                       required>
                            </div>
                            
                            <div class="mb-4">
                                <label class="block text-gray-700 mb-2">Message</label>
                                <textarea name="message" 
                                          class="w-full px-3 py-2 border rounded focus:outline-none focus:ring-2 focus:ring-blue-500" 
                                          rows="4" required><%= message.get("message") %></textarea>
                            </div>
                            
                            <div class="flex justify-end space-x-3">
                                <button type="button" onclick="closeUpdateModal()" 
                                        class="py-2 px-4 bg-gray-500 text-white rounded-md hover:bg-gray-600">
                                    Cancel
                                </button>
                                <button type="submit" 
                                        class="py-2 px-4 bg-green-600 text-white rounded-md hover:bg-green-700">
                                    Update Message
                                </button>
                            </div>
                        </form>
                    </div>
                </div>
            <% } %>
        </div>
    </div>

    <script>
        function openUpdateModal() {
            document.getElementById('updateModal').style.display = 'block';
        }

        function closeUpdateModal() {
            document.getElementById('updateModal').style.display = 'none';
        }

        // Close modal when clicking outside
        window.onclick = function(event) {
            var modal = document.getElementById('updateModal');
            if (event.target == modal) {
                modal.style.display = "none";
            }
        }
    </script>
</body>
</html> 
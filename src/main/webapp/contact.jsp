<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Contact Us - Cyber Trust Bank</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css">
    <script src="https://cdn.tailwindcss.com"></script>
    <style>
        body {
            background: #f4f8fb;
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background-image: url("images/bank1.jpg");
        }
    </style>
    <script>
    function validateContactForm() {
        const name = document.forms["contactForm"]["name"].value.trim();
        const email = document.forms["contactForm"]["email"].value.trim();
        const subject = document.forms["contactForm"]["subject"].value.trim();
        const message = document.forms["contactForm"]["message"].value.trim();

        const emailPattern = /^[^\\s@]+@[^\\s@]+\\.[^\\s@]+$/;

        if (name.length < 3) {
            alert("Name must be at least 3 characters long.");
            return false;
        }
        if (subject.length < 5) {
            alert("Subject must be at least 5 characters long.");
            return false;
        }

        if (message.length < 10) {
            alert("Message must be at least 10 characters long.");
            return false;
        }

        return true;
    }
    </script>
</head>

<body class="bg-gray-50">
    <div class="min-h-screen flex items-center justify-center">
        <div class="bg-white p-8 rounded-lg shadow-md w-full max-w-md">
            <h1 class="text-2xl font-bold mb-6 text-center text-blue-700">Contact Us</h1>

            <% if (request.getAttribute("error") != null) { %>
                <div class="mb-4 p-4 bg-red-100 border border-red-400 text-red-700 rounded">
                    <%= request.getAttribute("error") %>
                </div>
            <% } %>

            <form name="contactForm" action="ContactMessageServlet" method="post" class="space-y-4" onsubmit="return validateContactForm();">
                <input type="hidden" name="action" value="create">
                <div>
                    <label class="block text-sm font-medium text-gray-700">Name</label>
                    <input type="text" name="name" required class="mt-1 block w-full border-gray-300 rounded-md shadow-sm focus:ring-blue-500 focus:border-blue-500">
                </div>
                <div>
                    <label class="block text-sm font-medium text-gray-700">Email</label>
                    <input type="email" name="email" required class="mt-1 block w-full border-gray-300 rounded-md shadow-sm focus:ring-blue-500 focus:border-blue-500">
                </div>
                <div>
                    <label class="block text-sm font-medium text-gray-700">Subject</label>
                    <input type="text" name="subject" required class="mt-1 block w-full border-gray-300 rounded-md shadow-sm focus:ring-blue-500 focus:border-blue-500">
                </div>
                <div>
                    <label class="block text-sm font-medium text-gray-700">Message</label>
                    <textarea name="message" rows="4" required class="mt-1 block w-full border-gray-300 rounded-md shadow-sm focus:ring-blue-500 focus:border-blue-500"></textarea>
                </div>
                <button type="submit" class="w-full py-2 px-4 bg-blue-600 text-white rounded-md hover:bg-blue-700">Submit</button>
            </form>
        </div>
    </div>
</body>
</html>
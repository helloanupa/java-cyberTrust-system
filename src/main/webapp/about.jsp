<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>About Us - Cyber Trust Bank</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css">
    <script src="https://cdn.tailwindcss.com"></script>
</head>
<body class="bg-gray-50 min-h-screen flex flex-col">
    <header class="bg-white shadow-md py-4 px-8 flex justify-between items-center">
        <a href="index.jsp" class="text-2xl font-bold text-blue-700 flex items-center space-x-2">
            <i class="fas fa-university text-blue-700 text-3xl"></i>
            <span>Cyber Trust Bank</span>
        </a>
        <nav>
            <a href="index.jsp" class="text-gray-700 hover:text-blue-600 mx-3">Home</a>
            <a href="about.jsp" class="text-blue-700 font-bold mx-3">About Us</a>
            <a href="contact.jsp" class="text-gray-700 hover:text-blue-600 mx-3">Contact</a>
        </nav>
    </header>
    <main class="flex-1 container mx-auto px-6 py-12">
        <section class="mb-12 text-center">
            <h1 class="text-4xl font-bold text-blue-700 mb-4">About Cyber Trust Bank</h1>
            <p class="text-lg text-gray-700 max-w-2xl mx-auto">Cyber Trust Bank is dedicated to providing secure, innovative, and customer-focused banking solutions. Our mission is to empower individuals and businesses to achieve their financial goals with confidence and ease.</p>
        </section>
        <section class="mb-12">
            <h2 class="text-2xl font-semibold text-blue-600 mb-2">Our Mission</h2>
            <p class="text-gray-700 mb-6">To deliver world-class digital banking services that are secure, reliable, and accessible to everyone, everywhere.</p>
            <h2 class="text-2xl font-semibold text-blue-600 mb-2">Our Vision</h2>
            <p class="text-gray-700">To be the most trusted and innovative digital bank, leading the way in customer satisfaction and technological advancement.</p>
        </section>
        <section>
            <h2 class="text-2xl font-semibold text-blue-600 mb-6 text-center">Meet Our Team</h2>
            <div class="grid grid-cols-1 md:grid-cols-3 gap-8">
                <div class="bg-white rounded-lg shadow-md p-6 flex flex-col items-center">
                    <img src="images/team1.jpg" alt="CEO" class="w-24 h-24 rounded-full mb-4 object-cover">
                    <h3 class="text-lg font-bold text-blue-700">Randi Perera</h3>
                    <p class="text-gray-600">Chief Executive Officer</p>
                </div>
                <div class="bg-white rounded-lg shadow-md p-6 flex flex-col items-center">
                    <img src="images/team2.jpg" alt="CTO" class="w-24 h-24 rounded-full mb-4 object-cover">
                    <h3 class="text-lg font-bold text-blue-700">Nimal Silva</h3>
                    <p class="text-gray-600">Chief Technology Officer</p>
                </div>
                <div class="bg-white rounded-lg shadow-md p-6 flex flex-col items-center">
                    <img src="images/team3.jpg" alt="COO" class="w-24 h-24 rounded-full mb-4 object-cover">
                    <h3 class="text-lg font-bold text-blue-700">Samanthi Fernando</h3>
                    <p class="text-gray-600">Chief Operations Officer</p>
                </div>
            </div>
        </section>
    </main>
    <footer class="bg-black text-white py-6 text-center mt-12">
        <p>&copy; 2025 Cyber Trust Bank. All rights reserved.</p>
    </footer>
</body>
</html> 
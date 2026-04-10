<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="model.Customer" %>
<%
    Customer customer = (Customer) session.getAttribute("customer");
    boolean loggedIn = (customer != null);
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Cyber Trust</title>
    <script src="https://cdn.jsdelivr.net/npm/alpinejs@3.x.x/dist/cdn.min.js" defer></script>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css">
    <script src="https://cdn.tailwindcss.com"></script>
    <link rel="icon" type="image/x-icon" href="/images/favicon.ico">
    
    
</head>
<body class="bg-gray-50">

<!-- Header -->
<header class="fixed top-0 left-0 w-full bg-white shadow-md z-50">
    <div class="container mx-auto flex justify-between items-center py-4 px-6">
        <!-- Logo -->
        <a href="index.jsp" class="text-2xl font-bold text-blue-700 flex items-center space-x-2">
            <i class="fas fa-university text-blue-700 text-3xl"></i>
            <span>Cyber Trust Bank</span>
        </a>
        <!-- Navigation -->
        <nav class="hidden md:flex space-x-6">
            <a href="index.jsp" class="nav-link text-gray-700 hover:text-blue-600 font-bold">Home</a>
            <a href="transaction.jsp" class="nav-link text-gray-700 hover:text-blue-600 font-bold">Transaction</a>
            <a href="loan_application_form.jsp" class="nav-link text-gray-700 hover:text-blue-600 font-bold">Loan Application</a>
            <a href="support_ticket_form.jsp" class="nav-link text-gray-700 hover:text-blue-600 font-bold">Support Tickets</a>
            <a href="about.jsp" class="nav-link text-gray-700 hover:text-blue-600 font-bold">About Us</a>
            <a href="contact.jsp" class="nav-link text-gray-700 hover:text-blue-600 font-bold">Contact Us</a>
            <a href="faq.jsp" class="nav-link text-gray-700 hover:text-blue-600 font-bold">FAQ</a>
        </nav>
        <!-- Auth Buttons -->
        <div class="space-x-3">
            <% if (!loggedIn) { %>
                <a href="login.jsp" class="text-blue-700 border border-blue-700 px-4 py-2 rounded-full hover:bg-blue-100">Sign In</a>
                <a href="register.jsp" class="bg-blue-700 text-white px-4 py-2 rounded-full hover:bg-blue-800">Sign Up</a>
            <% } else { %>
                <a href="profile.jsp" class="bg-blue-700 text-white px-4 py-2 rounded-full hover:bg-blue-800">Profile</a>
                <a href="logout.jsp" class="text-blue-700 border border-blue-700 px-4 py-2 rounded-full hover:bg-blue-100">Logout</a>
            <% } %>
        </div>
    </div>
</header>

<!-- Hero Section -->
<section class="relative w-full h-[400px] lg:h-[500px] overflow-hidden mt-16">
    <div x-data="{
        activeSlide: 0,
        slides: [
            { image: 'images/aa.jpg' ,text: 'Secure Online Banking' },
            { image: 'images/bb.jpg', text: 'Fast & Reliable Transactions' },
            { image: 'images/cc.jpg', text: 'Manage Your Wealth Easily' }
        ]
    }" 
    x-init="setInterval(() => { activeSlide = (activeSlide + 1) % slides.length }, 3000)" 
    class="relative h-full">
        <!-- Image Slides -->
        <template x-for="(slide, index) in slides" :key="index">
            <div x-show="activeSlide === index"
                 x-transition:enter="transition-opacity duration-1000"
                 x-transition:leave="transition-opacity duration-1000"
                 class="absolute inset-0 bg-cover bg-center h-full w-full"
                 :style="'background-image: url(' + slide.image + '); background-size: cover; background-position: center center;'">
                <div class="absolute inset-0 bg-black bg-opacity-50"></div>
                <div class="absolute inset-0 flex items-center px-5 lg:px-10">
                    <div class="max-w-2xl text-white space-y-4">
                        <h2 class="text-3xl lg:text-5xl font-bold" x-text="slide.text"></h2>
                        <p class="text-lg lg:text-xl">Experience the future of online banking with secure and seamless financial services.</p>
                        <div class="flex space-x-4">
                            <a href="loan_application_form.jsp" class="bg-blue-600 px-6 py-3 text-lg rounded-lg hover:bg-blue-700 transition">Apply for Loan</a>
                            <a href="support_ticket_form.jsp" class="bg-white text-blue-700 px-6 py-3 text-lg rounded-lg hover:bg-blue-100 transition">Support Ticket</a>
                        </div>
                    </div>
                </div>
            </div>
        </template>
        <!-- Navigation Arrows -->
        <button @click="activeSlide = (activeSlide === 0) ? slides.length - 1 : activeSlide - 1"
                class="absolute top-1/2 left-4 transform -translate-y-1/2 text-white text-3xl bg-gray-800 bg-opacity-50 px-3 py-2 rounded-full hover:bg-opacity-80">
            ❮
        </button>
        <button @click="activeSlide = (activeSlide + 1) % slides.length"
                class="absolute top-1/2 right-4 transform -translate-y-1/2 text-white text-3xl bg-gray-800 bg-opacity-50 px-3 py-2 rounded-full hover:bg-opacity-80">
            ❯
        </button>
        <!-- Dots Indicator -->
        <div class="absolute bottom-5 left-1/2 transform -translate-x-1/2 flex space-x-3">
            <template x-for="(slide, index) in slides" :key="index">
                <button @click="activeSlide = index"
                        class="w-3 h-3 rounded-full"
                        :class="activeSlide === index ? 'bg-white' : 'bg-gray-400'"></button>
            </template>
        </div>
    </div>
</section>

<!-- Services Section -->
<section class="py-16 bg-white text-center">
    <h2 class="text-3xl font-bold text-blue-700">Our Banking Services</h2>
    <div class="mt-8 grid grid-cols-1 md:grid-cols-3 gap-6 px-6">
        <div class="bg-gray-100 p-6 shadow-md rounded-lg">
            <i class="fas fa-credit-card text-4xl text-blue-600"></i>
            <h3 class="text-xl font-semibold mt-4">Credit & Debit Cards</h3>
            <p>Enjoy global transactions with exclusive rewards and cashback offers.</p>
        </div>
        <div class="bg-gray-100 p-6 shadow-md rounded-lg">
            <i class="fas fa-piggy-bank text-4xl text-blue-600"></i>
            <h3 class="text-xl font-semibold mt-4">Savings & Checking</h3>
            <p>Open a high-interest savings account with zero maintenance fees.</p>
        </div>
        <div class="bg-gray-100 p-6 shadow-md rounded-lg">
            <i class="fas fa-hand-holding-usd text-4xl text-blue-600"></i>
            <h3 class="text-xl font-semibold mt-4">Personal Loans</h3>
            <p>Get quick approvals on personal loans with flexible repayment options.</p>
            <a href="loan_application_form.jsp" class="block mt-4 text-blue-700 hover:underline">Apply Now</a>
        </div>
        <div class="bg-gray-100 p-6 shadow-md rounded-lg">
            <i class="fas fa-ticket-alt text-4xl text-blue-600"></i>
            <h3 class="text-xl font-semibold mt-4">Support Tickets</h3>
            <p>Submit and track your support requests easily.</p>
            <a href="support_ticket_form.jsp" class="block mt-4 text-blue-700 hover:underline">Submit Ticket</a>
        </div>
        <div class="bg-gray-100 p-6 shadow-md rounded-lg col-span-1 md:col-span-3 flex flex-col items-center justify-center">
            <i class="fas fa-exchange-alt text-4xl text-blue-600"></i>
            <h3 class="text-xl font-semibold mt-4">Money Transfer</h3>
            <p>Send money securely and instantly to any account.</p>
            <a href="transaction.jsp" class="mt-4 px-6 py-3 bg-blue-600 text-white rounded-lg hover:bg-blue-700 transition">Make a Transaction</a>
        </div>
    </div>
</section>

<!-- Why Choose Us Section -->
<section class="py-16 bg-gray-100 text-center">
    <h2 class="text-3xl font-bold text-blue-700">Why Choose Cyber Trust Bank?</h2>
    <div class="mt-8 grid grid-cols-1 md:grid-cols-3 gap-6 px-6">
        <!-- Feature Box 1 -->
        <div x-data="{ show: false }" 
             class="relative bg-white p-6 shadow-lg rounded-lg text-center cursor-pointer transition transform hover:scale-105"
             @mouseenter="show = true" @mouseleave="show = false">
            <i class="fas fa-shield-alt text-5xl text-blue-600"></i>
            <h3 class="text-xl font-semibold mt-4">Advanced Security</h3>
            <div x-show="show"
                 x-transition:enter="transition transform duration-500 ease-out"
                 x-transition:enter-start="opacity-0 translate-y-4 scale-90"
                 x-transition:enter-end="opacity-100 translate-y-0 scale-100"
                 x-transition:leave="transition transform duration-300 ease-in"
                 x-transition:leave-start="opacity-100 translate-y-0 scale-100"
                 x-transition:leave-end="opacity-0 translate-y-4 scale-90"
                 class="absolute left-1/2 transform -translate-x-1/2 bottom-[-80px] w-64 p-4 bg-blue-600 text-white rounded-lg shadow-lg">
                <p>We use AI-based encryption to keep your data secure.</p>
            </div>
        </div>
        <!-- Feature Box 2 -->
        <div x-data="{ show: false }" 
             class="relative bg-white p-6 shadow-lg rounded-lg text-center cursor-pointer transition transform hover:scale-105"
             @mouseenter="show = true" @mouseleave="show = false">
            <i class="fas fa-money-bill-wave text-5xl text-blue-600"></i>
            <h3 class="text-xl font-semibold mt-4">Zero Fees</h3>
            <div x-show="show"
                 x-transition:enter="transition transform duration-500 ease-out"
                 x-transition:enter-start="opacity-0 translate-y-4 scale-90"
                 x-transition:enter-end="opacity-100 translate-y-0 scale-100"
                 x-transition:leave="transition transform duration-300 ease-in"
                 x-transition:leave-start="opacity-100 translate-y-0 scale-100"
                 x-transition:leave-end="opacity-0 translate-y-4 scale-90"
                 class="absolute left-1/2 transform -translate-x-1/2 bottom-[-80px] w-64 p-4 bg-blue-600 text-white rounded-lg shadow-lg">
                <p>Enjoy instant transactions with no hidden fees.</p>
            </div>
        </div>
        <!-- Feature Box 3 -->
        <div x-data="{ show: false }" 
             class="relative bg-white p-6 shadow-lg rounded-lg text-center cursor-pointer transition transform hover:scale-105"
             @mouseenter="show = true" @mouseleave="show = false">
            <i class="fas fa-headset text-5xl text-blue-600"></i>
            <h3 class="text-xl font-semibold mt-4">24/7 Support</h3>
            <div x-show="show"
                 x-transition:enter="transition transform duration-500 ease-out"
                 x-transition:enter-start="opacity-0 translate-y-4 scale-90"
                 x-transition:enter-end="opacity-100 translate-y-0 scale-100"
                 x-transition:leave="transition transform duration-300 ease-in"
                 x-transition:leave-start="opacity-100 translate-y-0 scale-100"
                 x-transition:leave-end="opacity-0 translate-y-4 scale-90"
                 class="absolute left-1/2 transform -translate-x-1/2 bottom-[-80px] w-64 p-4 bg-blue-600 text-white rounded-lg shadow-lg">
                <p>We're available anytime to help with your banking needs. <a href='SupportTicketServlet' class='underline'>Open a Ticket</a></p>
            </div>
        </div>
    </div>
</section>

<!-- Footer -->
<footer class="bg-black text-white py-10">
    <div class="container mx-auto px-5 lg:px-10 grid grid-cols-1 md:grid-cols-3 lg:grid-cols-4 gap-8">
        <!-- Logo & Description -->
        <div>
            <h2 class="text-2xl font-bold flex items-center space-x-2">
                <i class="fas fa-university text-gray-400"></i>
                <span>Cyber Trust Bank</span>
            </h2>
            <p class="mt-3 text-gray-400">The future of secure and reliable banking. Join us today and take control of your finances.</p>
        </div>
        <!-- Quick Links -->
        <div>
            <h3 class="text-lg font-semibold mb-3 text-gray-300">Quick Links</h3>
            <ul class="space-y-2 text-gray-400">
                <li><a href="index.jsp" class="hover:text-white"><i class="fas fa-home mr-2"></i> Home</a></li>
                <li><a href="about.jsp" class="hover:text-white"><i class="fas fa-info-circle mr-2"></i> About</a></li>
                <li><a href="services.jsp" class="hover:text-white"><i class="fas fa-cogs mr-2"></i> Services</a></li>
                <li><a href="contact.jsp" class="hover:text-white"><i class="fas fa-envelope mr-2"></i> Contact</a></li>
                <li><a href="loan_application_form.jsp" class="hover:text-white"><i class="fas fa-file-alt mr-2"></i> Loan Application</a></li>
                <li><a href="SupportTicketServlet" class="hover:text-white"><i class="fas fa-ticket-alt mr-2"></i> Support Tickets</a></li>
            </ul>
        </div>
        <!-- Support -->
        <div>
            <h3 class="text-lg font-semibold mb-3 text-gray-300">Support</h3>
            <ul class="space-y-2 text-gray-400">
                <li><a href="faq.jsp" class="hover:text-white"><i class="fas fa-question-circle mr-2"></i> FAQs</a></li>
                <li><a href="privacy.jsp" class="hover:text-white"><i class="fas fa-user-shield mr-2"></i> Privacy Policy</a></li>
                <li><a href="terms.jsp" class="hover:text-white"><i class="fas fa-file-contract mr-2"></i> Terms & Conditions</a></li>
                <li><a href="SupportTicketServlet" class="hover:text-white"><i class="fas fa-hands-helping mr-2"></i> Help Center</a></li>
            </ul>
        </div>
        <!-- Contact & Social Media -->
        <div>
            <h3 class="text-lg font-semibold mb-3 text-gray-300">Get in Touch</h3>
            <p class="text-gray-400"><i class="fas fa-map-marker-alt mr-2"></i> 123 Bank Street, Colombo, Sri Lanka</p>
            <p class="text-gray-400"><i class="fas fa-envelope mr-2"></i> support@cyberTrustbank.com</p>
            <p class="text-gray-400"><i class="fas fa-phone mr-2"></i> +94 123 456 789</p>
            <div class="flex space-x-4 mt-4">
                <a href="#" class="text-gray-400 hover:text-white text-2xl"><i class="fab fa-facebook"></i></a>
                <a href="#" class="text-gray-400 hover:text-white text-2xl"><i class="fab fa-twitter"></i></a>
                <a href="#" class="text-gray-400 hover:text-white text-2xl"><i class="fab fa-instagram"></i></a>
                <a href="#" class="text-gray-400 hover:text-white text-2xl"><i class="fab fa-linkedin"></i></a>
                <a href="#" class="text-gray-400 hover:text-white text-2xl"><i class="fab fa-youtube"></i></a>
            </div>
        </div>
    </div>
    <div class="mt-8 border-t border-gray-600 text-center pt-4 text-gray-400">
        <p>© 2025 Cyber Trust Bank. All Rights Reserved.</p>
    </div>
</footer>

<!-- Add a call-to-action section -->
<div class="cta-section" style="text-align:center;margin:40px 0;">
    <a href="https://tracxn.com/d/companies/cyber-trust-bank/__9bSQx0nI4jlaNzfi2lQl7T_9FMSCUvmYSDYQhZVc1hA" style="background:#1a73e8;color:#fff;padding:14px 32px;border-radius:6px;font-size:18px;font-weight:bold;text-decoration:none;">Learn More</a>
</div>

</body>
</html> 
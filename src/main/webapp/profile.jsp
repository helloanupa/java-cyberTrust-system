<%@ page language="java" import="model.Customer,model.LoanApplication,model.SupportTicket,java.util.List" %>
<%
    Customer c = (Customer) session.getAttribute("customer");
    if (c == null) {
        response.sendRedirect("login.jsp");
        return;
    }
    List<LoanApplication> myLoans = (List<LoanApplication>) request.getAttribute("myLoans");
    
    List<SupportTicket> myTickets = (List<SupportTicket>) request.getAttribute("myTickets");

    boolean hasApprovedLoan = false;
    if (myLoans != null) {
        for (LoanApplication loan : myLoans) {
            if ("Approved".equals(loan.getStatus())) {
                hasApprovedLoan = true;
                break;
            }
        }
    }

    boolean hasRejectedLoan = false;
    if (myLoans != null) {
        for (LoanApplication loan : myLoans) {
            if ("Rejected".equals(loan.getStatus())) {
                hasRejectedLoan = true;
                break;
            }
        }
    }
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Profile - Cyber Trust Bank</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css">
    <script src="https://cdn.tailwindcss.com"></script>
</head>
<body class="bg-gradient-to-br from-blue-50 to-gray-100 min-h-screen flex items-center justify-center">
    <div class="bg-white rounded-2xl shadow-2xl p-10 max-w-lg w-full text-center">
        <% if (hasApprovedLoan) { %>
            <div class="bg-green-600 text-white py-3 px-4 rounded-lg mb-4 font-semibold shadow">Congratulations! Your loan application has been approved.</div>
        <% } %>
        <% if (hasRejectedLoan) { %>
            <div class="bg-red-600 text-white py-3 px-4 rounded-lg mb-4 font-semibold shadow">Sorry, your loan application was rejected.</div>
        <% } %>
        <% if (request.getAttribute("success") != null) { %>
            <div class="bg-green-500 text-white py-3 px-4 rounded-lg mb-4 font-semibold shadow"><%= request.getAttribute("success") %></div>
        <% } %>
        <% if (request.getAttribute("error") != null) { %>
            <div class="bg-red-500 text-white py-3 px-4 rounded-lg mb-4 font-semibold shadow"><%= request.getAttribute("error") %></div>
        <% } %>
        <h2 class="text-2xl font-bold text-blue-700 mb-2">Welcome, <%= c.getUsername() %>!</h2>
        <div class="mb-6 text-left space-y-2">
            <div><span class="font-semibold text-gray-700">Email:</span> <span class="text-gray-800"><%= c.getEmail() %></span></div>
            <div><span class="font-semibold text-gray-700">Phone:</span> <span class="text-gray-800"><%= c.getPhone() %></span></div>
            <div><span class="font-semibold text-gray-700">NIC:</span> <span class="text-gray-800"><%= c.getNic() %></span></div>
            <div><span class="font-semibold text-gray-700">Country:</span> <span class="text-gray-800"><%= c.getCountry() %></span></div>
        </div>
        <div class="flex flex-col sm:flex-row justify-center gap-4 mb-8">
            <a href="edit_profile.jsp" class="px-6 py-2 bg-yellow-500 text-white rounded-md shadow hover:bg-yellow-600 transition font-semibold flex items-center justify-center gap-2">
                <i class="fas fa-user-edit"></i> Edit Profile
            </a>
            <a href="change_password.jsp" class="px-6 py-2 bg-blue-600 text-white rounded-md shadow hover:bg-blue-700 transition font-semibold flex items-center justify-center gap-2">
                <i class="fas fa-key"></i> Change Password
            </a>
            <form action="ProfileServlet" method="post" onsubmit="return confirm('Are you sure you want to delete your profile? This action cannot be undone.');">
                <input type="hidden" name="action" value="delete_profile">
                <button type="submit" class="px-6 py-2 bg-red-600 text-white rounded-md shadow hover:bg-red-700 transition font-semibold flex items-center justify-center gap-2">
                    <i class="fas fa-trash"></i> Delete Profile
                </button>
            </form>
        </div>
        <h3 class="text-xl font-bold mt-8 mb-2 text-blue-700">My Support Tickets</h3>
        <a href="SupportTicketServlet" class="bg-blue-700 text-white px-4 py-2 rounded-full hover:bg-blue-800 mb-4 inline-block transition">View All My Support Tickets</a>
        <div class="overflow-x-auto">
            <table class="w-full text-left border-collapse mt-2 mb-8">
                <thead>
                    <tr class="bg-blue-100">
                        <th class="px-3 py-2">ID</th>
                        <th class="px-3 py-2">Subject</th>
                        <th class="px-3 py-2">Status</th>
                        <th class="px-3 py-2">Action</th>
                    </tr>
                </thead>
                <tbody>
                <% if (myTickets != null && !myTickets.isEmpty()) {
                    for (SupportTicket t : myTickets) { %>
                    <tr class="border-b">
                        <td class="px-3 py-2"><%= t.getId() %></td>
                        <td class="px-3 py-2"><%= t.getSubject() %></td>
                        <td class="px-3 py-2"><%= t.getStatus() %></td>
                        <td class="px-3 py-2">
                            <form action="ProfileServlet" method="post" class="inline">
                                <input type="hidden" name="action" value="update_ticket">
                                <input type="hidden" name="id" value="<%= t.getId() %>">
                                <input type="hidden" name="status" value="<%= "Open".equals(t.getStatus()) ? "Closed" : "Open" %>">
                                <button type="submit" class="text-blue-700 hover:underline font-semibold">
                                    <%= "Open".equals(t.getStatus()) ? "Close" : "Reopen" %>
                                </button>
                            </form>
                            <form action="ProfileServlet" method="post" class="inline">
                                <input type="hidden" name="action" value="delete_ticket">
                                <input type="hidden" name="id" value="<%= t.getId() %>">
                                <button type="submit" class="text-red-700 hover:underline ml-2 font-semibold">Delete</button>
                            </form>
                        </td>
                    </tr>
                <%  }
                } else { %>
                    <tr><td colspan="4" class="text-center py-4 text-gray-500">No support tickets found.</td></tr>
                <% } %>
                </tbody>
            </table>
        </div>
        <a href="login.jsp" class="mt-6 inline-block px-6 py-2 bg-gray-700 text-white rounded-md shadow hover:bg-gray-900 transition font-semibold">
            <i class="fas fa-sign-out-alt"></i> Logout
        </a>
    </div>
</body>
</html> 
<%@ page import="org.havriutkin.memorycard2.model.User" %>
<% User user = (User) session.getAttribute("user"); %>

<div class="app-header">
    <div class="header-left">
        <% if (user != null) { %>
        Welcome, <strong><%= user.getName() %></strong>!
        <% } %>
    </div>
    <div class="header-right">
        <% if (user != null) { %>
        <a href="<%= request.getContextPath() %>/dashboard">Dashboard</a>
        <a href="<%= request.getContextPath() %>/logout">Logout</a>
        <% } else { %>
        <a href="<%= request.getContextPath() %>/login">Login</a>
        <a href="<%= request.getContextPath() %>/register">Register</a>
        <% } %>
    </div>
</div>

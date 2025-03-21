<%@ page import="org.havriutkin.memorycard2.model.User" %>
<% User user = (User) session.getAttribute("user"); %>

<div style="background:#f0f0f0; padding:10px;">
    <% if (user != null) { %>
        Welcome, <strong><%= user.getName() %></strong>!
        <a href="<%= request.getContextPath() %>/dashboard">Dashboard</a> |
        <a href="<%= request.getContextPath() %>/logout">Logout</a>
    <% } else { %>
        <a href="<%= request.getContextPath() %>/login">Login</a> |
        <a href="<%= request.getContextPath() %>/register">Register</a>
    <% } %>
</div>

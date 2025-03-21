<%--
  Created by IntelliJ IDEA.
  User: havri
  Date: 3/21/2025
  Time: 4:01 PM
--%>
<%@ page contentType="text/html;charset=UTF-8" %>
<html>
    <head>
        <title>Login</title>
    </head>
    <body>
        <h2>Login</h2>
        <form method="post" action="login">
            <label>Email: <input type="text" name="email" /></label><br/>
            <label>Password: <input type="password" name="password" /></label><br/>
            <input type="submit" value="Login"/>
        </form>
        <p>Don't have an account? <a href="register">Register here</a></p>
        <p style="color:red;"><%= request.getAttribute("error") != null ? request.getAttribute("error") : "" %></p>
    </body>
</html>


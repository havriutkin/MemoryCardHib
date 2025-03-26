<%@ page contentType="text/html;charset=UTF-8" %>
<html>
    <head>
        <title>Login</title>
        <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/styles.css">
    </head>
    <body>
        <div class="centered-page">
        <div class="container">
            <h2>Login</h2>
            <form method="post" action="${pageContext.request.contextPath}/login">
                <label>Email:
                    <input type="text" name="email" />
                </label>
                <label>Password:
                    <input type="password" name="password" />
                </label>
                <input type="submit" value="Login"/>
            </form>
            <p>Don't have an account? <a href="${pageContext.request.contextPath}/register">Register here</a></p>
            <p class="error"><%= request.getAttribute("error") != null ? request.getAttribute("error") : "" %></p>
        </div>
        </div>
    </body>
</html>

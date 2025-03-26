<%@ page contentType="text/html;charset=UTF-8" %>
<html>
    <head>
        <title>Register</title>
        <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/styles.css">
    </head>

    <body>
        <div class="centered-page">
        <div class="container">
            <h2>Create Account</h2>

            <form method="post" action="register">
                <label>Name: <input type="text" name="name" /></label><br/>
                <label>Email: <input type="text" name="email" /></label><br/>
                <label>Password: <input type="password" name="password" /></label><br/><br/>
                <input type="submit" value="Register" />
            </form>
            <p>Already have an account? <a href="${pageContext.request.contextPath}/login">Login here</a></p>
            <p class="error">
                <%= request.getAttribute("error") != null ? request.getAttribute("error") : "" %>
            </p>
        </div>
        </div>
    </body>
</html>

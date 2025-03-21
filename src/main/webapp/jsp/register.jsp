<%@ include file="partials/header.jsp" %>

<html>
    <head>
        <title>Register</title>
    </head

    <body>
    <h2>Create Account</h2>

    <form method="post" action="register">
        <label>Name: <input type="text" name="name" /></label><br/>
        <label>Email: <input type="email" name="email" /></label><br/>
        <label>Password: <input type="password" name="password" /></label><br/><br/>
        <input type="submit" value="Register" />
    </form>

    <p style="color:red;">
        <%= request.getAttribute("error") != null ? request.getAttribute("error") : "" %>
    </p>
    </body>
</html>

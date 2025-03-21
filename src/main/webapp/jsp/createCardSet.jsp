<%@ include file="partials/header.jsp" %>

<html>
<head>
    <title>Create Card Set</title>
</head>
<body>
<h2>Create New Card Set</h2>

<form method="post" action="createCardSet">
    <label>Set Name: <input type="text" name="name" /></label><br/><br/>
    <input type="submit" value="Create" />
</form>

<p style="color:red;"><%= request.getAttribute("error") != null ? request.getAttribute("error") : "" %></p>
</body>
</html>

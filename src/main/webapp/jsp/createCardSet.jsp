<%@ include file="partials/header.jsp" %>

<html>
    <head>
        <title>Create Card Set</title>
        <link rel="stylesheet" href="${pageContext.request.contextPath}/css/styles.css" />
    </head>
    <body>
        <div class="centered-page">
            <div class="container">
                <h2>Create New Card Set</h2>

                <form method="post" action="createCardSet">
                    <label>Set Name:
                        <input type="text" name="name" />
                    </label>
                    <input type="submit" value="Create" />
                </form>

                <p class="error">
                    <%= request.getAttribute("error") != null ? request.getAttribute("error") : "" %>
                </p>
            </div>
        </div>
    </body>
</html>

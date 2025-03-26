<%@ page import="org.havriutkin.memorycard2.model.CardSet" %>
<%@ include file="partials/header.jsp" %>

<%
    CardSet cardSet = (CardSet) request.getAttribute("cardSet");
%>

<html>
    <head>
        <title>Edit Card Set</title>
        <link rel="stylesheet" href="${pageContext.request.contextPath}/css/styles.css" />
    </head>

    <body>
        <div class="centered-page">
            <div class="container">
                <h2>Edit Card Set</h2>

                <form method="post" action="editCardSet">
                    <input type="hidden" name="id" value="<%= cardSet.getId() %>" />
                    <label>Set Name:
                        <input type="text" name="name" value="<%= cardSet.getName() %>" />
                    </label>
                    <input type="submit" value="Update" />
                </form>

                <p class="error">
                    <%= request.getAttribute("error") != null ? request.getAttribute("error") : "" %>
                </p>
            </div>
        </div>
    </body>
</html>

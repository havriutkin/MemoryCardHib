<%@ page import="org.havriutkin.memorycard2.model.CardSet" %>
<%@ include file="partials/header.jsp" %>

<%
    CardSet cardSet = (CardSet) request.getAttribute("cardSet");
%>

<html>
    <head>
        <title>Edit Card Set</title>
    </head>

    <body>
        <h2>Edit Card Set</h2>

        <form method="post" action="editCardSet">
            <input type="hidden" name="id" value="<%= cardSet.getId() %>" />
            <label>Set Name:
                <input type="text" name="name" value="<%= cardSet.getName() %>" />
            </label><br/><br/>
            <input type="submit" value="Update" />
        </form>

        <p style="color:red;">
            <%= request.getAttribute("error") != null ? request.getAttribute("error") : "" %>
        </p>
    </body>
</html>

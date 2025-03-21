<%@ page import="org.havriutkin.memorycard2.model.CardSet" %>
<%@ page import="java.util.List" %>
<%@ include file="partials/header.jsp" %>

<html>
    <head>
        <title>Dashboard</title>
    </head>

    <body>
        <h2>Your Card Sets</h2>

        <a href="createCardSet">+ New Card Set</a><br/><br/>

        <%
            List<CardSet> cardSets = (List<CardSet>) request.getAttribute("cardSets");
            if (cardSets != null && !cardSets.isEmpty()) {
                for (CardSet cs : cardSets) {
        %>
            <div>
                <strong>
                    <a href="viewCardSet?id=<%= cs.getId() %>">
                        <%= cs.getName() %>
                    </a>
                </strong>
                (<%= cs.getCreatedAt() %>)
                - <a href="editCardSet?id=<%= cs.getId() %>">Edit</a>
                - <a href="deleteCardSet?id=<%= cs.getId() %>">Delete</a>
                - <a href="train?id=<%= cs.getId() %>">Train</a>
                - <a href="createCard?cardSetId=<%= cs.getId() %>">+ Add Card</a>
            </div>
        <%
            }
        } else {
        %>
            <p>No card sets yet.</p>
        <%
            }
        %>
    </body>
</html>

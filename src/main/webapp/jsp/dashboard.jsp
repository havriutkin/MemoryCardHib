<%@ page import="org.havriutkin.memorycard2.model.CardSet" %>
<%@ page import="java.util.List" %>
<%@ include file="partials/header.jsp" %>

<html>
    <head>
        <title>Dashboard</title>
        <link rel="stylesheet" href="${pageContext.request.contextPath}/css/styles.css" />
    </head>
    <body>
        <main class="dashboard-container">
            <div class="dashboard-header">
                <h2>Your Card Sets</h2>
                <a href="createCardSet" class="new-card-set-btn">+ New Card Set</a>
            </div>

            <div class="card-grid">
                <%
                    List<CardSet> cardSets = (List<CardSet>) request.getAttribute("cardSets");
                    if (cardSets != null && !cardSets.isEmpty()) {
                        for (CardSet cs : cardSets) {
                %>
                <div class="card-set">
                    <strong>
                        <a href="viewCardSet?id=<%= cs.getId() %>">
                            <%= cs.getName() %>
                        </a>
                    </strong>
                    <div class="card-meta">Created: <%= cs.getCreatedAt() %></div>
                    <div class="card-actions">
                        <a href="editCardSet?id=<%= cs.getId() %>">Edit</a>
                        <a href="deleteCardSet?id=<%= cs.getId() %>">Delete</a>
                        <a href="train?id=<%= cs.getId() %>">Train</a>
                        <a href="createCard?cardSetId=<%= cs.getId() %>">+ Add Card</a>
                    </div>
                </div>
                <%
                    }
                } else {
                %>
                <p>No card sets yet.</p>
                <%
                    }
                %>
            </div>
        </main>
    </body>
</html>

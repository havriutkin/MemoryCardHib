<%@ page import="org.havriutkin.memorycard2.model.*" %>
<%@ page import="java.util.List" %>
<%@ include file="partials/header.jsp" %>

<%
    CardSet cardSet = (CardSet) request.getAttribute("cardSet");
    List<Card> cards = cardSet.getCards();
%>

<html>
    <head>
        <title><%= cardSet.getName() %></title>
        <link rel="stylesheet" href="${pageContext.request.contextPath}/css/styles.css" />
    </head>

    <body>
        <div class="view-container">
            <div class="view-header">
                <h2><%= cardSet.getName() %></h2>
                <a href="createCard?cardSetId=<%= cardSet.getId() %>" class="new-card-set-btn">+ Add New Card</a>
            </div>

            <div class="card-list">
                <%
                    if (cards != null && !cards.isEmpty()) {
                        for (Card card : cards) {
                %>
                <div class="card-item">
                    <div><strong>Title:</strong> <%= card.getTitle() %></div>
                    <div><strong>Answer:</strong> <%= card.getAnswer() %></div>

                    <%
                        if (card instanceof TextCard) {
                    %>
                    <div><strong>Question:</strong> <%= ((TextCard) card).getQuestion() %></div>
                    <%
                    } else if (card instanceof ImageCard) {
                    %>
                    <div class="card-image">
                        <img src="<%= ((ImageCard) card).getImageUrl() %>" alt="Image question" />
                    </div>
                    <%
                    } else if (card instanceof AudioCard) {
                    %>
                    <div>
                        <audio controls src="<%= ((AudioCard) card).getAudioUrl() %>"></audio>
                    </div>
                    <%
                        }
                    %>

                    <div class="card-actions">
                        <a href="editCard?id=<%= card.getId() %>">Edit</a>
                        <a href="deleteCard?id=<%= card.getId() %>">Delete</a>
                    </div>
                </div>
                <%
                    }
                } else {
                %>
                <p>No cards in this set yet.</p>
                <%
                    }
                %>
            </div>
        </div>
    </body>
</html>

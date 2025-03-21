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
    </head>

    <body>
        <h2>Card Set: <%= cardSet.getName() %></h2>

        <a href="createCard?cardSetId=<%= cardSet.getId() %>">+ Add New Card</a><br/><br/>

        <%
            if (cards != null && !cards.isEmpty()) {
                for (Card card : cards) {
        %>
            <div style="margin-bottom: 1em; padding: 0.5em; border: 1px solid #ccc;">
                <strong>Title:</strong> <%= card.getTitle() %><br/>
                <strong>Answer:</strong> <%= card.getAnswer() %><br/>
    
                <%
                    if (card instanceof TextCard) {
                %>      <strong>Question:</strong> <%= ((TextCard) card).getQuestion() %><br/>
                <%
                } else if (card instanceof ImageCard) {
                %>      <img src="<%= ((ImageCard) card).getImageUrl() %>" width="200" alt="Image question"/><br/>
                <%
                } else if (card instanceof AudioCard) {
                %>      <audio controls src="<%= ((AudioCard) card).getAudioUrl() %>"></audio><br/>
                <%
                    }
                %>
                <a href="editCard?id=<%= card.getId() %>">Edit</a> |
                <a href="deleteCard?id=<%= card.getId() %>">Delete</a>
            </div>
        <%
            }
        } else {
        %>
            <p>No cards in this set yet.</p>
        <%
            }
        %>
    </body>
</html>

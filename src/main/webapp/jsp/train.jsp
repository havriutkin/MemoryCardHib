<%@ page import="org.havriutkin.memorycard2.model.*" %>
<%@ include file="partials/header.jsp" %>

<%
    Card card = (Card) request.getAttribute("card");
    Boolean done = (Boolean) request.getAttribute("done");
    String error = (String) request.getAttribute("error");
%>

<html>
    <head>
        <title>Training</title>
        <link rel="stylesheet" href="${pageContext.request.contextPath}/css/styles.css" />
    </head>

    <body>
        <div class="centered-page">
            <div class="container" style="max-width: 500px;">
                <h2>Training Mode</h2>

                <% if (error != null) { %>
                <p class="error"><%= error %></p>
                <% } else if (done != null && done) { %>
                <p>You're done training!</p>
                <a href="dashboard">Back to dashboard</a>
                <% } else if (card != null) { %>
                <div class="flip-card" onclick="this.classList.toggle('flipped')">
                    <div class="flip-card-inner">
                        <div class="flip-card-front">
                            <strong><%= card.getTitle() %></strong><br/>

                            <% if (card instanceof TextCard) { %>
                            <em><%= ((TextCard) card).getQuestion() %></em>
                            <% } else if (card instanceof ImageCard) { %>
                            <img src="<%= ((ImageCard) card).getImageUrl() %>" alt="Image question" style="max-width:100%; border-radius: 8px;" />
                            <% } else if (card instanceof AudioCard) { %>
                            <audio controls src="<%= ((AudioCard) card).getAudioUrl() %>"></audio>
                            <% } %>
                        </div>

                        <div class="flip-card-back">
                            <strong>Answer:</strong>
                            <p><%= card.getAnswer() %></p>
                        </div>
                    </div>
                </div>

                <form method="post" action="train" style="margin-top: 20px;">
                    <input type="submit" value="Next Card"/>
                </form>
                <a href="dashboard">Back to dashboard</a>
                <% } %>
            </div>
        </div>
    </body>
</html>

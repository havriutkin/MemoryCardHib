<%@ page import="org.havriutkin.memorycard2.model.*" %>
<%@ include file="partials/header.jsp" %>

<%
    Card card = (Card) request.getAttribute("card");
%>

<html>
    <head>
        <title>Edit Card</title>
    </head>

    <body>
    <h2>Edit Card</h2>

    <form method="post" action="editCard">
        <input type="hidden" name="id" value="<%= card.getId() %>" />

        <label>Title: <input type="text" name="title" value="<%= card.getTitle() %>" /></label><br/>
        <label>Answer: <input type="text" name="answer" value="<%= card.getAnswer() %>" /></label><br/>

        <%
            if (card instanceof TextCard) {
        %>
            <label>Question: <input type="text" name="question" value="<%= ((TextCard) card).getQuestion() %>" /></label><br/>
        <%
        } else if (card instanceof ImageCard) {
        %>
            <label>Image URL: <input type="text" name="imageUrl" value="<%= ((ImageCard) card).getImageUrl() %>" /></label><br/>
        <%
        } else if (card instanceof AudioCard) {
        %>
            <label>Audio URL: <input type="text" name="audioUrl" value="<%= ((AudioCard) card).getAudioUrl() %>" /></label><br/>
        <%
            }
        %>

        <br/>

        <input type="submit" value="Update Card" />
    </form>

    </body>
</html>

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
    </head>
    
    <body>
        <h2>Training Mode</h2>

        <% if (error != null) { %>
            <p style="color:red;"><%= error %></p>
        <% } else if (done != null && done) { %>
            <p>You're done training!</p>
            <a href="dashboard">Back to dashboard</a>
        <% } else if (card != null) { %>
            <div style="padding:1em; border:1px solid #ccc; margin-bottom:1em;">
                <strong><%= card.getTitle() %></strong><br/>

                <%
                    if (card instanceof TextCard) {
                %>  <em><%= ((TextCard) card).getQuestion() %></em><br/>
                <%
                } else if (card instanceof ImageCard) {
                %>  <img src="<%= ((ImageCard) card).getImageUrl() %>" width="250" alt="Image question"/><br/>
                <%
                } else if (card instanceof AudioCard) {
                %>  <audio controls src="<%= ((AudioCard) card).getAudioUrl() %>"></audio><br/>
                <%
                    }
                %>
                <br/>
                <details>
                    <summary>Show Answer</summary>
                    <p><%= card.getAnswer() %></p>
                </details>
            </div>

            <form method="post" action="train">
                <input type="submit" value="Next Card"/>
            </form>

            <a href="dashboard">Back to dashboard</a>
        <% } %>
    </body>
</html>

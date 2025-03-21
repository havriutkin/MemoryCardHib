<%@ page import="org.havriutkin.memorycard2.model.CardSet" %>
<%@ include file="partials/header.jsp" %>

<%
    CardSet cardSet = (CardSet) request.getAttribute("cardSet");
%>

<html>
    <head>
        <title>Create Card</title>
        <script>
            function updateForm() {
                const type = document.getElementById("type").value;
                document.getElementById("textFields").style.display = type === "TEXT" ? "block" : "none";
                document.getElementById("imageFields").style.display = type === "IMAGE" ? "block" : "none";
                document.getElementById("audioFields").style.display = type === "AUDIO" ? "block" : "none";
            }
        </script>
    </head>

    <body>
    <h2>Create New Card for Set: <%= cardSet.getName() %></h2>

    <form method="post" action="createCard">
        <input type="hidden" name="cardSetId" value="<%= cardSet.getId() %>"/>

        <label>Type:
            <select name="type" id="type" onchange="updateForm()">
                <option value="TEXT">Text</option>
                <option value="IMAGE">Image</option>
                <option value="AUDIO">Audio</option>
            </select>
        </label>

        <br/>

        <label>Title: <input type="text" name="title"/></label><br/>
        <label>Answer: <input type="text" name="answer"/></label><br/>

        <div id="textFields">
            <label>Question: <input type="text" name="question"/></label><br/>
        </div>

        <div id="imageFields" style="display:none;">
            <label>Image URL: <input type="text" name="imageUrl"/></label><br/>
        </div>

        <div id="audioFields" style="display:none;">
            <label>Audio URL: <input type="text" name="audioUrl"/></label><br/>
        </div>

        <br/>
        <input type="submit" value="Create Card"/>
    </form>

    <script>updateForm();</script>
    </body>
</html>

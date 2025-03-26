<%@ page import="org.havriutkin.memorycard2.model.CardSet" %>
<%@ include file="partials/header.jsp" %>

<%
    CardSet cardSet = (CardSet) request.getAttribute("cardSet");
%>

<html>
    <head>
        <title>Create Card</title>
        <link rel="stylesheet" href="${pageContext.request.contextPath}/css/styles.css" />
    </head>

    <body>
        <div class="centered-page">
            <div class="container">
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

                    <label>Title:
                        <input type="text" name="title"/>
                    </label>

                    <label>Answer:
                        <input type="text" name="answer"/>
                    </label>

                    <div id="textFields">
                        <label>Question:
                            <input type="text" name="question"/>
                        </label>
                    </div>

                    <div id="imageFields" style="display:none;">
                        <label>Image URL:
                            <input type="text" name="imageUrl"/>
                        </label>
                    </div>

                    <div id="audioFields" style="display:none;">
                        <label>Audio URL:
                            <input type="text" name="audioUrl"/>
                        </label>
                    </div>

                    <input type="submit" value="Create Card"/>
                </form>
            </div>
        </div>

        <script>
            function updateForm() {
                const type = document.getElementById("type").value;
                document.getElementById("textFields").style.display = type === "TEXT" ? "block" : "none";
                document.getElementById("imageFields").style.display = type === "IMAGE" ? "block" : "none";
                document.getElementById("audioFields").style.display = type === "AUDIO" ? "block" : "none";
            }
            updateForm();
        </script>
    </body>
</html>

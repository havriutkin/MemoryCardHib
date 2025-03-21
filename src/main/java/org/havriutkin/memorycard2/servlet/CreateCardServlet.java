package org.havriutkin.memorycard2.servlet;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import org.havriutkin.memorycard2.dao.CardDAO;
import org.havriutkin.memorycard2.dao.CardSetDAO;
import org.havriutkin.memorycard2.model.*;

import java.io.IOException;

@WebServlet("/createCard")
public class CreateCardServlet extends HttpServlet {
    private final CardSetDAO cardSetDAO = new CardSetDAO();
    private final CardDAO cardDAO = new CardDAO();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {
        Long cardSetId = Long.parseLong(req.getParameter("cardSetId"));
        CardSet cardSet = cardSetDAO.findById(cardSetId);
        req.setAttribute("cardSet", cardSet);
        req.getRequestDispatcher("/jsp/createCard.jsp").forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {
        Long cardSetId = Long.parseLong(req.getParameter("cardSetId"));
        String type = req.getParameter("type");

        String title = req.getParameter("title");
        String answer = req.getParameter("answer");

        CardSet cardSet = cardSetDAO.findById(cardSetId);
        if (cardSet == null) {
            resp.sendRedirect("dashboard");
            return;
        }

        Card card = null;

        switch (type) {
            case "TEXT":
                String question = req.getParameter("question");
                card = new TextCard(title, answer, question, cardSet);
                break;
            case "IMAGE":
                String imageUrl = req.getParameter("imageUrl");
                card = new ImageCard(title, answer, imageUrl, cardSet);
                break;
            case "AUDIO":
                String audioUrl = req.getParameter("audioUrl");
                card = new AudioCard(title, answer, audioUrl, cardSet);
                break;
        }

        if (card != null) {
            cardDAO.save(card);
        }

        resp.sendRedirect("dashboard");
    }
}

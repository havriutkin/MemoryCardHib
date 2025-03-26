package org.havriutkin.memorycard2.servlet.Card;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import org.havriutkin.memorycard2.dao.CardDAO;
import org.havriutkin.memorycard2.model.*;

import java.io.IOException;

@WebServlet("/editCard")
public class EditCardServlet extends HttpServlet {
    private final CardDAO cardDAO = new CardDAO();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {
        HttpSession session = req.getSession(false);
        User user = (User) session.getAttribute("user");
        if (user == null) {
            resp.sendRedirect("login");
            return;
        }

        Long id = Long.parseLong(req.getParameter("id"));
        Card card = cardDAO.findById(id);

        // Ensure card exists and belongs to this user
        if (card == null || !card.getCardSet().getUser().getId().equals(user.getId())) {
            resp.sendRedirect("dashboard");
            return;
        }

        req.setAttribute("card", card);
        req.getRequestDispatcher("/jsp/editCard.jsp").forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {
        HttpSession session = req.getSession(false);
        User user = (User) session.getAttribute("user");
        if (user == null) {
            resp.sendRedirect("login");
            return;
        }

        Long id = Long.parseLong(req.getParameter("id"));
        Card card = cardDAO.findById(id);

        // Check ownership
        if (card == null || !card.getCardSet().getUser().getId().equals(user.getId())) {
            resp.sendRedirect("dashboard");
            return;
        }

        card.setTitle(req.getParameter("title"));
        card.setAnswer(req.getParameter("answer"));

        if (card instanceof TextCard) {
            ((TextCard) card).setQuestion(req.getParameter("question"));
        } else if (card instanceof ImageCard) {
            ((ImageCard) card).setImageUrl(req.getParameter("imageUrl"));
        } else if (card instanceof AudioCard) {
            ((AudioCard) card).setAudioUrl(req.getParameter("audioUrl"));
        }

        cardDAO.update(card);
        resp.sendRedirect("dashboard");
    }
}

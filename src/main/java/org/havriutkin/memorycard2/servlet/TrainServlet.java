package org.havriutkin.memorycard2.servlet;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import org.havriutkin.memorycard2.dao.CardSetDAO;
import org.havriutkin.memorycard2.model.*;

import java.io.IOException;
import java.util.Collections;
import java.util.List;

@WebServlet("/train")
public class TrainServlet extends HttpServlet {
    private final CardSetDAO cardSetDAO = new CardSetDAO();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {

        HttpSession session = req.getSession(false);
        User user = (User) session.getAttribute("user");
        if (user == null) {
            resp.sendRedirect("login");
            return;
        }

        Long setId = Long.parseLong(req.getParameter("id"));
        CardSet cardSet = cardSetDAO.findById(setId);

        if (cardSet == null || !cardSet.getUser().getId().equals(user.getId())) {
            resp.sendRedirect("dashboard");
            return;
        }

        List<Card> cards = cardSet.getCards();
        if (cards == null || cards.isEmpty()) {
            req.setAttribute("error", "This card set has no cards.");
            req.getRequestDispatcher("/jsp/train.jsp").forward(req, resp);
            return;
        }

        // Shuffle and save in session
        Collections.shuffle(cards);
        session.setAttribute("train_cards", cards);
        session.setAttribute("train_index", 0);
        req.setAttribute("card", cards.get(0));
        req.getRequestDispatcher("/jsp/train.jsp").forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {

        HttpSession session = req.getSession(false);
        List<Card> cards = (List<Card>) session.getAttribute("train_cards");
        Integer index = (Integer) session.getAttribute("train_index");

        if (cards == null || index == null || index >= cards.size()) {
            resp.sendRedirect("dashboard");
            return;
        }

        index++;
        if (index < cards.size()) {
            session.setAttribute("train_index", index);
            req.setAttribute("card", cards.get(index));
            req.getRequestDispatcher("/jsp/train.jsp").forward(req, resp);
        } else {
            session.removeAttribute("train_cards");
            session.removeAttribute("train_index");
            req.setAttribute("done", true);
            req.getRequestDispatcher("/jsp/train.jsp").forward(req, resp);
        }
    }
}

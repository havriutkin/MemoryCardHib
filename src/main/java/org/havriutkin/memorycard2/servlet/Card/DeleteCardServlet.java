package org.havriutkin.memorycard2.servlet.Card;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import org.havriutkin.memorycard2.dao.CardDAO;
import org.havriutkin.memorycard2.model.*;

import java.io.IOException;

@WebServlet("/deleteCard")
public class DeleteCardServlet extends HttpServlet {
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

        // Ownership check
        if (card == null || !card.getCardSet().getUser().getId().equals(user.getId())) {
            resp.sendRedirect("dashboard");
            return;
        }

        Long cardSetId = card.getCardSet().getId(); // store for redirect
        cardDAO.delete(card);
        resp.sendRedirect("viewCardSet?id=" + cardSetId);
    }
}

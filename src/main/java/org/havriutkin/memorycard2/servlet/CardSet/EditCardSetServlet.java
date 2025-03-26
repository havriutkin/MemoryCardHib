package org.havriutkin.memorycard2.servlet.CardSet;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import org.havriutkin.memorycard2.dao.CardSetDAO;
import org.havriutkin.memorycard2.model.CardSet;
import org.havriutkin.memorycard2.model.User;

import java.io.IOException;

@WebServlet("/editCardSet")
public class EditCardSetServlet extends HttpServlet {
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

        Long id = Long.parseLong(req.getParameter("id"));
        CardSet cardSet = cardSetDAO.findById(id);

        // Only allow editing if the set belongs to the logged-in user
        if (cardSet == null || !cardSet.getUser().getId().equals(user.getId())) {
            resp.sendRedirect("dashboard");
            return;
        }

        req.setAttribute("cardSet", cardSet);
        req.getRequestDispatcher("/jsp/editCardSet.jsp").forward(req, resp);
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
        String newName = req.getParameter("name");

        CardSet cardSet = cardSetDAO.findById(id);

        if (cardSet == null || !cardSet.getUser().getId().equals(user.getId())) {
            resp.sendRedirect("dashboard");
            return;
        }

        if (newName == null || newName.trim().isEmpty()) {
            req.setAttribute("cardSet", cardSet);
            req.setAttribute("error", "Card Set name cannot be empty.");
            req.getRequestDispatcher("/jsp/editCardSet.jsp").forward(req, resp);
            return;
        }

        cardSet.setName(newName.trim());
        cardSetDAO.update(cardSet);
        resp.sendRedirect("dashboard");
    }
}

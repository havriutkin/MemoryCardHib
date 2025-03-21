package org.havriutkin.memorycard2.servlet;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import org.havriutkin.memorycard2.dao.CardSetDAO;
import org.havriutkin.memorycard2.model.CardSet;
import org.havriutkin.memorycard2.model.User;

import java.io.IOException;

@WebServlet("/createCardSet")
public class CreateCardSetServlet extends HttpServlet {
    private final CardSetDAO cardSetDAO = new CardSetDAO();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {
        req.getRequestDispatcher("/jsp/createCardSet.jsp").forward(req, resp);
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

        String name = req.getParameter("name");

        if (name == null || name.trim().isEmpty()) {
            req.setAttribute("error", "Card Set name cannot be empty.");
            req.getRequestDispatcher("/jsp/createCardSet.jsp").forward(req, resp);
            return;
        }

        CardSet cardSet = new CardSet(name.trim(), user);
        cardSetDAO.save(cardSet);

        resp.sendRedirect("dashboard");
    }
}

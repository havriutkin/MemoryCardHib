package org.havriutkin.memorycard2.servlet;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import org.havriutkin.memorycard2.dao.CardSetDAO;
import org.havriutkin.memorycard2.model.User;
import org.havriutkin.memorycard2.model.CardSet;

import java.io.IOException;
import java.util.List;
import java.util.stream.Collectors;

@WebServlet("/dashboard")
public class DashboardServlet extends HttpServlet {
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

        // User's card sets
        List<CardSet> userCardSets = cardSetDAO.findAll().stream()
                .filter(cs -> cs.getUser().getId().equals(user.getId()))
                .collect(Collectors.toList());

        req.setAttribute("cardSets", userCardSets);
        req.getRequestDispatcher("/jsp/dashboard.jsp").forward(req, resp);
    }
}

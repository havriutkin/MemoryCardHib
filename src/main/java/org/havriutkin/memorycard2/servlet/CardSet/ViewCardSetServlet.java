package org.havriutkin.memorycard2.servlet.CardSet;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import org.havriutkin.memorycard2.dao.CardSetDAO;
import org.havriutkin.memorycard2.model.CardSet;
import org.havriutkin.memorycard2.model.User;

import java.io.IOException;

@WebServlet("/viewCardSet")
public class ViewCardSetServlet extends HttpServlet {
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

        // Only allow viewing if it belongs to the user
        if (cardSet == null || !cardSet.getUser().getId().equals(user.getId())) {
            resp.sendRedirect("dashboard");
            return;
        }

        req.setAttribute("cardSet", cardSet);
        req.getRequestDispatcher("/jsp/viewCardSet.jsp").forward(req, resp);
    }
}

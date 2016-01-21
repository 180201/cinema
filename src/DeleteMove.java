import DAO.Rank;
import DAO.Reservation;
import DAO.User;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;

/**
 * Created by Winiu on 21-01-2016.
 */
@WebServlet("/DeleteMove")
public class DeleteMove extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request,response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String url = "/Managemove";

        HttpSession httpSession = request.getSession();
        User user = (User) httpSession.getAttribute("UserSession");
        Rank rank = (Rank) httpSession.getAttribute("RankSession");
        int idMove = Integer.parseInt(request.getParameter("ID"));
        try {

            if(rank.getAdminRank().equals(user.getRank())){
                Database.deleteMove(idMove);

            }
        } catch (SQLException e) {
            e.printStackTrace();
        }





        RequestDispatcher rd=request.getRequestDispatcher(url);
        rd.forward(request, response);

    }
}

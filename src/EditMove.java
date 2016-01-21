import DAO.Move;
import DAO.Rank;
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
@WebServlet("/EditMove")
public class EditMove extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String url = "/Managemove";

        HttpSession httpSession = request.getSession();
        User user = (User) httpSession.getAttribute("UserSession");
        Rank rank = (Rank) httpSession.getAttribute("RankSession");
        int idMove = Integer.parseInt(request.getParameter("ID"));

        String name = request.getParameter("name");
        String date = request.getParameter("date");
        String time = request.getParameter("time");
        PrintWriter out=response.getWriter();

        out.println(idMove+name+date+time);
        try {

            if(rank.getAdminRank().equals(user.getRank())){
                Database.updateMove(name,date,time,idMove);

            }
        } catch (SQLException e) {
            e.printStackTrace();
        }


        RequestDispatcher rd=request.getRequestDispatcher(url);
        rd.forward(request, response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String url = "/EditMove.jsp";

        HttpSession httpSession = request.getSession();
        User user = (User) httpSession.getAttribute("UserSession");
        Rank rank = (Rank) httpSession.getAttribute("RankSession");
        int idMove = Integer.parseInt(request.getParameter("ID"));
        try {

            if(rank.getAdminRank().equals(user.getRank())){
               Move move= Database.getMove(idMove);
               request.setAttribute("EditMove",move);

            }
        } catch (SQLException e) {
            e.printStackTrace();
        }





        RequestDispatcher rd=request.getRequestDispatcher(url);
        rd.forward(request, response);
    }
}

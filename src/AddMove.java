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
import java.io.PrintStream;
import java.io.PrintWriter;
import java.sql.SQLException;

/**
 * Created by Winiu on 20-01-2016.
 */
@WebServlet("/AddMove")
public class AddMove extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String url ="Managemove";
        request.setCharacterEncoding("UTF-8");
        PrintWriter out = response.getWriter();
        out.print("Hej");
        String name =  request.getParameter("name");
        String date = request.getParameter("date");
        String time = request.getParameter("time");
        HttpSession httpSession = request.getSession();
        User user = (User) httpSession.getAttribute("UserSession");
        Rank rank = (Rank) httpSession.getAttribute("RankSession");


        out.println(request.getCharacterEncoding());
        out.println(user.getRank());
        out.println(rank.getAdminRank());
        out.println(rank.getAdminRank().equals(user.getRank()));
        out.println(name + date + time);
        if(rank.getAdminRank().equals(user.getRank()))
        {
            try {
                out.print("Przed Date");
                Database.createMove(name,date,time);
                out.print("OK");
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
        RequestDispatcher rd=request.getRequestDispatcher(url);
        rd.forward(request, response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
            doPost(request,response);
    }
}

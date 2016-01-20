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
 * Created by Winiu on 20-01-2016.
 */
@WebServlet("/DeleteReservation")
public class DeleteReservation extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String url = "/Reservations";
        HttpSession httpSession = request.getSession();
        User user = (User) httpSession.getAttribute("UserSession");
//        String id = request.getParameter("ID");
        int idReservation = Integer.parseInt(request.getParameter("ID"));
        Reservation reservation= null;
        PrintWriter out=response.getWriter();
//        out.println(id);
        try {
            reservation=Database.getOneReservation(idReservation);
            if(reservation.getUser()==user.getId()){
                Database.deleteReservation(idReservation);
                out.println("OK");
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }





        RequestDispatcher rd=request.getRequestDispatcher(url);
        rd.forward(request, response);

    }
}

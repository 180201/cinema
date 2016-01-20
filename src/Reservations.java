import DAO.Move;
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
import java.sql.SQLException;
import java.util.List;

/**
 * Created by Michał on 2015-12-24.
 */
@WebServlet("/Reservations")
public class Reservations extends HttpServlet {
    public Reservations(){
        super();
    }
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request,response);
    }
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        @SuppressWarnings("rawtypes")
        String url = "Reservations.jsp";
        try{
            List<Move> moves = Database.getMoves();
            request.setAttribute("moves", moves);

            HttpSession httpSession = request.getSession();
            User user = (User) httpSession.getAttribute("UserSession");
//            User user = User.getInstance();
            if(user != null){
                List<Reservation> reservations = Database.getMyReservations(String.valueOf(user.getId()));

                request.setAttribute("reservations", reservations);
            }

            RequestDispatcher rd=request.getRequestDispatcher(url);
            rd.forward(request, response);
        }
        catch (SQLException e) {
            e.printStackTrace();
        }
    }
}

import DAO.User;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.SQLException;

/**
 * Created by Michał on 2016-01-14.
 */
@WebServlet("/FinishReservataion")
public class FinishReservataion extends HttpServlet {
    public FinishReservataion(){
        super();
    }
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request,response);
    }
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String url = "Home.jsp";
        User user = User.getInstance();
        String userId = String.valueOf(user.getId());
        String move = request.getParameter("move");
        String placeParam = request.getParameter("res");
        String[] places = placeParam.split(",");

        for(String pl: places){
            try {
                Database.createReservation(userId, move, pl.substring(0,1), pl.substring(1,2));
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }

        RequestDispatcher rd=request.getRequestDispatcher(url);
        rd.forward(request, response);
    }
}
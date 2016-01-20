import DAO.Reservation;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.List;

/**
 * Created by Michał on 2016-01-12.
 */
@WebServlet("/Book")
public class Book  extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request,response);
    }
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String url = "Booking.jsp";
        PrintWriter out=response.getWriter();
        String moveID = request.getParameter("ID");
        String finallyPlaces=null;
        try {
            List<Reservation> places =Database.getPlace(moveID);
            int count =0;
            for(Reservation p1 : places)
            {
                if(count == 0)
                {
                    finallyPlaces=new String ( (p1.getRow().toString()+p1.getPlace().toString()) +",");
                    count++;
                }else{
                    finallyPlaces+=new String ( (p1.getRow().toString()+p1.getPlace().toString()) +",");
                }

            }
            if(finallyPlaces==null)
            {
                finallyPlaces=new String("00");
            }
            int lengthString = finallyPlaces.length();
            finallyPlaces=finallyPlaces.substring(0,lengthString-1);
            request.setAttribute("placesReq", finallyPlaces);
            out.println(finallyPlaces);
        } catch (SQLException e) {
            e.printStackTrace();
        }
        RequestDispatcher rd=request.getRequestDispatcher(url);
        rd.forward(request, response);
    }
}

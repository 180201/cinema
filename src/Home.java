import singleton.Move;

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
 * Created by Michał on 2015-12-21.
 */
@WebServlet(name = "Home")
public class Home extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request,response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String url = "Home.jsp";
        try{
            RequestDispatcher rd=request.getRequestDispatcher(url);
            rd.forward(request, response);
        }
        catch (Exception e) {
            e.printStackTrace();
        }
    }
}

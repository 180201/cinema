import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

/**
 * Created by Winiu on 19-01-2016.
 */
@WebServlet("/Logout")
public class Logout extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request,response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String url = "Login.jsp";
        HttpSession session=request.getSession();
        session.invalidate();
        try{
            RequestDispatcher rd=request.getRequestDispatcher(url);
            rd.forward(request, response);
        }
        catch (Exception e) {
            e.printStackTrace();
        }
    }
}

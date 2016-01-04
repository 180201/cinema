import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.SQLException;

/**
 * Created by Michał on 2015-12-24.
 */
@WebServlet("/Login")
public class Login extends HttpServlet {
    public Login() {
        super();
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String url = "Home.jsp";

        String user = request.getParameter("user");
        String pass = request.getParameter("pass");
        if ( user == null || user.length() == 0 || pass == null || pass.length() == 0 )
        {
            url = "Login.jsp";
        }
        else
        {
            try {
                String ret = Database.login(user, pass);
                if(ret != null){
                    url = "Home.jsp";
//                    request.setAttribute("user", ret);
                }
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }


        RequestDispatcher rd=request.getRequestDispatcher(url);
        rd.forward(request, response);
    }
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request, response);
    }
}
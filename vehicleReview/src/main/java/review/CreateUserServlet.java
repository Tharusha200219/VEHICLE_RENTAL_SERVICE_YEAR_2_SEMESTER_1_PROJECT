package review;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/CreateUserServlet")
public class CreateUserServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private UserDAO userDAO = new UserDAO();  

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.getRequestDispatcher("create.jsp").forward(request, response);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Handle user creation
        String name = request.getParameter("name");
        String email = request.getParameter("email");
        int rating = Integer.parseInt(request.getParameter("rating"));
        String review = request.getParameter("review");

        User newUser = new User(0, name, email, rating, review); // 0 for a new user
        if (userDAO.createUser(newUser)) {
            response.sendRedirect("index.jsp");
        } else {
            response.sendRedirect("error.jsp");
        }
    }
}


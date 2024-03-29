package booking;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/PaymentDeleteServlet")
public class PaymentDeleteServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Handle GET request 

        int paymentId = Integer.parseInt(request.getParameter("paymentId"));
        PaymentDAO paymentDAO = new PaymentDAO();
        Payment payment = paymentDAO.getPaymentById(paymentId); 

        request.setAttribute("payment", payment);
        request.getRequestDispatcher("payment_delete.jsp").forward(request, response);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
       
        int paymentId = Integer.parseInt(request.getParameter("paymentId"));

        PaymentDAO paymentDAO = new PaymentDAO();
        boolean success = paymentDAO.deletePayment(paymentId);

        if (success) {
            response.sendRedirect("PaymentViewServlet");
        } else {
            response.sendRedirect("error.jsp");
        }
    }
}

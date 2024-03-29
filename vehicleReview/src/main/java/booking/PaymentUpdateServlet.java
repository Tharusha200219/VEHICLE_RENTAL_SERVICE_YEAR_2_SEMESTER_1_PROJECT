package booking;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


@WebServlet("/PaymentUpdateServlet")
public class PaymentUpdateServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int paymentId = Integer.parseInt(request.getParameter("paymentId"));
        PaymentDAO paymentDAO = new PaymentDAO();
        Payment payment = paymentDAO.getPaymentById(paymentId); 

        request.setAttribute("payment", payment);
        request.getRequestDispatcher("payment_update.jsp").forward(request, response);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int paymentId = Integer.parseInt(request.getParameter("paymentId"));
        String cardHolderName = request.getParameter("cardHolderName");
        String creditCardNumber = request.getParameter("creditCardNumber");
        String expiryDate = request.getParameter("expiryDate");
        String cvv = request.getParameter("cvv");

        // Check if the "withDriver" parameter exists in the request
        boolean withDriver = request.getParameter("withDriver") != null;

        String carModelNumber = request.getParameter("carModelNumber");

        Payment payment = new Payment();
        payment.setPaymentId(paymentId);
        payment.setCardHolderName(cardHolderName);
        payment.setCreditCardNumber(creditCardNumber);
        payment.setExpiryDate(expiryDate);
        payment.setCvv(cvv);
        payment.setWithDriver(withDriver);
        payment.setCarModelNumber(carModelNumber);

        PaymentDAO paymentDAO = new PaymentDAO();
        boolean success = paymentDAO.updatePayment(payment);

        if (success) {
            response.sendRedirect("PaymentViewServlet");
        } else {
            response.sendRedirect("payment_error.jsp");
        }
    }
}
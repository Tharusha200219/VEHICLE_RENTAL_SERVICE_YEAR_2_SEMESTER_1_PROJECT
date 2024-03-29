package booking;

import java.io.IOException;
import java.util.logging.Logger;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/PaymentInsertServlet")
public class PaymentInsertServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private static final Logger logger = Logger.getLogger(PaymentInsertServlet.class.getName());

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            String cardHolderName = request.getParameter("cardHolderName");
            String creditCardNumber = request.getParameter("creditCardNumber");
            String expiryDate = request.getParameter("expiryDate");
            String cvv = request.getParameter("cvv");

            // Get the value of the "withDriver" parameter and convert it to a boolean
            boolean withDriver = "on".equals(request.getParameter("withDriver"));

            String carModelNumber = request.getParameter("carModelNumber");

            Payment payment = new Payment();
            payment.setCardHolderName(cardHolderName);
            payment.setCreditCardNumber(creditCardNumber);
            payment.setExpiryDate(expiryDate);
            payment.setCvv(cvv);
            payment.setWithDriver(withDriver); 

            payment.setCarModelNumber(carModelNumber);

            PaymentDAO paymentDAO = new PaymentDAO();
            boolean success = paymentDAO.insertPayment(payment);

            if (success) {
                response.sendRedirect("index.jsp");
            } else {
                response.sendRedirect("error.jsp");
            }
        } catch (Exception e) {
        	logger.severe("ther is an error in the insert servlet......" + e.getMessage());
            e.printStackTrace();
            response.sendRedirect("error.jsp");
        }
    }
}


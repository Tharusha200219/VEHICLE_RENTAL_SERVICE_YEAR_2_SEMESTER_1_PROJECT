package booking;

import java.util.List;

public interface PaymentDAOInterface {
    boolean insertPayment(Payment payment);

    boolean updatePayment(Payment payment);

    boolean deletePayment(int paymentId);

    List<Payment> getAllPayments();

    Payment getPaymentById(int paymentId);
}

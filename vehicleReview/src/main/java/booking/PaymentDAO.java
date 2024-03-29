package booking;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Types;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Logger;
//IT22225788
//SANDAKELUM P.A.T.R
public class PaymentDAO implements PaymentDAOInterface {
    private static final Logger logger = Logger.getLogger(PaymentDAO.class.getName());

    @Override
    public boolean insertPayment(Payment payment) {
        try (Connection connection = DbUtil.getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(
                "INSERT INTO payments (card_holder_name, credit_card_number, expiry_date, cvv, with_driver, booking_date, car_model_number) VALUES (?, ?, ?, ?, ?, ?, ?)")) {
            preparedStatement.setString(1, payment.getCardHolderName());
            preparedStatement.setString(2, payment.getCreditCardNumber());
            preparedStatement.setString(3, payment.getExpiryDate());
            preparedStatement.setString(4, payment.getCvv());
            preparedStatement.setBoolean(5, payment.isWithDriver());

            // Check if bookingDate is not null before using it
            if (payment.getBookingDate() != null) {
                preparedStatement.setDate(6, new java.sql.Date(payment.getBookingDate().getTime()));
            } else {
                // Handle the case where bookingDate is null
                preparedStatement.setNull(6, Types.DATE);
            }

            // Check if carModelNumber is not null before using it
            if (payment.getCarModelNumber() != null) {
                preparedStatement.setString(7, payment.getCarModelNumber());
            } else {
                // Handle the case where carModelNumber is null
                preparedStatement.setNull(7, Types.VARCHAR);
            }

            int rowsInserted = preparedStatement.executeUpdate();
            return rowsInserted > 0;
        } catch (SQLException e) {
            logger.severe("Data not inserted: " + e.getMessage());
            e.printStackTrace();
            return false;
        }
    }

    @Override
    public boolean updatePayment(Payment payment) {
        if (payment == null) {
            return false; // If payment is null
        }

        try (Connection connection = DbUtil.getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(
                "UPDATE payments SET card_holder_name=?, credit_card_number=?, expiry_date=?, cvv=?, with_driver=?, booking_date=?, car_model_number=? WHERE payment_id=?")) {
            preparedStatement.setString(1, payment.getCardHolderName());
            preparedStatement.setString(2, payment.getCreditCardNumber());
            preparedStatement.setString(3, payment.getExpiryDate());
            preparedStatement.setString(4, payment.getCvv());
            preparedStatement.setBoolean(5, payment.isWithDriver());

            // Check if bookingDate is not null before using it
            if (payment.getBookingDate() != null) {
                preparedStatement.setDate(6, new java.sql.Date(payment.getBookingDate().getTime()));
            } else {
                // Handle the case where bookingDate is null
                preparedStatement.setNull(6, Types.DATE);
            }

            preparedStatement.setString(7, payment.getCarModelNumber());
            preparedStatement.setInt(8, payment.getPaymentId());

            int rowsUpdated = preparedStatement.executeUpdate();
            return rowsUpdated > 0;
        } catch (SQLException e) {
            logger.severe("Data not updated: " + e.getMessage());
            e.printStackTrace();
            return false;
        }
    }

    @Override
    public boolean deletePayment(int paymentId) {
        try (Connection connection = DbUtil.getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement("DELETE FROM payments WHERE payment_id=?")) {
            preparedStatement.setInt(1, paymentId);

            int rowsDeleted = preparedStatement.executeUpdate();
            return rowsDeleted > 0;
        } catch (SQLException e) {
            logger.severe("Data not deleted: " + e.getMessage());
            e.printStackTrace();
            return false;
        }
    }

    @Override
    public List<Payment> getAllPayments() {
        List<Payment> payments = new ArrayList<>();
        try (Connection connection = DbUtil.getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement("SELECT * FROM payments");
             ResultSet resultSet = preparedStatement.executeQuery()) {
            while (resultSet.next()) {
                Payment payment = new Payment();
                payment.setPaymentId(resultSet.getInt("payment_id"));
                payment.setCardHolderName(resultSet.getString("card_holder_name"));
                payment.setCreditCardNumber(resultSet.getString("credit_card_number"));
                payment.setExpiryDate(resultSet.getString("expiry_date"));
                payment.setCvv(resultSet.getString("cvv"));
                payment.setWithDriver(resultSet.getBoolean("with_driver"));

                // Set carModelNumber
                payment.setCarModelNumber(resultSet.getString("car_model_number"));
                payments.add(payment);
            }
        } catch (SQLException e) {
            logger.severe("There is an error in getAllPayments: " + e.getMessage());
            e.printStackTrace();
        }
        return payments;
    }

    @Override
    public Payment getPaymentById(int paymentId) {
        Payment payment = null;
        try (Connection connection = DbUtil.getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement("SELECT * FROM payments WHERE payment_id=?")) {
            preparedStatement.setInt(1, paymentId);
            try (ResultSet resultSet = preparedStatement.executeQuery()) {
                if (resultSet.next()) {
                    payment = new Payment();
                    payment.setPaymentId(resultSet.getInt("payment_id"));
                    payment.setCardHolderName(resultSet.getString("card_holder_name"));
                    payment.setCreditCardNumber(resultSet.getString("credit_card_number"));
                    payment.setExpiryDate(resultSet.getString("expiry_date"));
                    payment.setCvv(resultSet.getString("cvv"));
                    payment.setWithDriver(resultSet.getBoolean("with_driver"));

                    payment.setCarModelNumber(resultSet.getString("car_model_number"));
                }
            }
        } catch (SQLException e) {
            logger.severe("There is an error: " + e.getMessage());
            e.printStackTrace();
        }
        return payment;
    }
}

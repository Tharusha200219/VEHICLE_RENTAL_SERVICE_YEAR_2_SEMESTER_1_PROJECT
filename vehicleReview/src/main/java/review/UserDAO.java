package review;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Logger;
//IT22225788
//SANDAKELUM P.A.T.R
public class UserDAO implements UserDAOInterface {
    private static final String INSERT_USER = "INSERT INTO users (name, email, rating, review) VALUES (?, ?, ?, ?)";
    private static final String UPDATE_USER = "UPDATE users SET name = ?, email = ?, rating = ?, review = ? WHERE id = ?";
    private static final String DELETE_USER = "DELETE FROM users WHERE id = ?";
    private static final String SELECT_USER_BY_ID = "SELECT * FROM users WHERE id = ?";
    private static final String SELECT_ALL_USERS = "SELECT * FROM users";
    private static final Logger logger = Logger.getLogger(UserDAO.class.getName());

    public boolean createUser(User user) {
        try (Connection connection = DbUtil.getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(INSERT_USER)) {
            preparedStatement.setString(1, user.getName());
            preparedStatement.setString(2, user.getEmail());
            preparedStatement.setInt(3, user.getRating());
            preparedStatement.setString(4, user.getReview());

            int result = preparedStatement.executeUpdate();
            return result > 0;
        } catch (SQLException e) {
            logger.severe("DATA not inserted......" + e.getMessage());
            e.printStackTrace();
            return false;
        }
    }

    public boolean updateUser(User user) {
        try (Connection connection = DbUtil.getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(UPDATE_USER)) {
            preparedStatement.setString(1, user.getName());
            preparedStatement.setString(2, user.getEmail());
            preparedStatement.setInt(3, user.getRating());
            preparedStatement.setString(4, user.getReview());
            preparedStatement.setInt(5, user.getId());

            int result = preparedStatement.executeUpdate();
            return result > 0;
        } catch (SQLException e) {
            logger.severe("DATA not updated......" + e.getMessage());
            e.printStackTrace();
            return false;
        }
    }

    public boolean deleteUser(int id) {
        try (Connection connection = DbUtil.getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(DELETE_USER)) {
            preparedStatement.setInt(1, id);

            int result = preparedStatement.executeUpdate();
            return result > 0;
        } catch (SQLException e) {
            logger.severe("DATA not deleted......" + e.getMessage());
            e.printStackTrace();
            return false;
        }
    }

    public User getUserById(int id) {
        User user = null;
        try (Connection connection = DbUtil.getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(SELECT_USER_BY_ID)) {
            preparedStatement.setInt(1, id);

            ResultSet resultSet = preparedStatement.executeQuery();
            if (resultSet.next()) {
                String name = resultSet.getString("name");
                String email = resultSet.getString("email");
                int rating = resultSet.getInt("rating");
                String review = resultSet.getString("review");
                user = new User(id, name, email, rating, review);
            }
        } catch (SQLException e) {
            logger.severe("There is an error in getUserById in UserDAO CLASS......" + e.getMessage());
            e.printStackTrace();
        }
        return user;
    }

    public List<User> getAllUsers() {
        List<User> users = new ArrayList<>();
        try (Connection connection = DbUtil.getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(SELECT_ALL_USERS);
             ResultSet resultSet = preparedStatement.executeQuery()) {
            while (resultSet.next()) {
                int id = resultSet.getInt("id");
                String name = resultSet.getString("name");
                String email = resultSet.getString("email");
                int rating = resultSet.getInt("rating");
                String review = resultSet.getString("review");
                users.add(new User(id, name, email, rating, review));
            }
        } catch (SQLException e) {
            logger.severe("There is an error in getAllUsers in UserDAO CLASS......" + e.getMessage());
            e.printStackTrace();
        }
        return users;
    }
}

package review;

import java.util.List;

public interface UserDAOInterface {
    boolean createUser(User user);
    boolean updateUser(User user);
    boolean deleteUser(int id);
    User getUserById(int id);
    List<User> getAllUsers();
}

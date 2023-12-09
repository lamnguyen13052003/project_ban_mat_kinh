package model.DAO;

import model.bean.*;
import db.JDBIConnector;
import org.jdbi.v3.core.Jdbi;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class UserDAO extends DAO {
    private static UserDAO INSTANCE;

    public static UserDAO getInstance() {
        return INSTANCE != null ? INSTANCE : new UserDAO();
    }

    public void addUser(User user) {
    }

    public User getUser(String email, String password) {
        connector = JDBIConnector.get();
        List<User> users = connector.withHandle(handle ->
                handle.createQuery("SELECT u.id, u.fullName, u.avatar, u.email, u.`password`, u.role FROM users AS u WHERE u.email = ? AND u.password = ? AND u.verify = ? AND u.lock = ?")
                        .bind(0, email)
                        .bind(1, password)
                        .bind(2, 1)
                        .bind(3, 0)
                        .mapToBean(User.class)
                        .list()
        );

        return !users.isEmpty() && users.size() == 1 ? users.get(0) : null;
    }

    public boolean getEmail(String email) {
        connector = JDBIConnector.get();
        List<User> users = connector.withHandle(handle ->
                handle.createQuery("SELECT u.id FROM users AS u WHERE u.email = ? u.verify = ? AND u.lock = ?")
                        .bind(0, email)
                        .bind(1, 1)
                        .bind(2, 0)
                        .mapToBean(User.class)
                        .list()
        );

        return !users.isEmpty();
    }

    public Map<Integer, User> getUserForReviewProduct(List<Review> reviews) {
        Map<Integer, User> mapUsers = new HashMap<>();
        User user = null;
        for (Review review : reviews) {
            int userId = review.getUserId();
            user = connector.withHandle(handle ->
                    handle.createQuery("SELECT u.fullName, u.avatar " +
                                    "FROM users AS u " +
                                    "WHERE u.id = ?")
                            .bind(0, userId)
                            .mapToBean(User.class)
                            .findFirst().orElse(null)
            );

            mapUsers.put(review.getId(), user);
        }

        return mapUsers;
    }

    public boolean checkLogin(String email, String password) {
        connector = JDBIConnector.get();
        List<User> users = connector.withHandle(handle ->
                handle.createQuery("SELECT u.id, u.role FROM users AS u WHERE u.email = ? AND u.password = ? AND u.verify = ? AND u.lock = ?")
                        .bind(0, email)
                        .bind(1, password)
                        .bind(2, 1)
                        .bind(3, 0)
                        .mapToBean(User.class)
                        .list()
        );

        return !users.isEmpty() && users.size() == 1 ? true : false;
    }
}

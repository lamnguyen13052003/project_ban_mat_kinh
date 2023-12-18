package model.DAO;

import model.bean.*;
import db.JDBIConnector;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class UserDAO extends DAO {
    private static UserDAO INSTANCE;

    public static UserDAO getInstance() {
        return INSTANCE != null ? INSTANCE : new UserDAO();
    }

    public int addUser(User user) {
        connector = JDBIConnector.get();
        return connector.withHandle(handle ->
                handle.createUpdate("INSERT INTO `users` (`id`, `avatar`, `fullName`, `sex`, `birthday`, `email`, `password`, `role`, `verify`, `lock`) VALUES (NULL, ?, ?, ?, ?, ?, ?, ?, ?, ?)")
                        .bind(0, user.getAvatar())
                        .bind(1, user.getFullName())
                        .bind(2, user.getSex())
                        .bind(3, user.getBirthDay())
                        .bind(4, user.getEmail())
                        .bind(5, user.getPassword())
                        .bind(6, user.getRole())
                        .bind(7, 0)
                        .bind(8, 0).execute()
        );
    }

    public int verìfyAccountByEmail(String email) {
        System.out.println(email);
        connector = JDBIConnector.get();
        return connector.withHandle(handle ->
                handle.createUpdate("Update users set verify = 1 where email = ?")
                        .bind(0, email).execute()

        );
    }

    public User login(String email, String password) {
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

    public boolean containsEmail(String email) {
        connector = JDBIConnector.get();
        return connector.withHandle(handle ->
                handle.createQuery("SELECT u.id FROM users AS u WHERE u.email = ? AND u.verify = ? AND u.lock = ?")
                        .bind(0, email)
                        .bind(1, 0)
                        .bind(2, 0)
                        .mapTo(User.class).findFirst().orElse(null)
        ) != null;
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
}

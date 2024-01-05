package model.DAO;

import model.bean.*;
import db.JDBIConnector;
import org.mindrot.jbcrypt.BCrypt;

import java.time.LocalDateTime;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class UserDAO extends DAO {
    private static UserDAO INSTANCE;

    public static UserDAO getInstance() {
        return INSTANCE != null ? INSTANCE : new UserDAO();
    }

    public int insertUser(User user, String codeVerify) {
        return connector.withHandle(handle ->
                handle.createUpdate("INSERT INTO `users` (`avatar`, `fullName`, `sex`, `birthday`, `email`, `password`, `role`, `verify`, `lock`, `registrationTime`) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?)")
                        .bind(0, user.getAvatar())
                        .bind(1, user.getFullName())
                        .bind(2, user.getSex())
                        .bind(3, user.getBirthDay())
                        .bind(4, user.getEmail())
                        .bind(5, user.getPassword())
                        .bind(6, user.getRole())
                        .bind(7, codeVerify)
                        .bind(8, 0)
                        .bind(9, LocalDateTime.now())
                        .execute()
        );
    }

    public int verifyAccountByEmail(String email) {
        connector = JDBIConnector.get();
        return connector.withHandle(handle ->
                handle.createUpdate("Update users set verify = 1 where email = ?")
                        .bind(0, email).execute()

        );
    }
    public int updateProdile(User user) {
        connector = JDBIConnector.get();
        return connector.withHandle(handle ->
                handle.createUpdate("Update users set fullName = ?, sex = ?, birthday =?, avatar = ? where email = ?")
                        .bind(0, user.getFullName())
                        .bind(1, user.getSex())
                        .bind(2, user.getBirthDay())
                        .bind(3, user.getAvatar())
                        .bind(4, user.getEmail())
                        .execute()

        );
    }
    public User login(String email, String password) {
        connector = JDBIConnector.get();
        User user = connector.withHandle(handle ->
                handle.createQuery("SELECT u.id, u.birthday, u.fullName, u.avatar, u.email, u.`password`, u.role, u.verify FROM users AS u WHERE u.email = ?  AND u.lock = ?")
                        .bind(0, email)
                        .bind(1, 0)
                        .mapToBean(User.class)
                        .findFirst().orElse(null)
        );

        if (user == null) return null;
        String hashPass = user.getPassword();
        if (BCrypt.checkpw(password, hashPass)) {
            user.setPassword(null);
            return user;
        }
        return null;
    }

    public boolean containsEmail(String email) {
        connector = JDBIConnector.get();
        return connector.withHandle(handle ->
                handle.createQuery("SELECT u.email " +
                                "FROM users AS u " +
                                "WHERE u.email = ? " +
                                "ORDER BY id DESC")
                        .bind(0, email)
                        .mapTo(String.class).findFirst().orElse(null)
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

    private User getUserForVerify(String email) {
        return connector.withHandle(handle ->
                handle.createQuery("SELECT u.id, u.verify, u.registrationTime " +
                                "FROM users AS u " +
                                "WHERE u.email = ? " +
                                "ORDER BY id DESC")
                        .bind(0, email)
                        .mapToBean(User.class).findFirst().orElse(null)
        );
    }

    public int verify(String email, String codeVerify) {
        User user = getUserForVerify(email);

        if (user == null) return -1;
        int result = user.isVerify(codeVerify);
        switch (result) {
            case 1 -> {
                connector.withHandle(handle ->
                        handle.createUpdate("UPDATE users SET verify = NULL " +
                                        "WHERE id = ?;")
                                .bind(0, user.getId())
                                .execute()
                );
            }
        }

        return result;
    }

    public void updateCodeVerify(String email, String code, LocalDateTime time) {
        connector.withHandle(handle ->
                handle.createUpdate("UPDATE users SET " +
                                "verify = ? " +
                                ", registrationTime = ? " +
                                "WHERE email = ?;")
                        .bind(0, code)
                        .bind(1, time)
                        .bind(2, email)
                        .execute()
        );
    }

    public int resetPassword(String email, String password) {
        return connector.withHandle(handle ->
                handle.createUpdate("UPDATE users SET " +
                                "`password` = ? " +
                                "WHERE email = ?;")
                        .bind(0, password)
                        .bind(1, email)
                        .execute()
        );
    }
}


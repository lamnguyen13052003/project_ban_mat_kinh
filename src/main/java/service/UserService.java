package service;

import bean.User;
import db.JDBIConnector;
import org.jdbi.v3.core.Jdbi;

import java.util.List;

public class UserService {
    private Jdbi connector;
    private static UserService instance;
    private User user;

    private final String INSERT_USER = "INSERT INTO Users(avatar, fullName, sex, birthday, email, password, role, verify, lock) VALUES(?, ?, ?, ?, ?, ?, ?, ?, ?)";

    public static UserService getInstance() {
        if (instance == null) return new UserService();

        return instance;
    }

    public boolean checkLogin(String username, String password) {
        connector = JDBIConnector.get();
        List<User> users = connector.withHandle(handle ->
                handle.createQuery("SELECT * FROM users AS u WHERE u.email = ? AND u.password = ? AND u.verify = ? AND u.lock = ?")
                        .bind(0, username)
                        .bind(1, password)
                        .bind(2, 1)
                        .bind(3, 0)
                        .mapToBean(User.class)
                        .list()
        );

        user = !users.isEmpty() && users.size() == 1 ? users.getFirst() : null;
        return user != null;
    }

    public User getUser() {
        return user;
    }

    public void signup(User user) {
        connector.withHandle(handle ->
                handle.createUpdate(INSERT_USER)
                        .bind(0, user.getAvatar())
                        .bind(1, user.getFullName())
                        .bind(2, user.getSex())
//                        .bind(3, user.getBirthDay())
                        .bind(4, user.getEmail())
                        .bind(5, user.getPassword())
                        .bind(6, 1)
                        .bind(7, 1)
                        .bind(8, 0)
                        .execute()
        );
    }
}

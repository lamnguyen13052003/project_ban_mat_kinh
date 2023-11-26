package model.DAO;

import model.bean.*;
import db.JDBIConnector;
import org.jdbi.v3.core.Jdbi;

import java.util.List;

public class UserDAO {
    private Jdbi connector;
    private static UserDAO INSTANCE;

    public static UserDAO getInstance() {
        return INSTANCE != null ? INSTANCE : new UserDAO();
    }

    public void addUser(User user) {
    }

    public User getUser(String eamil, String password) {
        connector = JDBIConnector.get();
        List<User> users = connector.withHandle(handle ->
                handle.createQuery("SELECT u.id, u.fullName, u.avatar, u.role FROM users AS u WHERE u.email = ? AND u.password = ? AND u.verify = ? AND u.lock = ?")
                        .bind(0, eamil)
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
}

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

    public int addUser(User user) {
        connector = JDBIConnector.get();
        return  connector.withHandle(handle ->
                handle.createUpdate("INSERT INTO `users` (`id`, `avatar`, `fullName`, `sex`, `birthday`, `email`, `password`, `role`, `verify`, `lock`) VALUES (NULL, ?, ?, ?, ?, ?, ?, ?, ?, ?)")
                        .bind(0, user.getAvatar())
                        .bind(1,user.getFullName())
                        .bind(2,user.getSex())
                        .bind(3,user.getBirthDay())
                        .bind(4,user.getEmail())
                        .bind(5,user.getPassword())
                        .bind(6,user.getRole())
                        .bind(7,0)
                        .bind(8,0).execute()

        );
    }
    public int veryAccountByEmail(String email) {
        System.out.println(email);
        connector = JDBIConnector.get();
        return  connector.withHandle(handle ->
                handle.createUpdate("Update users set verify = 1 where email = ?")
                        .bind(0, email).execute()

        );
    }
    public User getUser(String email) {
        connector = JDBIConnector.get();
        List<User> users = connector.withHandle(handle ->
                handle.createQuery("SELECT u.id, u.fullName,u.password, u.avatar, u.role FROM users AS u WHERE u.email = ?  AND u.verify = ? AND u.lock = ?")
                        .bind(0, email)
                        .bind(1, 1)
                        .bind(2, 0)
                        .mapToBean(User.class)
                        .list()
        );

        return !users.isEmpty() && users.size() == 1 ? users.get(0) : null;
    }

    public User getEmail(String email) {
        connector = JDBIConnector.get();
        List<User> users = connector.withHandle(handle ->
                handle.createQuery("SELECT u.id FROM users AS u WHERE u.email = ? AND u.verify = ? AND u.lock = ?")
                        .bind(0, email)
                        .bind(1, 0)
                        .bind(2, 0)
                        .mapToBean(User.class)
                        .list()
        );
        if(users.size() == 0) return null;
        return users.get(0);
    }
}

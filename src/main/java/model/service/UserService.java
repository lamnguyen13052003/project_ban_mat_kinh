package model.service;

import model.DAO.UserDAO;
import model.bean.User;

public class UserService {
    private static UserService instance;
    private User user;

    private UserDAO userDAO;

    private final String INSERT_USER = "INSERT INTO Users(avatar, fullName, sex, birthday, email, password, role, verify, lock) VALUES(?, ?, ?, ?, ?, ?, ?, ?, ?)";

    public static UserService getInstance() {
        if (instance == null) return new UserService();

        return instance;
    }

    private UserService() {
        userDAO = UserDAO.getInstance();
    }

    public boolean canLogin(String eamil, String password) {
        user = userDAO.getUser(eamil, password);
        return  user != null;
    }

    public User getUser() {
        return user;
    }

    public void signup(User user) {
        userDAO.addUser(user);
    }

    public void forgetPassword(String email){

    }

    public boolean containEmail(String email){
        return userDAO.getEmail(email);
    }
}

package model.service;

import model.DAO.UserDAO;
import model.bean.Review;
import model.bean.User;

import java.util.List;
import java.util.Map;

public class UserService {
    private static UserService instance;
    private UserDAO userDAO;

    private final String INSERT_USER = "INSERT INTO Users(avatar, fullName, sex, birthday, email, password, role, verify, lock) VALUES(?, ?, ?, ?, ?, ?, ?, ?, ?)";

    public static UserService getInstance() {
        if (instance == null) return new UserService();

        return instance;
    }

    private UserService() {
        userDAO = UserDAO.getInstance();
    }

    public User login(String email, String password) {
        return userDAO.getUser(email, password);
    }

    public void signup(User user) {
        userDAO.addUser(user);
    }

    public void forgetPassword(String email){

    }

    public boolean containEmail(String email){
        return userDAO.getEmail(email);
    }

    public Map<Integer, User> getUserForReviewProduct(List<Review> reviews) {
        return UserDAO.getInstance().getUserForReviewProduct(reviews);
    }
}

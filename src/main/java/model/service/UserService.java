package model.service;

import model.DAO.UserDAO;
import model.bean.Review;
import model.bean.User;
import org.mindrot.jbcrypt.BCrypt;

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
        return userDAO.login(email, password);
    }


    public boolean findUserByMail(String mail){
        return userDAO.containsEmail(mail);
    }

    public boolean signup(User user) {
        user.setPassword(hashPassword(user.getPassword()));
        int rs =  userDAO.addUser(user);
        if(rs == 1) return true;

        return false;
    }

    public void forgetPassword(String email){
        /*Anh làm phần quen mật khẩu chơa. alo. nge , anh quên mất @@. chịu,*/
    }
    public boolean verifyByEmail(String email){
        int rs =  userDAO.verìfyAccountByEmail(email);
        if(rs == 1) return true;
        return false;
    }
    private String hashPassword(String pass){
        String hash = BCrypt.hashpw(pass, BCrypt.gensalt(12));
        return hash;

    }
    private boolean checkPassword(String hashpass, String pass){
        return BCrypt.checkpw(pass, hashpass);
    }
    public boolean containsEmail(String email){
        return userDAO.containsEmail(email);
    }
    public Map<Integer, User> getUserForReviewProduct(List<Review> reviews) {
        return UserDAO.getInstance().getUserForReviewProduct(reviews);
    }
}

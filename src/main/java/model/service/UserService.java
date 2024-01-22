package model.service;

import model.DAO.UserDAO;
import model.bean.Review;
import model.bean.User;
import model.dto.Page;
import model.dto.UserManage;
import org.mindrot.jbcrypt.BCrypt;

import java.time.LocalDateTime;
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

    public boolean signup(User user, String codeVerify) {
        user.setPassword(hashPassword(user.getPassword()));
        int rs =  userDAO.insertUser(user, codeVerify);
        if(rs == 1) return true;

        return false;
    }
    public Page<UserManage> getPageUser(int page, int id, String fullName, int role, int lock){
       List<UserManage> users = userDAO.getPageUser(page, 10, id, fullName, role, lock);
       int count = userDAO.getTotalUserCount(id, fullName, role, lock);
       Page<UserManage> pagi = new Page<>(count,page,10, users);
       return pagi;
    }

    public void forgetPassword(String email){
        /*Anh làm phần quen mật khẩu chơa. alo. nge , anh quên mất @@. chịu,*/
    }
    public boolean verifyByEmail(String email){
        int rs =  userDAO.verifyAccountByEmail(email);
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

    public int verify(String email, String codeVerify) {
        return UserDAO.getInstance().verify(email, codeVerify);
    }

    public void updateCodeVerify(String email, String code, LocalDateTime time){
        UserDAO.getInstance().updateCodeVerify(email, code, time);
    }

    public int resetPassword(String email, String password) {
        return UserDAO.getInstance().resetPassword(email, password);
    }
}

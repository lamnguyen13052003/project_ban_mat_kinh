package model.service;

import model.DAO.UserDAO;
import model.bean.User;
import org.mindrot.jbcrypt.BCrypt;

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

    public boolean canLogin(String email, String password) {
        user = userDAO.getUser(email);
        if(user == null) return false;
        System.out.println(user.getPassword() + "_" + password);
        boolean rs = checkPassword(user.getPassword(),password);
        return  rs;
    }

    public boolean findUserByMail(String mail){
        return userDAO.getEmail(mail) != null;
    }

    public User getUser() {
        return user;
    }

    public boolean  signup(User user) {
        user.setPassword(hashPassword(user.getPassword()));
        int rs =  userDAO.addUser(user);
        if(rs == 1) return true;

        return false;

    }

    public void forgetPassword(String email){

    }
    public boolean verifyByEmail(String email){
        int rs =  userDAO.veryAccountByEmail(email);
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
    public boolean containEmail(String email){
        return userDAO.getEmail(email) != null;
    }
}

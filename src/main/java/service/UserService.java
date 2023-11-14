package service;

import bean.User;

public class UserService {
    private static UserService instance;

    public UserService getInstance() {
        if (instance == null) return new UserService();
        return instance;
    }

    public User checkLogin(String username, String password) {
        return null;
    }
}

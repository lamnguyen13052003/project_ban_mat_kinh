package db;

import bean.User;
import com.mysql.cj.jdbc.MysqlDataSource;
import org.jdbi.v3.core.Jdbi;

import java.sql.SQLException;
import java.util.List;

public class DBConnectionCell {
    private static Jdbi jdbi;

    private String username;
    private String password;
    private String url;
    private long relaxTime;
    private long timeOut;

    private boolean close = false;

    // Tạo mới một connection
    public DBConnectionCell(String username, String password, String url, long relaxTime) {
        this.username = username;
        this.password = password;
        this.url = url;
        this.relaxTime = relaxTime;
        makeConnect();
    }

    public boolean isTimeOut() {
        if (System.currentTimeMillis() - relaxTime > timeOut) {
            return true;
        }
        return false;
    }

    public void close(){
        close = true;
    }
    public boolean isClosed(){
        return close;
    }

    public String getInformation() {
        String infor = "\nInfor :  Connection ( URL :" + url + " , User name : " + username + ", Password : " + password + ", " + jdbi.toString() + " )";
        return infor;
    }

    public void setRelaxTime(long relaxTime) {
        this.relaxTime = relaxTime;
    }

    public Jdbi getDbConnection() {
        return jdbi;
    }

    public long getRelaxTime() {
        return relaxTime;
    }

    public long getTimeOut() {
        return timeOut;
    }

    private void makeConnect() {
        MysqlDataSource dataSource = new MysqlDataSource();
        dataSource.setURL(url);
        dataSource.setUser(username);
        dataSource.setPassword(password);
        try {
            dataSource.setUseCompression(true); //Lưu user
            dataSource.setAutoReconnect(true); //Tự động kết nối lại
        } catch (SQLException throwables) {
            throwables.printStackTrace();
            throw new RuntimeException(throwables);
        }

        jdbi = Jdbi.create(dataSource);
    }


    private DBConnectionCell() {
    }
}




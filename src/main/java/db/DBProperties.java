package db;

import java.io.*;
import java.util.HashMap;
import java.util.Map;
import java.util.Properties;
import java.util.StringTokenizer;

public class DBProperties {
    public static Properties prop = new Properties();

    static {
        File f = new File(".//src//main//resources//db.properties");

        if (f.exists()) {
            try {
                prop.load(new FileInputStream(f));
            } catch (UnsupportedEncodingException e) {
                throw new RuntimeException(e);
            } catch (FileNotFoundException e) {
                throw new RuntimeException(e);

            } catch (IOException e) {
                throw new RuntimeException(e);
            }
        }
    }

    private static String host = prop.getProperty("db.host"),
            port = prop.getProperty("db.port"),
            username = prop.getProperty("db.username"),
            password = prop.getProperty("db.password"),
            name = prop.getProperty("db.tableName");

    public static String getDbHost() {
        return host;
    }

    public static String getDbPort() {
        return port;
    }

    public static String getUsername() {
        return username;
    }

    public static String getPassword() {
        return password;
    }

    public static String getDbName() {
        return name;
    }
}

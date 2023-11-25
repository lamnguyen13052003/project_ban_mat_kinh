package db;

public class DBConnectionPoolConfig {
    public static final int MAX_POOL_SIZE = 20,
            MIN_POOL_SIZE = 5,
            INIT_POOL_SIZE = 10,
            TIME_OUT = 200;
    public static final String SERVER_NAME = DBProperties.getDbHost(),
            DB_PORT = DBProperties.getDbPort(),
            USERNAME = DBProperties.getUsername(),
            PASSWORD = DBProperties.getPassword(),
            SID = DBProperties.getDbName(),
            URL = "jdbc:mysql://" + SERVER_NAME + ":" + DB_PORT + ":" + SID;
}

package db;

import java.util.concurrent.LinkedBlockingQueue;

public class DBConnectionPool {
    private LinkedBlockingQueue<DBConnectionCell> pool = new LinkedBlockingQueue<DBConnectionCell>();
    protected int numOfConnectionCreated = 0;
    protected String sid;
    protected int maxPoolSize;
    protected int initPoolSize;
    protected int minPoolSize;
    protected long timeOut = 10000;

    protected String url;
    protected String user;
    protected String password;

    protected Thread thread;
    protected long start_time;
    protected long end_time;
    protected static DBConnectionPool instancePool;


    public DBConnectionPool() {
    }

    //Setting for Pool
    public synchronized static DBConnectionPool getInstace() {
        if (instancePool == null) {
            instancePool = new DBConnectionPool();
            instancePool.setInitPoolSize(DBConnectionPoolConfig.INIT_POOL_SIZE);
            instancePool.setMaxPoolSize(DBConnectionPoolConfig.MAX_POOL_SIZE);
            instancePool.setMinPoolSize(DBConnectionPoolConfig.MIN_POOL_SIZE);
            instancePool.setUrl(DBConnectionPoolConfig.URL);
            instancePool.setUser(DBConnectionPoolConfig.USERNAME);
            instancePool.setPassword(DBConnectionPoolConfig.PASSWORD);
            instancePool.setTimeOut(DBConnectionPoolConfig.TIME_OUT);
            instancePool.setSid(DBConnectionPoolConfig.SID);
            instancePool.thread = new AbsThread() {
                /*
                 * When the number of connection > min connection , close TimeOut Connection
                 */
                @Override
                public void execute() {
                    for (DBConnectionCell connection : instancePool.pool) {
                        if (instancePool.numOfConnectionCreated > instancePool.minPoolSize && connection.isTimeOut()) {
                            connection.close();
                            instancePool.pool.remove(connection);
                            instancePool.numOfConnectionCreated--;
                        }
                    }
                }
            };
        }

        return instancePool;
    }

    public void start() {
        // Load Connection to Pool
        start_time = System.currentTimeMillis();
        try {
            for (int i = 0; i < initPoolSize; i++) {
                DBConnectionCell connection = new DBConnectionCell(url, user, password, timeOut);
                pool.put(connection);
                numOfConnectionCreated++;
            }
        } catch (Exception e) {
        }
        thread.start();
        end_time = System.currentTimeMillis();
    }

    public synchronized DBConnectionCell getConnection() {
        DBConnectionCell connectionWraper = null;
        if (pool.size() == 0 && numOfConnectionCreated < maxPoolSize) {
            connectionWraper = new DBConnectionCell(url, user, password, timeOut);
            try {
                pool.put(connectionWraper);
            } catch (InterruptedException e) {
                e.printStackTrace();
            }
            numOfConnectionCreated++;
        }
        try {
            connectionWraper = pool.take();
        } catch (InterruptedException e) {
            e.printStackTrace();
        }
        connectionWraper.setRelaxTime(System.currentTimeMillis());
        return connectionWraper;
    }


    /*Giải phóng 1 connect*/
    public void releaseConnection(DBConnectionCell conn) {
        try {
            if (conn.isClosed()) {
                pool.remove(conn);
                DBConnectionCell connection = new DBConnectionCell(url, user, password, timeOut);
                pool.put(connection);
            } else {
                pool.put(conn);
            }
        } catch (Exception e) {
        }
    }


    private void setSid(String sid) {
        this.sid = sid;
    }

    private void setTimeOut(int timeOut) {
        this.timeOut = timeOut;
    }

    private void setPassword(String password) {
        this.password = password;
    }

    private void setUser(String username) {
        this.user = username;
    }

    private void setUrl(String url) {
        this.url = url;
    }

    private void setMinPoolSize(int minPoolSize) {
        this.minPoolSize = this.minPoolSize;
    }

    private void setMaxPoolSize(int maxPoolSize) {
        this.maxPoolSize = maxPoolSize;
    }

    private void setInitPoolSize(int initPoolSize) {
        this.initPoolSize = initPoolSize;
    }

    @Override
    public String toString() {
        return "ConnectionPool{" +
                "pool=" + pool +
                ", max_pool_size=" + maxPoolSize +
                ", init_pool_size=" + initPoolSize +
                ", min_pool_size=" + minPoolSize +
                ", time_out=" + timeOut +
                ", url='" + url + '\'' +
                ", user='" + user + '\'' +
                ", password='" + password + '\'' +
                '}';
    }
}

package model.DAO;

import db.JDBIConnector;
import org.jdbi.v3.core.Jdbi;

public abstract class DAO {
    protected Jdbi connector;

    public DAO() {
        connector = JDBIConnector.get();
    }
}

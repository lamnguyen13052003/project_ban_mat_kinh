package model.DAO;

import model.bean.Model;
import model.service.ModelService;

import java.util.ArrayList;

public class ModelDAO extends DAO {
    private static ModelDAO instance;
    public static ModelDAO getInstance(){
        return instance == null ? new ModelDAO() : instance;
    }

    public ArrayList<Model> getModels(int productId) {
        return (ArrayList<Model>) connector.withHandle(handle ->
                handle.createQuery("SELECT m.urlIamge, m.name " +
                                "FROM models AS m " +
                                "WHERE m.productId = ?;")
                        .bind(0, productId)
                        .mapToBean(Model.class)
                        .list()
        );
    }
}

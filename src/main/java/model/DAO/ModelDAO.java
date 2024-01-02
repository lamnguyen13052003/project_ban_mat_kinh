package model.DAO;

import model.bean.Model;

import java.util.List;

public class ModelDAO extends DAO {
    private static ModelDAO instance;

    public static ModelDAO getInstance() {
        return instance == null ? new ModelDAO() : instance;
    }

    public List<Model> getModelsByProductId(int productId) {
        return connector.withHandle(handle ->
                handle.createQuery("SELECT m.id, m.urlImage, m.name, m.quantity, SUM(bd.quantity) AS totalQuantitySold " +
                                "FROM models AS m " +
                                "JOIN bill_details AS bd ON bd.modelId = m.id AND bd.productId = m.productId " +
                                "WHERE m.productId = :productId " +
                                "GROUP BY m.id, m.urlImage, m.name, m.quantity;")
                        .bind("productId", productId) // Bind giá trị cho :productId
                        .mapToBean(Model.class)
                        .list()
        );
    }

    public Model getModel(int modelId) {
        return connector.withHandle(handle ->
                handle.createQuery("SELECT m.id, m.urlImage, m.name, m.quantity, SUM(bd.quantity) AS totalQuantitySold " +
                                "FROM models AS m " +
                                "JOIN bill_details AS bd ON bd.modelId = m.id " +
                                "WHERE m.id = ?;")
                        .bind(0, modelId)
                        .mapToBean(Model.class)
                        .findFirst().orElse(null)
        );
    }
}

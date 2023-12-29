package model.service;

import model.DAO.ModelDAO;
import model.bean.Model;

import java.util.List;

public class ModelService {
    private static ModelService instance;

    public static ModelService getInstance() {
        return instance == null ? new ModelService() : instance;
    }

    public List<Model> getModelsByProductId(int productId) {
        List<Model> models = ModelDAO.getInstance().getModelsByProductId(productId);
        return models;
    }

    public Model getModel(int modelId) {
        return ModelDAO.getInstance().getModel(modelId);
    }
}

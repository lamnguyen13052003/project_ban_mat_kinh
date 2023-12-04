package model.service;

import model.DAO.ModelDAO;
import model.bean.Model;

import java.util.ArrayList;

public class ModelService {
    private static ModelService instance;
    public static ModelService getInstance(){
        return instance == null ? new ModelService() : instance;
    }

    public ArrayList<Model> getModels(int productId){
        return ModelDAO.getInstance().getModels(productId);
    }
}

package model.service;

import model.DAO.BillStatusDAO;
import model.bean.BillStatus;

public class BillStatusService {
    public void insert(BillStatus status) {
        BillStatusDAO billStatusDAO = new BillStatusDAO();
        billStatusDAO.insert(status);
    }
    public BillStatus getInfDateStatus(int billId){
        return new BillStatusDAO().getInfDateStatus(billId);
    }
}

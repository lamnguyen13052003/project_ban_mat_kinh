package model.DAO;

import model.DAO.DAO;
import model.bean.Bill;
import model.service.BillDetailService;

import java.util.List;

public class BillDAO extends DAO {
    public int insert(Bill bill) {
        int transfer = bill.isTransfer() ? 1 : 0;
        int billId = getNextId();
        connector.withHandle(handle ->
                handle.createUpdate("INSERT INTO bills(id, userId, userName, email, phoneNumber, codeProvince, codeDistrict, codeWard, address, transportFee, transfer) " +
                                "VALUES(?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)")
                        .bind(0, billId)
                        .bind(1, bill.getUserId())
                        .bind(2, bill.getUserName())
                        .bind(3, bill.getEmail())
                        .bind(4, bill.getPhoneNumber())
                        .bind(5, bill.getCodeProvince())
                        .bind(6, bill.getCodeDistrict())
                        .bind(7, bill.getCodeWard())
                        .bind(8, bill.getAddress())
                        .bind(9, bill.getTransportFee())
                        .bind(10, transfer)
                        .execute()
        );

        return billId;
    }

    public int getNextId() {
        return connector.withHandle(handle -> handle.createQuery("SELECT MAX(b.id) " +
                        "FROM bills as b;")
                .mapTo(Integer.class)
                .findFirst().orElse(1)
        ) + 1;
    }
    /*
    lay id va thong tin user
     */
    public List<Bill> getInfIdAndUser(){
        List<Bill> bills = connector.withHandle(handle ->
                handle.createQuery("SELECT b.id, b.userId, b.userName, b.email, b.transfer FROM bills b").mapToBean(Bill.class).list());
        return bills;
    }
}

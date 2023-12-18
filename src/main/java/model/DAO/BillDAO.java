package model.DAO;

import model.DAO.DAO;
import model.bean.Bill;
import model.service.BillDetailService;

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

    public boolean bought(int userId, int productId, int modelId) {
        int count = connector.withHandle(handle -> handle.createQuery("SELECT COUNT(bd.id) " +
                        "FROM bills AS b " +
                        "JOIN bill_details AS bd ON bd.billId = b.id " +
                        "WHERE " +
                        "b.userId = ? AND bd.productId = ? AND bd.modelId = ?")
                .bind(0, userId)
                .bind(1, productId)
                .bind(2, modelId)
                .mapTo(Integer.class)
                .findFirst().orElse(0)
        );

        return count != 0;
    }
}

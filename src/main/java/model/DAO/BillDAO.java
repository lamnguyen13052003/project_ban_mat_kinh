package model.DAO;

import model.bean.Bill;
import model.service.BillService;

import java.util.List;

public class BillDAO extends DAO {
    private static BillDAO dao;

    public static BillDAO getInstance() {
        return (dao = dao == null ? new BillDAO() : dao);
    }

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

    public List<Bill> getBillsByUserId(int userId, String status) {
        return connector.withHandle(handle ->
                handle.createQuery("SELECT b.id, b.userId, b.userName, b.email, b.transfer " +
                                "FROM bills AS b " +
                                "JOIN bill_statuses AS bs ON bs.billId = b.id " +
                                "WHERE bs.id in (SELECT MAX(bs2.id) FROM bill_statuses AS bs2 WHERE bs2.billId = b.id) " +
                                "AND bs.`status` LIKE :status " +
                                "AND b.userId = :userId;")
                        .bind("status", "%" + status + "%")
                        .bind("userId", userId)
                        .mapToBean(Bill.class)
                        .list());
    }

    public Bill getBill(int billId) {
        return connector.withHandle(handle ->
                handle.createQuery("SELECT b.id, b.userId, b.userName, b.email, b.address, b.phoneNumber, b.transfer, b.transportFee, b.codeProvince, b.codeDistrict, b.codeWard " +
                                "FROM bills AS b " +
                                "WHERE b.id = :id;")
                        .bind("id", billId)
                        .mapToBean(Bill.class)
                        .findFirst().orElse(null));
    }

    public boolean updateContact(Bill bill) {
        return connector.withHandle(handle ->
                handle.createUpdate("UPDATE bills SET "
                                + "userName = :userName, "
                                + "email = :email, "
                                + "phoneNumber = :phoneNumber, "
                                + "address = :address, "
                                + "codeProvince = :codeProvince, "
                                + "codeDistrict = :codeDistrict, "
                                + "codeWard = :codeWard "
                                + "WHERE id = :billId;"
                        )
                        .bind("userName", bill.getUserName())
                        .bind("email", bill.getEmail())
                        .bind("phoneNumber", bill.getPhoneNumber())
                        .bind("address", bill.getAddress())
                        .bind("codeProvince", bill.getCodeProvince())
                        .bind("codeDistrict", bill.getCodeDistrict())
                        .bind("codeWard", bill.getCodeWard())
                        .bind("billId", bill.getId())
                        .execute()) == 1 ? true : false;
    }
}

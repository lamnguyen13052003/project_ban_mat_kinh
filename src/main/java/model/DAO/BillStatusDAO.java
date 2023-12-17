package model.DAO;

import model.bean.BillStatus;

public class BillStatusDAO extends DAO {
    public void insert(BillStatus status) {
        connector.withHandle(handle ->
                handle.createUpdate("INSERT INTO bill_statuses(billId, `date`, `status`, `describe`, canEdit) VALUES (?, ?, ?, ?, ?)")
                        .bind(0, status.getBillId())
                        .bind(1, status.getDate())
                        .bind(2, status.getStatus())
                        .bind(3, status.getDescribe())
                        .bind(4, 0)
                        .execute());
    }
}

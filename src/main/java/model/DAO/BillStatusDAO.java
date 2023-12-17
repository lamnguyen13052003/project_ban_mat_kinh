package model.DAO;

import model.bean.BillStatus;

import java.util.List;

public class BillStatusDAO extends DAO{
    /*
    lay thong in trang thai
     */
    public List<BillStatus> getInfStatus(int billId){
        List<BillStatus> result = connector.withHandle(handle ->
        handle.createQuery("SELECT bs.status, bs.date FROM bill_statuses bs WHERE bs.billId = :billId")
                .bind("billId", billId)
                .mapToBean(BillStatus.class).list()
        );
        return result;
    }
    public BillStatus getInfDateStatus(int billId){
        return connector.withHandle(handle ->
                handle.createQuery("SELECT bs.id, bs.billId, bs.status, bs.date FROM bill_statuses bs WHERE bs.billId = ?")
                        .bind(0, billId)
                        .mapToBean(BillStatus.class).findFirst().orElse(null)
        );
    }
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

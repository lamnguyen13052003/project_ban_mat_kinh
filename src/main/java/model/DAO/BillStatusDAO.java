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
}

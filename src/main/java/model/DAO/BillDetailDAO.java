package model.DAO;

import model.bean.BillDetail;
import model.bean.Product;
import model.service.BillDetailService;
import model.service.ModelService;
import org.jdbi.v3.core.Handle;
import org.jdbi.v3.core.statement.Query;
import org.jdbi.v3.core.statement.Update;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class BillDetailDAO extends DAO {
    private static BillDetailDAO instance;

    public static BillDetailDAO getInstance() {
        return instance == null ? new BillDetailDAO() : instance;
    }

    public Map<Integer, Integer> getTotalQuantitySold(List<Product> products) {
        Map<Integer, Integer> result = new HashMap<>();
        for (Product product : products) {
            int id = product.getId();
            Integer totalQuantitySold = connector.withHandle(handle ->
                    handle.createQuery("SELECT sum(bd.quantity) " +
                                    "FROM bill_details AS bd " +
                                    "WHERE bd.productId = ?;")
                            .bind(0, id)
                            .mapTo(Integer.class)
                            .findFirst().orElse(0)
            );

            result.put(id, totalQuantitySold);
        }

        return result;
    }

    public void insert(int id, List<BillDetail> details) {
        Handle handle = connector.open();
        Update update = handle.createUpdate("INSERT INTO bill_details(billId, productId, modelId, quantity, price) " +
                "VALUES(?, ?, ?, ?, ?);");
        for (BillDetail detail : details) {
            update.bind(0, id)
                    .bind(1, detail.getProductId())
                    .bind(2, detail.getModelId())
                    .bind(3, detail.getQuantity())
                    .bind(4, detail.getPrice())
                    .execute();
        }
        update.close();
        handle.close();
    }

//    public boolean checkQuantity(ArrayList<BillDetail> details) {
//        for (BillDetail detail : details) {
//            int quantity = 0, totalSale = 0;
//            ModelService modelService = ModelService.getInstance();
//            BillDetailService billDetailService = new BillDetailService();
//            quantity = modelService.getQuantity(detail.getModelId());
//            totalSale = billDetailService.getTotalSale(detail.getModelId());
//            if((quantity - totalSale - detail.getQuantity()) < 0) return false;
//        }
//        return true;
//    }

    public int getTotalSale(Integer billId) {
        return connector.withHandle(handle ->
                handle.createQuery("SELECT SUM(bd.quantity) AS sum_quantity\n" +
                                "FROM bill_details AS bd\n" +
                                "WHERE bd.modelId = ?")
                        .bind(0, billId)
                        .mapTo(Integer.class)
                        .findFirst().orElse(0)
        );
    }
}

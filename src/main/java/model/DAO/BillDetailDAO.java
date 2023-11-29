package model.DAO;

import model.bean.Product;

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
                    handle.createQuery("SELECT count(bd.id) " +
                                    "FROM bill_details AS bd " +
                                    "WHERE bd.productId = ?;")
                            .bind(0, id)
                            .mapTo(Integer.class)
                            .findFirst().orElse(null)
            );

            result.put(id, totalQuantitySold);
        }

        return result;
    }
}

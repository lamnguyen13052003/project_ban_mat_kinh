package model.DAO;

import model.bean.Product;

import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

public class ProductDiscountDAO extends DAO{
    private static ProductDiscountDAO instance;
    public static ProductDiscountDAO getInstance() {
        return instance == null ? new ProductDiscountDAO() : instance;
    }

    public Map<Integer, Double> getPricePercentages(List<Product> products){
        Map<Integer, Double> result = new LinkedHashMap<Integer, Double>();
        List<Double> pricePercentages;
        double pricePercentage;
        for(Product product : products){
            int id = product.getId();
            pricePercentages = connector.withHandle(handle ->
                    handle.createQuery("SELECT pd.pricePercentage " +
                                           "FROM product_discounts AS pd " +
                                           "WHERE " +
                                           "pd.productId = ?;")
                            .bind(0, id)
                            .mapTo(Double.class)
                            .list()
                    );

            pricePercentage = pricePercentages.isEmpty() ? 0 : pricePercentages.get(0);
            result.put(id, pricePercentage);
        }
        return result;
    }
}

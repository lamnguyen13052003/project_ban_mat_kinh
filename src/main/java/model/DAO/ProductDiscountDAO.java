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

    /*
    get Map<productId, pricePercentage>
    @param List<Product> products
    @return Map<Integer, Double>
     */
    public Map<Integer, Double> getPricePercentages(List<Product> products){
        Map<Integer, Double> result = new LinkedHashMap<Integer, Double>();
        double pricePercentage;
        for(Product product : products){
            int id = product.getId();
            pricePercentage = connector.withHandle(handle ->
                    handle.createQuery("SELECT pd.pricePercentage " +
                                           "FROM product_discounts AS pd " +
                                           "WHERE " +
                                           "pd.productId = ?;")
                            .bind(0, id)
                            .mapTo(Double.class)
                            .findFirst()
                            .orElse(0.0)
                    );

            result.put(id, pricePercentage);
        }
        return result;
    }
}

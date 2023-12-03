package model.DAO;

import model.bean.Product;
import model.bean.Review;
import org.jdbi.v3.core.Handle;
import org.jdbi.v3.core.statement.Query;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.StringTokenizer;

public class ProductDAO extends DAO {
    private final String WHERE_NOT_JOIN = " WHERE p.categoryId = ? ";
    private final String WHERE_JOIN_1 = " WHERE CURRENT_TIMESTAMP() BETWEEN pd.dateStart AND pd.dateEnd ";
    private final String WHERE_JOIN_2 = " WHERE c.categoryGroupId = ? ";
    private final String JOIN_1 = " JOIN product_discounts AS pd ON pd.productId = p.id ";
    private final String JOIN_2 = " JOIN categories AS c ON c.id = p.categoryId ";
    private final String LIMIT_OFFSET = " LIMIT ? OFFSET ? ";
    private final Map<String, String> MAP_SQL_SORT = new HashMap<>();
    private final Map<String, String> MAP_SQL_FILTER = new HashMap<>();
    private final int LIMIT = 20;
    private static ProductDAO instance;

    public ProductDAO() {
        initMapSQL();
    }

    private void initMapSQL() {
        if (MAP_SQL_SORT.isEmpty()) {
            MAP_SQL_SORT.put("sort-price", " price = ? ");
            MAP_SQL_SORT.put("sort-name", " name = ? ");
        }

        if (MAP_SQL_FILTER.isEmpty()) {
            MAP_SQL_FILTER.put("filter-brandName", " AND brandName IN ");
            MAP_SQL_FILTER.put("filter-material", " AND material IN ");
            MAP_SQL_FILTER.put("filter-type", " AND type IN ");
            MAP_SQL_FILTER.put("filter-price", " price BETWEEN ? AND ? OR ");
        }
    }

    public static ProductDAO getInstance() {
        return instance == null ? new ProductDAO() : instance;
    }

    public List<Product> getProducts(Map<String, Integer> mapInfRoot, Map<String, List<String>> mapFilter, Map<String, String> mapSort) {
        List<Product> result;
        String sql = initSQL(mapInfRoot, mapFilter, mapSort), name;
        Handle handle = connector.open();
        Query query = handle.createQuery(sql);
        setValuesQuery(query, mapInfRoot, mapFilter, mapSort);
        result = query.mapToBean(Product.class).list();

        query.close();
        handle.close();

        return result;
    }

    private String initSQL(Map<String, Integer> infRoot, Map<String, List<String>> mapFilter, Map<String, String> mapSort) {
        int idCategoryGroup = infRoot.get("id-category-group");
        int idCategory = infRoot.get("id-category");
        StringBuilder sql = new StringBuilder("SELECT p.id, p.name, p.brandName, p.price, p.quantity FROM products AS p ");
        if (idCategoryGroup == 0) {
            sql.append(JOIN_1);
            sql.append(WHERE_JOIN_1);
        }

        if (idCategoryGroup != 0 && idCategory == 0) {
            sql.append(JOIN_2);
            sql.append(WHERE_JOIN_2);
        }

        if (idCategoryGroup != 0 && idCategory != 0) {
            sql.append(WHERE_NOT_JOIN);
        }

        sql.append(getSQLFilter(mapFilter));
        sql.append(getSQLSort(mapSort));
        sql.append(LIMIT_OFFSET);
        return sql.toString();
    }

    private void setValuesQuery(Query query, Map<String, Integer> mapInfRoot, Map<String, List<String>> mapFilter, Map<String, String> mapSort) {
        String name;
        StringTokenizer tk;
        int begin, end, index = 0,
                idCategoryGroup = mapInfRoot.get("id-category-group"),
                idCategory = mapInfRoot.get("id-category"),
                page = mapInfRoot.get("page"),
                offset = (page - 1) * 20;

        if (idCategoryGroup == 0) {
            System.out.println("Khuyen mai");
        }

        if (idCategoryGroup != 0 && idCategory == 0) {
            System.out.println("Nhom danh muc");
            query.bind(index++, idCategoryGroup);
        }

        if (idCategoryGroup != 0 && idCategory != 0) {
            System.out.println("Danh muc");
            query.bind(index++, idCategory);
        }

        for (Map.Entry<String, List<String>> entry : mapFilter.entrySet()) {
            name = entry.getKey();
            List<String> values = entry.getValue();
            if (name.equals("filter-price")) {
                for (String value : values) {
                    tk = new StringTokenizer(value, "-");
                    begin = Integer.parseInt(tk.nextToken());
                    end = Integer.parseInt(tk.nextToken());
                    query.bind(index++, begin);
                    query.bind(index++, end);
                }
            } else {
                for (String value : values) {
                    query.bind(index++, value);
                }
            }
        }

        for (Map.Entry<String, String> entry : mapSort.entrySet()) {
            query.bind(index++, entry.getValue());
        }


        query.bind(index++, LIMIT);
        query.bind(index++, offset);
        System.out.println(query.toString());
    }

    private String getSQLFilter(Map<String, List<String>> mapFilter) {
        StringBuilder sql = new StringBuilder();
        if (mapFilter.isEmpty()) return sql.toString();

        for (Map.Entry<String, List<String>> entry : mapFilter.entrySet()) {
            String name = entry.getKey();
            if (name.equals("filter-price")) {
                sql.append(" AND ");
                for (String value : entry.getValue()) {
                    sql.append(MAP_SQL_FILTER.get(name));
                }

                /*Xóa chữ OR cuối*/
                sql.delete(sql.length() - 3, sql.length());
            } else {
                sql.append(MAP_SQL_FILTER.get(name));
                sql.append("(");
                for (String value : entry.getValue()) {
                    sql.append("?, ");
                }
                sql.delete(sql.length() - 2, sql.length());
                sql.append(")");
            }
        }

        return sql.toString();
    }

    private String getSQLSort(Map<String, String> mapSort) {
        StringBuilder sql = new StringBuilder();
        if (mapSort.isEmpty()) return sql.toString();

        sql.append(" ORDER BY ");
        for (Map.Entry<String, String> entry : mapSort.entrySet()) {
            String name = entry.getKey();
            sql.append(MAP_SQL_SORT.get(name));
        }

        return sql.toString();
    }

    public List<Product> getProductByIdCategoryForPage(int idCategory, int page) {
        int offset = (page - 1) * 20;
        List<Product> products = connector.withHandle(handle ->
                handle.createQuery("SELECT p.id, p.name, p.brandName, p.price, p.material, p.`type`, p.quantity " +
                                "FROM products AS p " +
                                "WHERE p.categoryId = ? LIMIT ? OFFSET ?")
                        .bind(0, idCategory)
                        .bind(1, LIMIT)
                        .bind(2, offset)
                        .mapToBean(Product.class)
                        .list()
        );

        return products;
    }

    public List<Product> getProductDiscountForPage(int page) {
        int offset = (page - 1) * 20;
        List<Product> products = connector.withHandle(handle ->
                handle.createQuery("SELECT p.id, p.name, p.brandName, p.price, p.material, p.`type`, p.quantity " +
                                "FROM products AS p " +
                                "JOIN product_discounts AS pd ON pd.productId = p.id " +
                                "WHERE CURRENT_TIMESTAMP() BETWEEN pd.dateStart AND pd.dateEnd " +
                                "LIMIT ? OFFSET ?")
                        .bind(0, LIMIT)
                        .bind(1, offset)
                        .mapToBean(Product.class)
                        .list()
        );

        return products;
    }

    public List<Product> getProductByIdCategoryGroupForPage(int idCategoryGroup, int page) {
        int offset = (page - 1) * 20;
        List<Product> products = connector.withHandle(handle ->
                handle.createQuery("SELECT p.id, p.name, p.brandName, p.price, p.material, p.`type`, p.quantity " +
                                "FROM products AS p " +
                                "JOIN categories AS c ON c.id = p.categoryId " +
                                "WHERE c.categoryGroupId = ? " +
                                "LIMIT ? OFFSET ?")
                        .bind(0, idCategoryGroup)
                        .bind(1, LIMIT)
                        .bind(2, offset)
                        .mapToBean(Product.class)
                        .list()
        );

        return products;
    }

    public void hasNextPage(String request, int page) {

    }

    public void hasPrevPage(String request, int page) {
        StringTokenizer tokenizer = new StringTokenizer(request, "&");
    }

    /*
    lay danh sach hinh anh noi bat tren trang chu
    dk: sap xep theo so sao
     */
    public List<Product> getImageByProminentStart(){
        List<Product> products = connector.withHandle(handle ->
            handle.createQuery("SELECT p.id, p.name, p.brandName, p.price FROM products p")
                    .mapToBean(Product.class).list()
        );
        return products;

    }
}

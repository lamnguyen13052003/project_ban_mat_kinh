package model.service;

import model.DAO.BillDAO;
import model.bean.Bill;
import model.bean.BillDetail;
import model.bean.BillStatus;
import model.bean.ProductCart;
import org.json.JSONObject;

import java.text.NumberFormat;
import java.time.LocalDateTime;
import java.util.HashMap;
import java.util.Locale;
import java.util.Map;

public class BillService {
    private Map<String, ProductCart> products;

    public BillService() {
        products = new HashMap<>();
    }

    public double getTotalBill() {
        double total = 0;
        for (ProductCart product : products.values()) {
            total += product.getPrice() * product.getQuantity();
        }

        return total;
    }

    public double getTotalPriceReduced() {
        double total = 0;
        for (ProductCart product : products.values()) {
            total += product.totalPrice();
        }

        return getTotalBill() - total;
    }

    public void put(String key, ProductCart value) {
        this.products.put(key, value);
    }

    public void remove(String key) {
        this.products.remove(key);
    }

    public void setUpJSON(JSONObject json) {
        NumberFormat nf = NumberFormat.getCurrencyInstance(Locale.of("vi", "VN"));
        double totalBill = this.getTotalBill();
        double totalPriceReduced = this.getTotalPriceReduced();
        double shippingFee = Double.compare(totalBill, 0) == 0 ? 0 : 20000;
        json.put("totalBill", nf.format(totalBill));
        json.put("totalPriceReduced", nf.format(totalPriceReduced));
        json.put("shippingFee", nf.format(shippingFee));
        json.put("totalPay", nf.format(totalBill - totalPriceReduced + shippingFee));
    }

    @Override
    public String toString() {
        return "BillService{" +
                "products=" + products +
                '}';
    }

    public Bill getBill() {
        Bill result = new Bill();
        for (ProductCart product : products.values()) {
            BillDetail billDetail = new BillDetail(product.getProduct().getId(), product.getModel().getId(), product.getQuantity(), product.getPrice());
            if (product.getProduct().hasDiscount()) billDetail.setPrice(product.getRducedPrice());
            result.addDetail(billDetail);
        }
        return result;
    }

    public boolean saveBill(Bill bill) {
        BillDAO billDAO = new BillDAO();
        BillDetailService billDetailService = new BillDetailService();
        ReviewService reviewService = new ReviewService();
        BillStatusService billStatusService = new BillStatusService();
        int id = 0;
//        boolean check = billDetailService.checkQuantity(bill);
        boolean check = true;
        if (check) {
            id = billDAO.insert(bill);
            billDetailService.insert(id, bill.getDetails());
            bill.setId(id);
            BillStatus status = new BillStatus(id, 1, "Đã xác nhận đơn hàng của bạn", true);
            bill.addStatus(status);
            billStatusService.insert(status);
        }
        return check;
    }

    public boolean bought(int userId, int productId, int modelId) {
        return  new BillDAO().bought(userId, productId, modelId);
    }
}

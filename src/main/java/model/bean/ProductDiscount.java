package model.bean;

import java.time.LocalDateTime;
import java.util.StringTokenizer;

public class ProductDiscount {
    private Integer productId;
    private Double pricePercentage;

    private LocalDateTime dateStart, dateEnd;

    public ProductDiscount(String productDiscountStr) {
        StringTokenizer tk = new StringTokenizer(productDiscountStr, ",");
        try{
            this.pricePercentage = Double.parseDouble(tk.nextToken());
            this.setDateStart(tk.nextToken());
            this.setDateEnd(tk.nextToken());
        }catch (NumberFormatException e){
            System.out.println(e);
        }
    }

    public Integer getProductId() {
        return productId;
    }

    public Double getPricePercentage() {
        return pricePercentage;
    }

    public void setProductId(Integer productId) {
        this.productId = productId;
    }

    public void setPricePercentage(Double pricePercentage) {
        this.pricePercentage = pricePercentage;
    }

    public LocalDateTime getDateStart() {
        return dateStart;
    }

    public void setDateStart(String dataStr) {
        StringTokenizer tk = new StringTokenizer(dataStr, "-");
        this.dateStart = LocalDateTime.of(Integer.parseInt(tk.nextToken()), Integer.parseInt(tk.nextToken()), Integer.parseInt(tk.nextToken()), 0, 0, 0);
    }

    public LocalDateTime getDateEnd() {
        return dateEnd;
    }

    public void setDateEnd(String dataStr) {
        StringTokenizer tk = new StringTokenizer(dataStr, "-");
        this.dateEnd = LocalDateTime.of(Integer.parseInt(tk.nextToken()), Integer.parseInt(tk.nextToken()), Integer.parseInt(tk.nextToken()), 0, 0, 0);
    }

    @Override
    public String toString() {
        return "ProductDiscount{" +
                "productId=" + productId +
                ", pricePercentage=" + pricePercentage +
                ", dateStart=" + dateStart +
                ", dateEnd=" + dateEnd +
                '}';
    }
}


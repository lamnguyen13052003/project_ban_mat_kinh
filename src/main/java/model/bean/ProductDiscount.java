package model.bean;

import lombok.Getter;
import lombok.Setter;

import java.time.LocalDateTime;
import java.util.StringTokenizer;

public class ProductDiscount {
    @Getter
    @Setter
    private Integer productId, id;
    @Getter
    @Setter
    private Double pricePercentage;

    @Getter
    @Setter
    private LocalDateTime dateStart, dateEnd;

    public ProductDiscount(String productDiscountStr) {
        StringTokenizer tk = new StringTokenizer(productDiscountStr, ",");
        try {
            this.pricePercentage = Double.parseDouble(tk.nextToken());
            this.parseDateStart(tk.nextToken());
            this.parseDateEnd(tk.nextToken());
        } catch (NumberFormatException e) {
            System.out.println(e);
        }
    }

    public ProductDiscount() {
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

    public void parseDateStart(String dataStr) {
        StringTokenizer tk = new StringTokenizer(dataStr, "-");
        this.dateStart = LocalDateTime.of(Integer.parseInt(tk.nextToken()), Integer.parseInt(tk.nextToken()), Integer.parseInt(tk.nextToken()), 0, 0, 0);
    }

    public LocalDateTime getDateEnd() {
        return dateEnd;
    }

    public void parseDateEnd(String dataStr) {
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


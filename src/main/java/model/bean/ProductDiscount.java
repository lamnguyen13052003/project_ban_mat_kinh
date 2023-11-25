package model.bean;

public class ProductDiscount {
    private Integer productId;
    private Double pricePercentage;

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
}


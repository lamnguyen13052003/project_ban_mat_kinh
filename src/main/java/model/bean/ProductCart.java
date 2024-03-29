package model.bean;

public class ProductCart {
    private Integer productId;
    private String name, brandName, describe, categoryName;
    private Double price, discount;
    private Model model;
    private Integer quantity;

    public ProductCart() {
    }

    public ProductCart(Integer id, String name, String brandName, String describe, String categoryName, Double price, Double discount, Model model, Integer quantity) {
        this.productId = id;
        this.name = name;
        this.brandName = brandName;
        this.describe = describe;
        this.categoryName = categoryName;
        this.price = price;
        this.discount = discount;
        this.model = model;
        this.quantity = quantity;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    public boolean increase(int quantity) {
        if ((this.quantity + quantity) > (model.getQuantity() - model.getTotalQuantitySold())) {
            return false;
        }
        this.quantity += quantity;
        return true;
    }

    public boolean reduce(int quantity) {
        if (this.quantity - quantity < 1) {
            return false;
        }
        this.quantity -= quantity;
        return true;
    }

    public boolean hasDiscount() {
        return Double.compare(this.discount, 0) != 0;
    }

    public Integer getProductId() {
        return productId;
    }

    public void setProductId(Integer productId) {
        this.productId = productId;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getBrandName() {
        return brandName;
    }

    public void setBrandName(String brandName) {
        this.brandName = brandName;
    }

    public String getDescribe() {
        return describe;
    }

    public void setDescribe(String describe) {
        this.describe = describe;
    }

    public String getCategoryName() {
        return categoryName;
    }

    public void setCategoryName(String categoryName) {
        this.categoryName = categoryName;
    }

    public Double getPrice() {
        return price;
    }

    public void setPrice(Double price) {
        this.price = price;
    }

    public Double getDiscount() {
        return discount;
    }

    public void setDiscount(Double discount) {
        this.discount = discount;
    }

    public Model getModel() {
        return model;
    }

    public void setModel(Model model) {
        this.model = model;
    }

    public void setQuantity(Integer quantity) {
        this.quantity = quantity;
    }

    public double totalPrice() {
        if (hasDiscount())
            return this.discount * this.quantity;
        else
            return this.price * this.quantity;
    }
}

package model.bean;

public class ProductCart {
    private Product product;
    private int quantity;

    public ProductCart() {
    }

    public ProductCart(Product product, int quantity) {
        this.product = product;
        this.quantity = quantity;
    }

    public Product getProduct() {
        return product;
    }

    public void setProduct(Product product) {
        this.product = product;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    public boolean increase(int quantity) {
        if (this.quantity + quantity > product.getQuantity()) {
            return false;
        }
        this.quantity += quantity;
        return true;
    }

    public boolean reduce(int quantity) {
        if (this.quantity - quantity < 0) {
            return false;
        }
        this.quantity -= quantity;
        return true;
    }
}

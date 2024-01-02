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
        if (this.quantity + quantity > product.getModels().get(0).getQuantity()) {
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

    public double getPrice() {
        return this.product.getPrice();
    }

    public double getRducedPrice() {
        return this.product.getDiscount();
    }

    public boolean hasDiscount() {
        return this.product.hasDiscount();
    }

    public Model getModel() {
        return this.product.getModels().get(0);
    }

    @Override
    public String toString() {
        return "ProductCart{" +
                "product=" + product +
                ", quantity=" + quantity +
                '}';
    }

    public double totalPrice() {
        if (hasDiscount())
            return this.getRducedPrice() * this.quantity;
        else
            return this.getPrice() * this.quantity;
    }
}

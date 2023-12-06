package model.service;

import model.bean.Cart;
import model.bean.Product;
import model.bean.ProductCart;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class CartService {
    private Cart cart;

    public CartService(Cart cart) {
        this.cart = cart;
    }

    public CartService() {
        cart = new Cart();
    }

    public Cart getCart() {
        return cart;
    }

    public void setCart(Cart cart) {
        this.cart = cart;
    }

    public List<ProductCart> getAllProductCart() {
        return cart.getAllProductCart();
    }

    public boolean addProductCart(int productId, int modelId, int quantity) {
        return cart.addProduct(productId, modelId, quantity);
    }

    public void removeProductCart(int productId, int modelId) {
        cart.removeProduct(productId, modelId);
    }

    public boolean increaseProductCart(int productId, int modelId, int quantity) {
        return cart.increase(productId, modelId, quantity);
    }

    public boolean reduceProductCart(int productId, int modelId, int quantity) {
        return cart.reduce(productId, modelId, quantity);
    }

    public int getTotalProduct() {
        return cart.totalProductCart();
    }
}

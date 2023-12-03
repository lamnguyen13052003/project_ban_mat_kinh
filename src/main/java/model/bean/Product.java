package model.bean;

import java.util.ArrayList;

public class Product {
    private Integer id, categoryId, quantity, starNumber, totalReview, totalQuantitySold;
    private String name, brandName, describe, material, type, categoryName;
    private Double price, discount;
    private ArrayList<Model> models;
    private ArrayList<String> productImages;
    private ArrayList<String> describeImages;

    public Product() {
    }

    public int getCategoryId() {
        return categoryId;
    }

    public void setCategoryId(int categoryId) {
        this.categoryId = categoryId;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    public ArrayList<Model> getModels() {
        return models;
    }

    public void setModels(ArrayList<Model> models) {
        this.models = models;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public void setCategoryId(Integer categoryId) {
        this.categoryId = categoryId;
    }

    public void setQuantity(Integer quantity) {
        this.quantity = quantity;
    }

    public void setPrice(double price) {
        this.price = price;
    }

    public void setProductImages(ArrayList<String> productImages) {
        this.productImages = productImages;
    }

    public double getDiscount() {
        return discount;
    }

    public void setDiscount(double discount) {
        this.discount = discount;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
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

    public String getMaterial() {
        return material;
    }

    public void setMaterial(String material) {
        this.material = material;
    }

    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type;
    }

    public double getPrice() {
        return price;
    }

    public Integer getStarNumber() {
        return starNumber;
    }

    public void setStarNumber(Integer starNumber) {
        this.starNumber = starNumber;
    }

    public boolean hasDiscount() {
        return Double.compare(this.discount, 0) != 0;
    }

    public Integer getTotalReview() {
        return totalReview;
    }

    public void setTotalReview(Integer totalReview) {
        this.totalReview = totalReview;
    }

    public ArrayList<String> getProductImages() {
        return productImages;
    }

    public Integer getTotalQuantitySold() {
        return totalQuantitySold;
    }

    public void setTotalQuantitySold(Integer totalQuantitySold) {
        this.totalQuantitySold = totalQuantitySold;
    }

    public String getCategoryName() {
        return categoryName;
    }

    public void setCategoryName(String categoryName) {
        this.categoryName = categoryName;
    }

    public void setPrice(Double price) {
        this.price = price;
    }

    public void setDiscount(Double discount) {
        this.discount = discount;
    }

    public ArrayList<String> getDescribeImages() {
        return describeImages;
    }

    public void setDescribeImages(ArrayList<String> describeImages) {
        this.describeImages = describeImages;
    }

    public boolean available() {
        return (quantity - totalQuantitySold) > 0;
    }

    @Override
    public String toString() {
        return "Product{" +
                "id=" + id +
                ", categoryId=" + categoryId +
                ", quantity=" + quantity +
                ", starNumber=" + starNumber +
                ", totalReview=" + totalReview +
                ", totalQuantitySold=" + totalQuantitySold +
                ", name='" + name + '\'' +
                ", brandName='" + brandName + '\'' +
                ", describe='" + describe + '\'' +
                ", material='" + material + '\'' +
                ", type='" + type + '\'' +
                ", categoryName='" + categoryName + '\'' +
                ", price=" + price +
                ", discount=" + discount +
                ", models=" + models +
                ", images=" + productImages +
                '}';
    }
}

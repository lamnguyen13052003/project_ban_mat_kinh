package model.bean;

import java.util.ArrayList;

public class Product {
    private Integer id, categoryId, quantity;
    private String name, brandName, describe, material, type;
    private Double price, discount;

    private ArrayList<Model> models;
    private ArrayList<String> images;

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

    public void addImage(String image) {
        if(images == null) images =  new ArrayList<>();

        images.add(image);
    }

    public void addModel(Model model) {
        if(models == null) models =  new ArrayList<>();

        models.add(model);
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

    public void setPrice(double price) {
        this.price = price;
    }

    @Override
    public String toString() {
        return "Product{" +
                "id=" + id +
                ", categoryId=" + categoryId +
                ", quantity=" + quantity +
                ", name='" + name + '\'' +
                ", brandName='" + brandName + '\'' +
                ", describe='" + describe + '\'' +
                ", material='" + material + '\'' +
                ", type='" + type + '\'' +
                ", price=" + price +
                ", discount=" + discount +
                ", models=" + models +
                ", images=" + images +
                '}';
    }
}

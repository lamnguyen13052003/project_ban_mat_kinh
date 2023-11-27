package model.bean;

import java.util.ArrayList;

public class Product {
    private Integer id, categoryId, quantity, starNumber;
    private String name, brandName, describe, material, type;
    private Integer price, discount;
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

    public void setId(Integer id) {
        this.id = id;
    }

    public void setCategoryId(Integer categoryId) {
        this.categoryId = categoryId;
    }

    public void setQuantity(Integer quantity) {
        this.quantity = quantity;
    }

    public void setPrice(Integer price) {
        this.price = price;
    }

    public void setDiscount(int discount) {
        this.discount = discount;
    }

    public void setImages(ArrayList<String> images) {
        this.images = images;
    }

    public int getDiscount() {
        return discount;
    }

    public void setDiscount(Integer discount) {
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

    public Integer getPrice() {
        return price;
    }

    public void setPrice(int price) {
        this.price = price;
    }

    public Integer getStarNumber() {
        return starNumber;
    }

    public void setStarNumber(Integer starNumber) {
        this.starNumber = starNumber;
    }

    public boolean hasDiscount(){
        return Double.compare(this.discount, 0) != 0;
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

    public static String formatNumber(int number){
        String strN = Integer.toString((int)number);

        // Tạo một StringBuilder để xây dựng chuỗi kết quả
        StringBuilder result = new StringBuilder();

        // Tạo một vòng lặp để chia chuỗi thành các đoạn có độ dài 3 ký tự từ phải sang trái
        int length = strN.length();
        for (int i = length - 1; i >= 0; i--) {
            result.insert(0, strN.charAt(i)); // Chèn ký tự vào đầu chuỗi kết quả

            // Thêm dấu chấm sau mỗi 3 ký tự nếu đủ 3 ký tự và không phải là ký tự cuối cùng
            if ((length - i) % 3 == 0 && i != 0) {
                result.insert(0, '.');
            }
        }

        return result.toString();
    }

    public boolean equalsId(Integer key) {
        return id == key;
    }
}

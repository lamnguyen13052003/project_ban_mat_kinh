package model.bean;

import java.util.ArrayList;
import java.util.List;
import java.util.Objects;

public class Product {
    private Integer id, categoryId, starNumber, totalReview, totalQuantitySold;
    private String name, brandName, describe, material, type, categoryName;
    private Double price, discount;
    private List<Model> models;
    private List<Review> reviews;
    private List<String> productImages;

    private List<ProductDiscount> productDiscounts;

    public Product() {
    }

    public int getCategoryId() {
        return categoryId;
    }

    public void setCategoryId(int categoryId) {
        this.categoryId = categoryId;
    }


    public List<Model> getModels() {
        return models;
    }

    public void setModels(List<Model> models) {
        this.models = models;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public void setCategoryId(Integer categoryId) {
        this.categoryId = categoryId;
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

    public List<String> getProductImages() {
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


    public List<Review> getReviews() {
        return reviews;
    }

    public void setReviews(List<Review> reviews) {
        this.reviews = reviews;
    }

    public boolean available() {
        for (Model model : models) {
            if (model.available()) return true;
        }
        return false;
    }

    public void setModel(Model model) {
        models = models == null ? new ArrayList<>() : models;
        models.add(model);
    }

    public void addProductImage(String url) {
        productImages = productImages == null ? new ArrayList<>() : productImages;
        productImages.add(url);
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;
        Product product = (Product) o;
        return Objects.equals(id, product.id) && Objects.equals(models, product.models);
    }

    @Override
    public int hashCode() {
        return Objects.hash(id, models);
    }

    public void setModels(String[] models) {
        for (String data : models) {
            Model model = new Model(this.id, data);
            setModel(model);
        }
    }

    public void setProductImages(String[] productImages) {
        for (String data : productImages) {
            this.addProductImage(data);
        }
    }

    @Override
    public String toString() {
        return "Product{" +
                "id=" + id +
                ", categoryId=" + categoryId +
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
                ", reviews=" + reviews +
                ", productImages=" + productImages +
                ", poroductDiscounts=" + productDiscounts +
                '}';
    }

    public void setProductDiscount(String[] parameterValues) {
        productDiscounts = new ArrayList<>();
        for(String productDiscountStr : parameterValues){
            ProductDiscount productDiscount = new ProductDiscount(productDiscountStr);
            productDiscounts.add(productDiscount);
        }
    }

    public List<ProductDiscount> getProductDiscounts() {
        return productDiscounts;
    }
}

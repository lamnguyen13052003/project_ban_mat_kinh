package model.bean;

public class ProductImage {
    private Integer id, productId;
    private String urlImage, type;

    public Integer getProductId() {
        return productId;
    }

    public void setProductId(Integer productId) {
        this.productId = productId;
    }

    public String getUrlImage() {
        return urlImage;
    }

    public void setUrlImage(String urlImage) {
        this.urlImage = urlImage;
    }

    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type;
    }

    @Override
    public String toString() {
        return "ProductImage{" +
                "productId=" + productId +
                ", urlImage='" + urlImage + '\'' +
                ", type='" + type + '\'' +
                '}';
    }
}

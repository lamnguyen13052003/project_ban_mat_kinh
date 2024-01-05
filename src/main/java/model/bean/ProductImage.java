package model.bean;

public class ProductImage {
    private Integer id, productId;
    private String urlImage;

    public ProductImage(Integer productId, String urlImage) {
        this.productId = productId;
        this.urlImage = urlImage;
    }

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


    @Override
    public String toString() {
        return "ProductImage{" +
                "productId=" + productId +
                ", urlImage='" + urlImage + '\'' +
                '}';
    }
}

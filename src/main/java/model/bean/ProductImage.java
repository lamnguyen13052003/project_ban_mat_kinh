package model.bean;

import lombok.Getter;
import lombok.Setter;

import java.util.StringTokenizer;

public class ProductImage {
    @Getter
    @Setter
    private Integer id, productId;
    @Getter
    @Setter
    private String urlImage;

    public ProductImage() {
    }

    public ProductImage(String data) {
        StringTokenizer tk = new StringTokenizer(data, ",");
        this.urlImage = data;
    }

    @Override
    public String toString() {
        return "ProductImage{" +
                "productId=" + productId +
                ", urlImage='" + urlImage + '\'' +
                '}';
    }
}

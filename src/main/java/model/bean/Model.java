package model.bean;

import java.util.Objects;

public class Model {
    private Integer id, idProduct;
    private String name, urlIamge;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Integer getIdProduct() {
        return idProduct;
    }

    public void setIdProduct(Integer idProduct) {
        this.idProduct = idProduct;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getUrlIamge() {
        return urlIamge;
    }

    public void setUrlIamge(String urlIamge) {
        this.urlIamge = urlIamge;
    }

    @Override
    public String toString() {
        return "Model{" +
                "id=" + id +
                ", idProduct=" + idProduct +
                ", name='" + name + '\'' +
                ", image='" + urlIamge + '\'' +
                '}';
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;
        Model model = (Model) o;
        return Objects.equals(id, model.id);
    }

    @Override
    public int hashCode() {
        return Objects.hash(id, idProduct, name, urlIamge);
    }
}

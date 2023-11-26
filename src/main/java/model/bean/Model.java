package model.bean;

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
}

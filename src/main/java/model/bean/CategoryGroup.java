package model.bean;

public class CategoryGroup {
    private Integer id;
    private String name;

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

    @Override
    public String toString() {
        return "CategoryGroup{" +
                "id=" + id +
                ", name='" + name + '\'' +
                '}';
    }
}

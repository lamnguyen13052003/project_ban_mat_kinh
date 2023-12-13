package model.DAO;

import model.bean.address.District;

import java.util.List;

public class DistrictDAO extends DAO{
    public List<District> getAllDistrict(int code){
        return connector.withHandle(handle ->
                handle.createQuery("SELECT d.code, d.fullName " +
                                "FROM districts AS d " +
                                "WHERE d.provinceCode = ?;")
                        .bind(0, code)
                        .mapToBean(District.class)
                        .list()
        );
    }
}

package model.service;

import model.DAO.DistrictDAO;
import model.DAO.ProvinceDAO;
import model.DAO.WardDAO;
import model.bean.address.District;
import model.bean.address.Province;
import model.bean.address.Ward;

import java.util.List;

public class AddressService {
    public List<Province> getAllProvider() {
        ProvinceDAO dao = new ProvinceDAO();
        return dao.getAllProvince();
    }

    public List<District> getAllDistrict(int code) {
        DistrictDAO dao = new DistrictDAO();
        return dao.getAllDistrict(code);
    }

    public List<Ward> getAllWard(int code) {
        WardDAO dao = new WardDAO();
        return dao.getAllWard(code);
    }
}

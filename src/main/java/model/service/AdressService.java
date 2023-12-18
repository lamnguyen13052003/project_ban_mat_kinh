package model.service;

import model.DAO.AdressDAO;
import model.bean.address.District;
import model.bean.address.Province;
import model.bean.address.Ward;

public class AdressService {
    public AdressService() {
    }
    public String getAddress(int provinceCode, int districtCode, int wardCode) {
        AdressDAO dao = new AdressDAO();
        Province province = dao.getProvince(provinceCode);
        District district = dao.getDistrict(districtCode, provinceCode);
        Ward ward = dao.getWard(wardCode, districtCode);
        return ward.getFullName() + " - " + district.getFullName() + " - " + province.getFullName();
    }
}

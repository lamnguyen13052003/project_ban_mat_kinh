package model.bean;

import java.util.ArrayList;
import java.util.TreeSet;

public class Bill {
    private Integer id, userId;
    private String userName, phoneNumber, address;
    private Boolean transfer;
    private Double transportFee;

    private TreeSet<BillStatus> statuses;
    private ArrayList<BillDetail> details;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Integer getUserId() {
        return userId;
    }

    public void setUserId(Integer userId) {
        this.userId = userId;
    }

    public String getUserName() {
        return userName;
    }

    public void setUserName(String userName) {
        this.userName = userName;
    }

    public String getPhoneNumber() {
        return phoneNumber;
    }

    public void setPhoneNumber(String phoneNumber) {
        this.phoneNumber = phoneNumber;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public Double getTransportFee() {
        return transportFee;
    }

    public void setTransportFee(Double transportFee) {
        this.transportFee = transportFee;
    }

    public Boolean isTransfer() {
        return transfer;
    }

    public TreeSet<BillStatus> getStatuses() {
        return statuses;
    }

    public void setTransfer(Boolean transfer) {
        this.transfer = transfer;
    }

    public ArrayList<BillDetail> getDetails() {
        return details;
    }

    public void addStatus(BillStatus status) {
        if(statuses == null){
            statuses = new TreeSet<>();
        }

        statuses.add(status);
    }

    public void addDetail(BillDetail detail) {
        if(details == null){
            details = new ArrayList<BillDetail>();
        }

        details.add(detail);
    }

    @Override
    public String toString() {
        return "Bill{" +
                "id=" + id +
                ", userId=" + userId +
                ", userName=" + userName +
                ", phoneNumber='" + phoneNumber + '\'' +
                ", address='" + address + '\'' +
                ", transfer=" + transfer +
                ", transportFee=" + transportFee +
                ", statuses=" + statuses +
                ", details=" + details +
                '}';
    }
}

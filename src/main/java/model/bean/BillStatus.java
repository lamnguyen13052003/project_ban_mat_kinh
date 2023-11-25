package model.bean;

import java.time.LocalDateTime;
import java.util.Comparator;
import java.util.HashMap;
import java.util.Map;

public class BillStatus implements Comparator<BillStatus> {
    private Integer billId, status;
    private String describe;
    private LocalDateTime date;
    
    private Boolean canEdit;

    private static final Map<Integer, String> mapStatusCodes = new HashMap<>();

    static {
        mapStatusCodes.put(0, "Nhận đơn");
    }


    public Integer getBillId() {
        return billId;
    }

    public void setBillId(Integer billId) {
        this.billId = billId;
    }

    public Integer getStatus() {
        return status;
    }

    public void setStatus(Integer status) {
        this.status = status;
    }

    public String getDescribe() {
        return describe;
    }

    public void setDescribe(String describe) {
        this.describe = describe;
    }

    public LocalDateTime getDate() {
        return date;
    }

    public void setDate(LocalDateTime date) {
        this.date = date;
    }

    public Boolean isCanEdit() {
        return canEdit;
    }

    public void setCanEdit(Boolean canEdit) {
        this.canEdit = canEdit;
    }

    @Override
    public String toString() {
        return "BillStatus{" +
                "billId=" + billId +
                ", status=" + status +
                ", describe='" + describe + '\'' +
                ", date=" + date +
                ", canEdit=" + canEdit +
                '}';
    }

    @Override
    public int compare(BillStatus o1, BillStatus o2) {
        return o1.getDate().compareTo(o2.getDate());
    }
}

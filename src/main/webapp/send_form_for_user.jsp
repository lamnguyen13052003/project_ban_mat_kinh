<%@ page import="java.text.NumberFormat" %>
<%@ page import="java.util.Locale" %>
<%@ page import="model.bean.Bill" %>
<%@ page import="java.time.format.DateTimeFormatter" %>
<%@ page import="model.bean.BillDetail" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Title</title>
</head>
<%
    NumberFormat nf = NumberFormat.getCurrencyInstance(Locale.of("vi", "VN"));
    Bill bill = (Bill) request.getAttribute("bill");
    DateTimeFormatter formatter = DateTimeFormatter.ofPattern("dd/MM/yyyy HH:mm:ss");
    String formattedDateTime = bill.getStatuses().get(0).getDate().format(formatter);

    double total = 0;
    for(BillDetail bd : bill.getDetails()){
        total += bd.getPrice() * bd.getQuantity();
    }
    total += bill.getTransportFee();
%>
<body>
<div class="" style="width: 50%; height: auto; border-radius: 10px; box-shadow: 0 0 10px rgba(0, 0, 0, 0.5); margin: auto; font-family: Tahoma, Arial, sans-serif;">
    <div class="tttc-top" style="text-align: center">
        <h1 class="" style="font-weight: bold; font-size: 30px;color: #2F189A; padding-top: 0.5rem">Thanh toán thành công</h1>
        <div class="icon-tttc">
            <img src="images/icon/icon_tich_xanh.png" alt="">

        </div>
        <div class="time-tttc" style="color: #2F189A">
            <p>
                <span><%=formattedDateTime%></span>
            </p>
        </div>
    </div>
    <div class="tttc-bot" style="padding: 0 1rem">
        <div class="ma-giao-dich" style="display: flex; justify-content: space-between;padding: 10px 0; border-bottom: 1px solid rgba(0, 0, 0, 0.5);">
            <span class="left">Mã đơn hàng</span>
            <span class="right"><%=bill.getId()%></span>
        </div>
        <div class="username" style="display: flex; justify-content: space-between;padding: 10px 0; border-bottom: 1px solid rgba(0, 0, 0, 0.5);">
            <span class="left">Tên</span>
            <span class="right"><%=bill.getUserName()%></span>
        </div>
        <div class="phone-number" style="display: flex; justify-content: space-between;padding: 10px 0; border-bottom: 1px solid rgba(0, 0, 0, 0.5);">
            <span class="left">Số điện thoại</span>
            <span class="right"><%=bill.getPhoneNumber()%></span>
        </div>
        <div class="email" style="display: flex; justify-content: space-between;padding: 10px 0; border-bottom: 1px solid rgba(0, 0, 0, 0.5);">
            <span class="left">Email</span>
            <span class="right"><%=bill.getEmail()%></span>
        </div>
        <div class="adress" style="display: flex; justify-content: space-between;padding: 10px 0; border-bottom: 1px solid rgba(0, 0, 0, 0.5);">
            <span class="left">Địa chỉ</span>
            <span class="right"><%=bill.getAddress()%></span>
        </div>
        <div class="phuong-thuc-thanh-toan" style="display: flex; justify-content: space-between;padding: 10px 0; border-bottom: 1px solid rgba(0, 0, 0, 0.5);">
            <span class="left">Phương thức thanh toán</span>
            <% if(!bill.isTransfer()){ %>
            <span class="right">Thanh toán trực tiếp</span>
            <%}else{%>
            <span class="right">Chuyển khoản</span>
            <%}%>
        </div>
        <div class="so-tien" style="display: flex; justify-content: space-between;padding: 10px 0;">
            <span class="left">Tổng số tiền</span>
            <span class="right"><%=nf.format(total)%></span>
        </div>
    </div>
    <div class="btn-tttc" style="padding: 3rem 0; display: flex; justify-content: space-around; ">
        <a href="#" style="border-radius: 5px;  background-color: #2F189A; color: #FFFFFF; border: 2px solid #2F189A;  padding: 10px 5px; text-decoration: none;"
           class="check-bill" type="button">
            Kiểm tra đơn hàng</a>
    </div>
</div>
</body>
</html>
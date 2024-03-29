package controller.bill;

import controller.Action;
import helper.SendMail;
import model.bean.Bill;
import model.bean.User;
import model.service.BillService;
import model.service.CartService;
import org.mindrot.jbcrypt.BCrypt;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;

@WebServlet(name = "BillController", value = "/bill")
public class BillController extends HttpServlet implements Action {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        action(request, response);
    }

    @Override
    public void action(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");
        HttpSession session = request.getSession();
        int codeProvince = 0,
                codeDistrict = 0,
                codeWard = 0;
        User user = (User) session.getAttribute("user");
        BillService billService = (BillService) session.getAttribute("bill");
        String userName = request.getParameter("full-name").trim();
        String email = request.getParameter("email").trim();
        String phoneNumber = request.getParameter("phone-number").trim();
        String province = request.getParameter("provinces").trim();
        String district = request.getParameter("districts").trim();
        String ward = request.getParameter("wards").trim();

        String fullAddress = request.getParameter("full-address").trim();
        boolean transfer = request.getParameter("pay-option").equals("transfer") ? true : false;
        String message = null, title = null;

        if (user == null) {
            title = "Bạn chưa đăng nhập";
            message = "Vui lòng đăng nhập trược khi thanh toán. Nhấn \"OK\" để chuyển đến trang đăng nhập";
        }

        if (Double.compare(billService.getTotalBill(), 0) == 0) {
            title = "Bạn chưa chọn sản phẩm";
            message = "Vui lòng chọn sản phẩm bạn muốn mua";
        }

        if (userName.equals("")) {
            title = "Tên người nhận rỗng";
            message = "Vui lòng điền tên người nhận";
        }

        if (email.equals("")) {
            title = "Email người nhận rỗng";
            message = "Vui lòng điền email người nhận";
        }

        if (phoneNumber.equals("")) {
            title = "Số điện thoại người nhận rỗng";
            message = "Vui lòng điền số điện thoại người nhận";
        }

        if (province.equals("")) {
            title = "Chưa chọn thành phố/tỉnh người nhận rỗng";
            message = "Vui lòng chọn thành phố/tỉnh người nhận";
        }

        if (district.equals("")) {
            title = "Chưa chọn quận/huyện người nhận rỗng";
            message = "Vui lòng chọn quận/huyện người nhận";
        }

        if (ward.equals("")) {
            title = "Chưa chọn phường/xã người nhận rỗng";
            message = "Vui lòng chọn phường/xã người nhận";
        }

        if (fullAddress.equals("")) {
            title = "Địa chỉ cụ thể người nhận rỗng";
            message = "Vui lòng điền địa chỉ cụ thể người nhận";
        }

        try {
            codeProvince = Integer.parseInt(province);
        } catch (NumberFormatException e) {
            title = "Lỗi chọn thành phố/tỉnh";
            message = "Thành phố/tỉnh người nhận không tồn tại";
        }

        try {
            codeDistrict = Integer.parseInt(district);
        } catch (NumberFormatException e) {
            title = "Lỗi chọn quận/huyện";
            message = "Quận/huyện người nhận không tồn tại";
            return;
        }

        try {
            codeWard = Integer.parseInt(ward);
        } catch (NumberFormatException e) {
            title = "Lỗi chọn phường/xã";
            message = "Phường/xã người nhận không tồn tại";
            return;
        }

        if (message != null) {
            session.setAttribute("title", title);
            session.setAttribute("message", message);
            response.sendRedirect("gio_hang.jsp");
            return;
        }

        Bill bill = billService.getBill();
        bill.setUserId(user.getId());
        bill.setUserName(userName);
        bill.setEmail(email);
        bill.setPhoneNumber(phoneNumber);
        bill.setCodeProvince(codeProvince);
        bill.setCodeDistrict(codeDistrict);
        bill.setCodeWard(codeWard);
        bill.setAddress(fullAddress);
        bill.setTransportFee(20000.0);
        bill.setTransfer(transfer);
        if (billService.saveBill(bill)) {
            CartService cart = (CartService) session.getAttribute("cart");
            cart.bought(bill);
            session.setAttribute("bill", new BillService());
            session.setAttribute("cart", cart);
            session.setAttribute("billPayed", bill);
            response.sendRedirect("thanh_toan_thanh_cong.jsp");
        }
        else {
            title = "Thanh toán không thành công";
            message = "1 trong sản phẩm trong danh sách sản phẩm vừa hết hàng.";
            session.setAttribute("title", title);
            session.setAttribute("message", message);
            response.sendRedirect("gio_hang.jsp");
        }
    }
}
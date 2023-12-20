package helper;

import model.bean.Bill;
import model.bean.BillDetail;

import javax.mail.*;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import java.text.NumberFormat;
import java.time.format.DateTimeFormatter;
import java.util.Date;
import java.util.Locale;
import java.util.Properties;

public class SendMail {

    private static Session session;

    private SendMail() {
        Properties props = new Properties();
        props.put("mail.smtp.host", "smtp.gmail.com"); // SMTP Host
        props.put("mail.smtp.port", "587"); // TLS Port
        props.put("mail.smtp.auth", "true"); // enable authentication
        props.put("mail.smtp.starttls.enable", "true"); // enable STARTTLS

        String fromEmail = SendMailProperties.getEmail();
        String password = SendMailProperties.getPassword();
        Authenticator auth = new Authenticator() {
            protected PasswordAuthentication getPasswordAuthentication() {
                return new PasswordAuthentication(fromEmail, password);
            }
        };
        session = Session.getInstance(props, auth);
    }

    public static boolean Send(String to, String subject, String body) {
        if (session == null) new SendMail();
        try {
            Message msg = new MimeMessage(session);

            msg.setFrom(new InternetAddress("Shop"));
            InternetAddress[] toAddresses = {new InternetAddress(to)};
            msg.setRecipients(Message.RecipientType.TO, toAddresses);
            msg.setSubject(subject);
            msg.setSentDate(new Date());
            msg.setContent(body, "text/html;  charset=UTF-8");
            Transport.send(msg);
            return true;
        } catch (MessagingException e) {
            return false;
        }
    }

    public static String getFormRegister(String url, String fullName, String email, String code) {
        return "<div style=\"width: 500px; background: #2F189A; color: #fff; padding: 15px; border-radius: 10px\">" +
                "    <h3 style=\"margin-top: 0;\">Xin chào " + fullName + "!</h3>" +
                "    <p>Bạn vừa đăng ký thành công tài khoản của mình." +
                "        Để hoàn tất quá trình đăng ký vui lòng xác thực để hoàn tất quá đăng nhập." +
                "    </p>" +
                "    <p>Mail xác thực chỉ khả dụng tối đa 10' tính từ thời điểm nhận mail</p>" +
                "    <a href=\"" + url + "&email=" + email + "&code=" + code + "\">" +
                "        <button style=\"background: #ff3300; color: #fff; padding: 10px; border: none; border-radius: 5px; font-size: 15px; font-weight: bold\">Nhấp để xác thực</button>" +
                "    </a>" +
                "</div>";
    }

    public static String getFormForgetPassword(String url, String email, String code) {
        return "<div style=\"width: 500px; background: #2F189A; color: #fff; padding: 15px; border-radius: 10px\">" +
                "    <h3 style=\"margin-top: 0;\">Xin chào " + email + "</h3>" +
                "    <p>Bạn vừa gửi lệnh yêu cầu đổi lại mật khẩu của mình. <br>" +
                "        Vui lòng nhấn nút xác thực để tiếp tục quá trình đổi mật khẩu." +
                "    </p>" +
                "    <p>Mail xác thực chỉ khả dụng tối đa 10' tính từ thời điểm nhận mail.</p>" +
                "    <a href=\"" + url + "&email=" + email + "&code=" + code + "\">" +
                "        <button style=\"background: #ff3300; color: #fff; padding: 10px; border: none; border-radius: 5px; font-size: 15px; font-weight: bold\">" +
                "            Nhấp để xác thực" +
                "        </button>" +
                "    </a>" +
                "</div>";
    }
    /*
    gửi hóa đơn cho khách hàng
     */
    public static String sendBillForUser(Bill bill, String url){
        NumberFormat nf = NumberFormat.getCurrencyInstance(Locale.of("vi", "VN"));
        DateTimeFormatter formatter = DateTimeFormatter.ofPattern("dd/MM/yyyy HH:mm:ss");
        String formattedDateTime = bill.getStatuses().get(0).getDate().format(formatter);
        return "<div class=\"\" style=\"width: 50%; height: auto; border-radius: 10px; box-shadow: 0 0 10px rgba(0, 0, 0, 0.5); margin: auto; font-family: Tahoma, Arial, sans-serif;\">\n" +
                "    <div class=\"tttc-top\" style=\"text-align: center\">\n" +
                "        <h1 class=\"\" style=\"font-weight: bold; font-size: 30px;color: #2F189A; padding-top: 0.5rem\">Thanh toán thành công</h1>\n" +
                "        <div class=\"icon-tttc\">\n" +
                "            <img src=\"images/icon/icon_tich_xanh.png\" alt=\"\">\n" +
                "\n" +
                "        </div>\n" +
                "        <div class=\"time-tttc\" style=\"color: #2F189A\">\n" +
                "            <p>\n" +
                "                <span>"+formattedDateTime+"</span>\n" +
                "            </p>\n" +
                "        </div>\n" +
                "    </div>\n" +
                "    <div class=\"tttc-bot\" style=\"padding: 0 1rem\">\n" +
                "        <div class=\"ma-giao-dich\" style=\"display: flex; justify-content: space-between;padding: 10px 0; border-bottom: 1px solid rgba(0, 0, 0, 0.5);\">\n" +
                "            <span class=\"left\">Mã đơn hàng</span>\n" +
                "            <span class=\"right\">"+bill.getId()+"</span>\n" +
                "        </div>\n" +
                "        <div class=\"username\" style=\"display: flex; justify-content: space-between;padding: 10px 0; border-bottom: 1px solid rgba(0, 0, 0, 0.5);\">\n" +
                "            <span class=\"left\">Tên</span>\n" +
                "            <span class=\"right\">"+bill.getUserName()+"</span>\n" +
                "        </div>\n" +
                "        <div class=\"phone-number\" style=\"display: flex; justify-content: space-between;padding: 10px 0; border-bottom: 1px solid rgba(0, 0, 0, 0.5);\">\n" +
                "            <span class=\"left\">Số điện thoại</span>\n" +
                "            <span class=\"right\">"+bill.getPhoneNumber()+"</span>\n" +
                "        </div>\n" +
                "        <div class=\"email\" style=\"display: flex; justify-content: space-between;padding: 10px 0; border-bottom: 1px solid rgba(0, 0, 0, 0.5);\">\n" +
                "            <span class=\"left\">Email</span>\n" +
                "            <span class=\"right\">"+bill.getEmail()+"</span>\n" +
                "        </div>\n" +
                "        <div class=\"adress\" style=\"display: flex; justify-content: space-between;padding: 10px 0; border-bottom: 1px solid rgba(0, 0, 0, 0.5);\">\n" +
                "            <span class=\"left\">Địa chỉ</span>\n" +
                "            <span class=\"right\">"+bill.getAddress()+"</span>\n" +
                "        </div>\n" +
                "        <div class=\"phuong-thuc-thanh-toan\" style=\"display: flex; justify-content: space-between;padding: 10px 0; border-bottom: 1px solid rgba(0, 0, 0, 0.5);\">\n" +
                "            <span class=\"left\">Phương thức thanh toán</span>\n" +
                                getHTMLTransfer(bill)+
                "        </div>\n" +
                "        <div class=\"so-tien\" style=\"display: flex; justify-content: space-between;padding: 10px 0;\">\n" +
                "            <span class=\"left\">Tổng số tiền</span>\n" +
                "            <span class=\"right\">"+nf.format(bill.totalBill())+"</span>\n" +
                "        </div>\n" +
                "    </div>\n" +
                "    <div class=\"btn-tttc\" style=\"padding: 3rem 0; display: flex; justify-content: space-around; \">\n" +
                "        <a href=\""+url+"\" style=\"border-radius: 5px;  background-color: #2F189A; color: #FFFFFF; border: 2px solid #2F189A;  padding: 10px 5px; text-decoration: none;\"\n" +
                "           class=\"check-bill\" type=\"button\">\n" +
                "            Kiểm tra đơn hàng</a>\n" +
                "    </div>\n" +
                "</div>";

    }
    private static String getHTMLTransfer(Bill bill){
        if(bill.isTransfer()) return "<span class=\"right\">Chuyển khoản</span>";
        return "<span class=\"right\">Thanh toán trực tiếp</span>";
    }
}

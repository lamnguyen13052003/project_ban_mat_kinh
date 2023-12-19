package helper;

import javax.mail.*;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import java.util.Date;
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
}

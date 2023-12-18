package helper;

import db.DBProperties;

import javax.mail.*;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import java.io.UnsupportedEncodingException;
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

    public static void Send(String to, String subject, String body) {
        if (session == null) new SendMail();
        try {
            Message msg = new MimeMessage(session);

            msg.setFrom(new InternetAddress("Shop"));
            InternetAddress[] toAddresses = { new InternetAddress(to) };
            msg.setRecipients(Message.RecipientType.TO, toAddresses);
            msg.setSubject(subject);
            msg.setSentDate(new Date());
            msg.setContent(body, "text/html;  charset=UTF-8");
            Transport.send(msg);

        } catch (MessagingException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }
        System.out.println("Gui mail thanh cong");
    }
}

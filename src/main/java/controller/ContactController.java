package controller;

import db.DBProperties;
import helper.SendMail;
import helper.SendMailProperties;
import model.bean.User;
import model.service.UserService;
import org.mindrot.jbcrypt.BCrypt;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

@WebServlet(name = "ContactController", value = "/contact")
public class ContactController extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String name = request.getParameter("name");
        String email = request.getParameter("email");
        String phone = request.getParameter("phone");
        String address = request.getParameter("address");
        String comment = request.getParameter("comment");
        StringBuffer messageBuffer = new StringBuffer();
        messageBuffer.append("<table cellpadding='0' cellspacing='0' width='100%'><tr><td style='background:#9acb51;color:#ffffff; font-size:18px; text-transform:capitalize; font-family:sans-serif; font-weight:bold; padding:10px;'>");
        messageBuffer.append("Thông tin người dùng liên hệ");
        messageBuffer.append("</td><td style='background:#9acb51;color:#ffffff; font-size:18px; text-transform:capitalize; font-family:sans-serif; font-weight:bold; padding:10px;'>");
        messageBuffer.append("</td></tr>");
        messageBuffer.append("<tr><td width='40%' style='color:#999999; font-size:14px; font-weight:bold; font-family:sans-serif;");
        messageBuffer.append("border-right:2px solid #f8f8f8; border-bottom:2px solid #f8f8f8; text-transform:capitalize; padding:15px 10px'>Họ tên</td>");
        messageBuffer.append("<td style='color:#555555; font-size:14px; font-family:sans-serif; border-bottom:1px solid #f8f8f8; padding:15px 10px;'>");
        messageBuffer.append(name);
        messageBuffer.append("</td></tr>");
        messageBuffer.append("<tr><td width='40%' style='color:#999999; font-size:14px; font-weight:bold; font-family:sans-serif;");
        messageBuffer.append("border-right:2px solid #f8f8f8; border-bottom:2px solid #f8f8f8; text-transform:capitalize; padding:15px 10px'>Email</td>");
        messageBuffer.append("<td style='color:#555555; font-size:14px; font-family:sans-serif; border-bottom:1px solid #f8f8f8; padding:15px 10px;'>");
        messageBuffer.append(email);
        messageBuffer.append("</td></tr>");
        messageBuffer.append("<tr><td width='40%' style='color:#999999; font-size:14px; font-weight:bold; font-family:sans-serif;");
        messageBuffer.append("border-right:2px solid #f8f8f8; border-bottom:2px solid #f8f8f8; text-transform:capitalize; padding:15px 10px'>Phone</td>");
        messageBuffer.append("<td style='color:#555555; font-size:14px; font-family:sans-serif; border-bottom:1px solid #f8f8f8; padding:15px 10px;'>");
        messageBuffer.append(phone);
        messageBuffer.append("</td></tr>");
        messageBuffer.append("<tr><td width='40%' style='color:#999999; font-size:14px; font-weight:bold; font-family:sans-serif;");
        messageBuffer.append("border-right:2px solid #f8f8f8; border-bottom:2px solid #f8f8f8; text-transform:capitalize; padding:15px 10px'>Địa chỉ</td>");
        messageBuffer.append("<td style='color:#555555; font-size:14px; font-family:sans-serif; border-bottom:1px solid #f8f8f8; padding:15px 10px;'>");
        messageBuffer.append(address);
        messageBuffer.append("</td></tr>");
        messageBuffer.append("<tr><td width='40%' style='color:#999999; font-size:14px; font-weight:bold; font-family:sans-serif;");
        messageBuffer.append("border-right:2px solid #f8f8f8; border-bottom:2px solid #f8f8f8; text-transform:capitalize; padding:15px 10px'>Bình luận</td>");
        messageBuffer.append("<td style='color:#555555; font-size:14px; font-family:sans-serif; border-bottom:1px solid #f8f8f8; padding:15px 10px;'>");
        messageBuffer.append(comment);
        messageBuffer.append("</td></tr>");
        messageBuffer.append("</table>");

        String finalMessage = messageBuffer.toString();
        SendMail.Send(SendMailProperties.getEmailContact(), "Liên hệ", finalMessage);
        response.sendRedirect("lien_he.jsp");
    }
}
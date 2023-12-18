package controller.review;

import controller.Action;
import model.service.ReviewService;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;
import java.io.File;
import java.io.IOException;

public class UploadImageReview implements Action {
    @Override
    public void action(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String userId = request.getParameter("userId"), billId = request.getParameter("billId"), productId = request.getParameter("productId");
        String key = userId + "-" + billId + "-" + productId;
        Part filePart = request.getPart("input-img-review");
        String fileName = filePart.getSubmittedFileName().replaceAll(" ", "-");
        ServletContext servletContext = request.getServletContext();
        String pathFile = servletContext.getRealPath("/") + "images/review/" + key + "/";
        File file = new File(pathFile);
        if (!file.exists()) file.mkdirs();
        String fullFilePath, subFilePath;
        ReviewService reviewService = new ReviewService();
        for (Part part : request.getParts()) {
            if (part.getContentType() != null) {
                fullFilePath = file.getAbsolutePath() + "/" + fileName;
                part.write(file.getAbsolutePath() + "/" + fileName);
                subFilePath = fullFilePath.substring(fullFilePath.indexOf("images"), fullFilePath.length());
            }
        }
    }
}

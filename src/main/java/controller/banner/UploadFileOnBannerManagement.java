package controller.banner;

import model.bean.BannerImage;
import model.service.BannerService;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.*;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.nio.file.StandardCopyOption;

@WebServlet(name = "UploadFileOnBannerManagement", value = "/upload-file-on-banner-management")
@MultipartConfig(maxFileSize = 5 * 1024 * 1024) // Giới hạn kích thước tệp tối đa là 5 MB
public class UploadFileOnBannerManagement extends HttpServlet {
    public static final int MAX_FILE_SIZE = 5 * 1024 * 1024;

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            String fullFilePath, subFilePath;
            for (Part part : request.getParts()) {
                if (part.getContentType() != null) {
                    String description = part.getName();
                    String fileName = part.getSubmittedFileName().replaceAll(" ", "-");
                    long fileSize = part.getSize();

                    if (fileSize > MAX_FILE_SIZE) throw new IOException("File size exceeds the limit of 5 MB.");

                    ServletContext servletContext = request.getServletContext();
                    String pathFile = servletContext.getRealPath("/") + "images/banner/";
                    File file = new File(pathFile);
                    if (!file.exists()) file.mkdirs();

                    fullFilePath = pathFile + fileName;
                    subFilePath = fullFilePath.substring(fullFilePath.indexOf("images"), fullFilePath.length());
                    // Lưu tệp tải lên vào thư mục trên server
                    Path targetPath = Path.of(file.getAbsolutePath(), fileName);

                    try (InputStream inputStream = part.getInputStream()) {
                        Files.copy(inputStream, targetPath, StandardCopyOption.REPLACE_EXISTING);
                    }

                    //update db
                    BannerImage bannerImage = new BannerImage();
                    bannerImage.setDescription(part.getName());
                    bannerImage.setUrlImage(subFilePath);

                    if(description.indexOf("banner") != -1) {
                        BannerService.getInstance().uploadBannerImage(bannerImage);
                    }else{
                        BannerService.getInstance().insertSlideShowImages(bannerImage);
                    }

                    System.out.println("File saved at: " + targetPath.toString());
                    response.getWriter().println("File uploaded successfully!");
                }
            }

        }catch (Exception e) {
            e.printStackTrace();
            response.getWriter().println("Error uploading file:: " + e.getMessage());
        }
    }
}
package controller.banner;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.nio.file.Files;
import java.nio.file.Path;
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
            Part filePath = request.getPart("upload-file-on-banner-management");

            String fileName = filePath.getSubmittedFileName().replaceAll(" ", "-");
            long fileSize = filePath.getSize();

            if (fileSize > MAX_FILE_SIZE) throw new IOException("File size exceeds the limit of 5 MB.");

            ServletContext servletContext = request.getServletContext();
            String pathFile = servletContext.getRealPath("/") +"images/banner/";
            File uploadDirectory = new File(pathFile);
            if(!uploadDirectory.exists()) uploadDirectory.mkdirs();

            response.setContentType("application/x-www-form-urlencoded");
            response.setCharacterEncoding("UTF-8");

            try {
                InputStream fileContent  = filePath.getInputStream();
                Path file = Path.of(uploadDirectory.getAbsolutePath(), fileName);
                Files.copy(fileContent, file, StandardCopyOption.REPLACE_EXISTING);
                System.out.println("File uploaded successfully to: " + file);
            }catch (Exception e) {
                e.printStackTrace();
            }

            response.getWriter().println("File uploaded successfully!");

        }catch (Exception e) {
            e.printStackTrace();
            response.getWriter().println("Error uploading file:: " + e.getMessage());
        }
    }
}
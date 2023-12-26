package controller.banner;

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
            Part filePart = request.getPart("banner-login");

            String fileName = filePart.getSubmittedFileName().replaceAll(" ", "-");
            System.out.println(fileName);
            long fileSize = filePart.getSize();

            if (fileSize > MAX_FILE_SIZE) throw new IOException("File size exceeds the limit of 5 MB.");

            ServletContext servletContext = request.getServletContext();
            String pathFile = servletContext.getRealPath("/") +"images/banner/";
            File file = new File(pathFile);
            if(!file.exists()) file.mkdirs();
            // Lưu tệp tải lên vào thư mục trên server
            Path targetPath = Path.of(file.getAbsolutePath(), fileName);

            try (InputStream inputStream = filePart.getInputStream()) {
//                byte[] bytes = new byte[1024];
//                int readByte;
//                while ((readByte = inputStream.read(bytes)) != -1){
//                  response.
//                }
                Files.copy(inputStream, targetPath, StandardCopyOption.REPLACE_EXISTING);
            }

            System.out.println("File saved at: " + targetPath.toString());
            response.getWriter().println("File uploaded successfully!");

        }catch (Exception e) {
            e.printStackTrace();
            response.getWriter().println("Error uploading file:: " + e.getMessage());
        }
    }
}
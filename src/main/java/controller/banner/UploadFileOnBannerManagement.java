package controller.banner;

import model.bean.BannerImage;
import model.service.BannerService;
import org.json.JSONObject;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.*;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.nio.file.StandardCopyOption;

@WebServlet(name = "UploadFileOnBannerManagement", value = "/admin_pages/upload-file-on-banner-management")
@MultipartConfig(maxFileSize = 5 * 1024 * 1024, maxRequestSize = 50 *1024*1024) // Giới hạn kích thước tệp tối đa là 5 MB
public class UploadFileOnBannerManagement extends HttpServlet {
    public static final int MAX_FILE_SIZE = 5 * 1024 * 1024;

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            ServletContext servletContext = request.getServletContext();
            String pathFile = servletContext.getRealPath("/") + "images/banner/";
            File file = new File(pathFile);
            if (!file.exists()) file.mkdirs();
            String fullFilePath, subFilePath;
            for (Part part : request.getParts()) {
                if (part.getContentType() != null) {
                    String description = part.getName();
                    String fileName = getFileName(part);
                    long fileSize = part.getSize();
                    if (fileSize > MAX_FILE_SIZE) throw new IOException("File size exceeds the limit of 5 MB.");
                    fullFilePath = pathFile + fileName;
                    subFilePath = fullFilePath.substring(fullFilePath.indexOf("images"), fullFilePath.length());

                    // Lưu tệp tải lên vào thư mục trên server
                    String filePath = file + File.separator + fileName;

                    part.write(fullFilePath);
                    //update db
                    BannerImage bannerImage = new BannerImage();
                    bannerImage.setDescription(description);
                    bannerImage.setUrlImage(subFilePath);

                    BannerService.getInstance().uploadBannerImage(bannerImage);

//                        bannerImage.setId(BannerService.getInstance().nextIdOfSlide());
//                        bannerImage.setDescription("slide-"+ nextId);
//                        BannerService.getInstance().insertSlideShowImages(bannerImage);

                    JSONObject json = new JSONObject();
                    json.put("url", subFilePath);
                    response.setContentType("application/json");
                    response.setCharacterEncoding("UTF-8");
                    response.getWriter().write(json.toString());
                }
            }

        }catch (Exception e) {
            e.printStackTrace();
            response.getWriter().println("Error uploading file:: " + e.getMessage());
        }
    }

    private String getFileName(Part part) {
        String contentDisposition = part.getHeader("content-disposition");
        String[] items = contentDisposition.split(";");
        for (String item : items) {
            if (item.trim().startsWith("filename")) {
                return item.substring(item.indexOf("=") + 2, item.length() - 1);
            }
        }
        return "unknown";
    }
}
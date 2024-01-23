import model.DAO.DAO;
import model.DAO.ProductDAO;

import java.io.*;
import java.util.Random;
import java.util.StringTokenizer;

public class Main {
    public static void main(String[] args) throws IOException {
    }

    private void abc() {
        String sql = "INSERT INTO `mat_kinh_kimi`.`product_images` (`id`, `productId`, `urlImage`) VALUES ";
        int id = 1;
        File root = new File("D:\\Tai_lieu_hoc_tap\\LapTrinhWeb\\project_ban_mat_kinh\\src\\main\\webapp\\images\\product");
        File[] folders = root.listFiles();
        for (int productId = 1; productId <= 372; productId++) {
            File folder = folders[productId - 1];
            File[] files = folder.listFiles();
            for (File file : files) {
                String reSql = sql + "(" + id + ", " + folder.getName() + ", " + "'images\\\\product\\\\" + folder.getName() + "\\\\" + file.getName() + "');";
                System.out.println(reSql);
                id++;
            }
        }
    }
}

package controller.cart;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

public interface ActionCart {
    void action(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException;
}

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

import com.pict.dao.LoginDao;
import java.io.IOException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class Signup extends HttpServlet {

    public void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException {

        String first_name = request.getParameter("first_name");
        String middle_name = request.getParameter("middle_name");
        String last_name = request.getParameter("last_name");
        String username = request.getParameter("UserID");
        String password = request.getParameter("Password");

        System.out.println(username);
        System.out.println("fdvbajdf");
        LoginDao dao = new LoginDao();

        if (dao.check(username, password)) {
            response.sendRedirect("LoginSuccessful.jsp");
        } else {
            dao.insert(first_name, middle_name, last_name, username, password);
            response.sendRedirect("Login.jsp");
        }

    }

}

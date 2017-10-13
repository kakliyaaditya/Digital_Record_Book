/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
import com.pict.dao.CreateTableDao;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author sameer
 */
public class AssignCreate extends HttpServlet {

    public void doGet(HttpServletRequest request,HttpServletResponse response) throws IOException, ServletException{
    
        String usrname=request.getParameter("username");
        String num=request.getParameter("AssignNumber");
        System.out.println(usrname);
        System.out.println(num);
       
        String date=request.getParameter("sdate");
        System.out.println("date is "+date);
        
        CreateTableDao ctd=new CreateTableDao();
       
        
        try {
            ctd.create(usrname, num,date);
            ctd.updateDate(usrname, num, date);
        } catch (ClassNotFoundException | SQLException ex) {
            Logger.getLogger(AssignCreate.class.getName()).log(Level.SEVERE, null, ex);
        }
         PrintWriter out=response.getWriter();
        out.println("Assignment SuccessFully Created");
       
    
    }
}

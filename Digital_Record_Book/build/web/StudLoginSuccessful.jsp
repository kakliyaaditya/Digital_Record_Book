<%-- 
    Document   : StudLoginSuccessful
    Created on : 26 Sep, 2017, 8:03:49 PM
    Author     : hp
--%>

<%@page import="com.pict.dao.StudentInfo"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>StudLoginSuccess</title>
    </head>
    <%
        String username = (String)session.getAttribute("username");
        int count=0,check_count=0;
        
        
        StudentInfo sInfo=new StudentInfo();
        ResultSet rs2=sInfo.getSubject(username);
        
        //Class.forName("com.mysql.jdbc.Driver");
        //Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/temp","root","arsh1006");
        //Statement stmt1 = conn.createStatement();
       
        //sub_name = "SL-1";
        //query1 = "select Approved from SubmissionTicket where SubjectCode=(select SubjectCode from SubjectTable where SubjectName='"+sub_name+"') and RollNo="+username+";";
        %>
    <body>
       <center>
           <h2>Welcome <%out.println(username);%></h2>
                      
           <form action="StudentGetAsg.jsp" method="get">
       
           <%
            while(rs2.next()){
                count++;
                String subname = rs2.getString("SubjectName");
                System.out.println("Sub_name:"+subname);
                %>
                <br><button name="subj" value="<%=subname%>"><%out.println(subname);%></button>
                <input type="checkbox" name="<%=subname%>" disabled
                       <%
                            int Approved = sInfo.getApproved(subname, username);
                            if(Approved == 1){
                                check_count++;
                                out.println("checked");
                            }
                            System.out.println("Yezs!");
                        }
                        
                       %> >
           <br> Submission Ticket:
           <input type="checkbox" name="SubmissionTicket" value="subticket" <%if(count == check_count){out.println("checked");}%>disabled>
           <input type="hidden" name="userid" value="<%=username%>">
           </form>
       </center>
           
           <br><br>
           
           
           <form action="Logout" method="get">
    <input type="submit" value="Logout">
</form>
    </body>
</html>
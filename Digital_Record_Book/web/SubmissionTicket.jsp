<%-- 
    Document   : SubmissionTicket
    Created on : 28 Sep, 2017, 5:56:40 PM
    Author     : sameer
--%>

<%@page import="java.sql.ResultSet"%>
<%@page import="com.pict.dao.SubmissionTicketDao"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Submission Tickets</title>
    </head>
    <body>
        <h1>Hello World!</h1>
         <form action="Assign.jsp" method="POST">
        
            <input type="hidden" name="grpname" value="<%=request.getParameter("grpname")%>">
            <input type="submit"  value="BACK">
        
        </form>
        <%
        
        int assignCount=Integer.parseInt(request.getParameter("acount"));
        
        SubmissionTicketDao std=new SubmissionTicketDao();
        
         ResultSet rs=std.getTicket((String)session.getAttribute("username"),request.getParameter("grpname"), assignCount);
        
        if(rs==null){
            
            %>First Create Specified Number Of Assignments then Submission Tickets will be printed<%
        
        }
        else{
            %><h4>Submission Tickets</h4>
                
            <table>
                <th>Roll NUmber</th>
                <th>Approval</th>
            <%
            while(rs.next()){
        %>
            <tr>
                <td ><%=rs.getString("RollNo")%></td>
                <%
                if(rs.getString("Approved").equals("1")){
                
                    %>
                    <td> <input type="checkbox" checked disabled></td>
                    <%
                    
                }
                else{
                    %>
                    <td><input type="checkbox" disabled></td>
                    <%
                
                
                }
                
                %></tr>
            
        
        
        
        
        <%
            }
        }
        %>
        
            </table>
    </body>
</html>
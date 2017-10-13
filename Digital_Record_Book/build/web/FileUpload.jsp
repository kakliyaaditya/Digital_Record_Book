<%-- 
    Document   : FileUpload
    Created on : 1 Oct, 2017, 11:29:34 AM
    Author     : hp
--%>

<%@page import="java.sql.ResultSet"%>
<%@page import="com.pict.dao.FileDao"%>
<%@page import="java.io.File"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="java.io.*" %> 
<%@ page import="java.io.*,java.util.*, javax.servlet.*" %>
<%@ page import="javax.servlet.http.*" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%
            String username=(String)session.getAttribute("username");
            FileDao fd=new FileDao();
            ResultSet rs1= fd.getSubjects(username);
            ResultSet rs2=fd.getGroups(username);
        
        
        %>
        
        <form method="POST" action="FileUpload" enctype="multipart/form-data" >
<table>
        <tr><td>PDF file</td>
            
         <select class="subject" name="subjectname">
        <%  while(true){ if( !rs1.next()) break; %>
            <option value="<%= rs1.getString("SubjectName")%>" > <%= rs1.getString("SubjectName")%> </option>
        <% } %>
        </select>   
            
            <select class="group" name="groupname">
        <%  while(true){ if( !rs2.next()) break; %>
            <option value="<%= rs2.getString("GroupName")%>" > <%= rs2.getString("GroupName")%> </option>
        <% } %>
        
        </select>
        
            <td><input type="file" name="file" id="file" /> </td>
        </tr>
        <tr>
        <td colspan="2">
           FileName: <input type="text" name="FileName"><br>
          
           
           
            
        <input type="hidden" name="UserID" value="<%=username%>" >
           <input type="submit" value="Upload" name="upload" id="upload" />
        </td>
        </tr>
   </table>
        </form>


        
        
    </body>
</html>
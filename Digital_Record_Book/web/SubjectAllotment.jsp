
<%@page import="java.sql.ResultSet"%>
<%@page import="com.pict.dao.SubjectAllotment"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<head>
    <style>
    </style>
    
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Welcome</title>

    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
    <link rel="stylesheet" href="https://ajax.googleapis.com/ajax/libs/jqueryui/1.12.1/themes/smoothness/jquery-ui.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jqueryui/1.12.1/jquery-ui.min.js"></script>
        <link rel="stylesheet" href="style.css" type="text/css" media="screen">

    
    <script>
        
$(document).ready(function() {
    $("#add").click(function() {
      $('#data-table tbody>tr.row:last').clone(true).insertAfter('#data-table tbody>tr.row:last');
      return false;
    });
    
    
    
    $("#call").click(function() {
  //  alert("popup");
    var subject = "[";
    var teacher = "[";
    var group = "[";
    
$("tr.row").each(function() {
    var q1 = $(this).find("select.subject").val();
    var q2 = $(this).find("select.teacher").val();
    var q3 = $(this).find("select.group").val();
    
    subject+="{\"subject\" : ";
    subject+= "\"" + q1 + "\"";
    subject+="},";
    
    teacher+="{\"teacher\" : ";
    teacher+= "\"" + q2 + "\"";
    teacher+="},";
    
    group+="{\"group\" : ";
    group+= "\"" + q3 + "\"";
    group+="},";
    
 
  
});
subject = subject.substring(0, subject.length - 1);
teacher = teacher.substring(0, teacher.length - 1);
group = group.substring(0, group.length - 1);

subject+="]";
teacher+="]";
group+="]";

    //  alert(subject); 
   //   alert(teacher); 
   //   alert(group); 
      
      var input;
               input = document.getElementById("subject");
        input.value = subject;
        
         input = document.getElementById("teacher");
        input.value = teacher;
        
         input = document.getElementById("group");
        input.value = group;
});
});

    </script>

</head>

<body>
     <%   
  
            ResultSet rs,ry = null;
            SubjectAllotment rc = new SubjectAllotment ();
           rs = rc.giveresult();
           ry = rc.giveresult();
           String subject,group;
           
        %>
        <% if(ry.next()) {  %>   
       
        <div>
        <table>
            
       <th>Teacher Name</th>
        <th>Subject</th>
        
        <th>Batch/Class Name</th>

        <% while(rs.next()) {  
        subject = rc.subjectname(rs.getInt("SubjectCode"));
         group = rc.groupname(rs.getInt("GroupCode"));    
        %>
        <tr>   
             <td><%=rs.getString("UserName") %></td>
             <td><%= subject %></td>
             <td><%= group %></td>

        </tr>
        <% } %>
        </table>
        </div>  
        <% } %>
       
    
    
    <%
            SubjectAllotment sa=new SubjectAllotment();
            ResultSet rs1=sa.getTeachers();
            ResultSet rs2=sa.getSubject();
           // if( !rs2.next()) out.println("x");
            ResultSet rs3=sa.getGroups();
            ResultSet rx = sa.getSubject();
   
        %>
            
        <form action="SubjectAllotment" method="POST">
   <table id="data-table" align="center" class="bordered">

         <th>Teacher</th>
         <th>Subject</th>
     <th>Batch/Class</th>

<tbody>
     <tr class="row">
         
          <td>
          <select class="teacher">
        <%  while(true){ if( !rs1.next()) break; %>
            <option value="<%= rs1.getString("UserName")%>" > <%= rs1.getString("UserName")%> </option>
        <% } %>
        </select>
          </td>
          <td>
        <select class="subject">
        <%  while(true){ if( !rs2.next()) break; %>
            <option value="<%= rs2.getString("SubjectName")%>" > <%= rs2.getString("SubjectName")%> </option>
        <% } %>
        </select>
          </td>
     
       
  
          <td>
        <select class="group">
        <%  while(true){ if( !rs3.next()) break; %>
            <option value="<%= rs3.getString("GroupName")%>" > <%= rs3.getString("GroupName")%> </option>
        <% } %>
        </select>
          </td>
       </tr>
     
</tbody>
   </table>
    <button id="add" type="button">+</button>

   <input type="hidden" name="subject" id="subject" /> 
         <input type="hidden" name="teacher" id="teacher" />
          <input type="hidden" name="group" id="group" />
        <input type="submit" id="call" value="submit">

        </form>
</body>

</html>
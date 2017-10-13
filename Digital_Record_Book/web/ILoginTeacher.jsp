<%-- 
    Document   : ILoginTeacher
    Created on : 3 Oct, 2017, 9:39:58 PM
    Author     : sameer
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title></title>
    </head>
    <div id ="frame">
        <%
            if(Integer.parseInt(request.getParameter("type"))==1){
        
        %>
        
    <iframe style="height:96vh; width:200px" name="iframe_a" src="LoginSuccessful.jsp?success=2"></iframe>
   <iframe style="height:96vh; width:150vh " name="frame1" src="Welcome.jsp"></iframe>
     </div>
        <%}
            else if(Integer.parseInt(request.getParameter("type"))==2){
                
                %>
    <iframe style="height:96vh; width:200px" name="iframe_a" src="admin.jsp"></iframe>
    <iframe style="height:96vh; width:150vh " name="frame1" src="Welcome.jsp"></iframe>
    
    <%
                
            }
        
        
            %>
</html>

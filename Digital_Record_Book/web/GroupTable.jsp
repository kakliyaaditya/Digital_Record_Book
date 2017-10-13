
<%@page import="com.pict.dao.GetStudent"%>
<%@page import="com.pict.dao.GroupTable"%>
<%@page import="com.pict.dao.Records"%>
<%@page import="java.sql.ResultSet"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
    
    <head>
            <link rel="stylesheet" href="style.css" type="text/css" media="screen">

  <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Records..</title>
        <script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.4.2/jquery.min.js"></script>
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.9.1/jquery.min.js"></script>
        <link rel="stylesheet" href="//code.jquery.com/ui/1.11.4/themes/smoothness/jquery-ui.css">
        <script src="//code.jquery.com/jquery-1.10.2.js"></script>
        <script src="//code.jquery.com/ui/1.11.4/jquery-ui.js"></script>
        <script src="http://ajax.googleapis.com/ajax/libs/angularjs/1.3.14/angular.min.js"></script>
        <script src="//code.jquery.com/ui/1.11.2/jquery-ui.js"></script>
        <link rel="stylesheet" href="//code.jquery.com/ui/1.11.2/themes/start/jquery-ui.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.2.0/css/font-awesome.min.css">

       
        
        
    <script language="javascript">
        var str; 
        function displayResult()
        {
            document.getElementById("data-table").insertRow(-1).innerHTML = '<td contenteditable="true"></td><td contenteditable="true"></td><td contenteditable="true"></td>';
        }
        $.fn.MessageBox = function() {
          //  alert("called");
            
        jQuery.fn.pop = [].pop;
        jQuery.fn.shift = [].shift;
        var $TABLE = $('#table');
        var $rows = $TABLE.find('tr:not(:hidden)');
        var headers = [];
        var data = [];
        $($rows.shift()).find('th:not(:empty)').each(function () {
        headers.push($(this).text());
        });
       
        $rows.each(function () {
        var $td = $(this).find('td');
        var h = {};
        headers.forEach(function (header, i) {
        h[header] = $td.eq(i).text();   
        });
    
        data.push(h);
         
       
   });
   var GroupName = JSON.stringify(data, ["GroupName"]);
        input = document.getElementById("gn");
        input.value = GroupName;
        
        
        
         var  GroupStartRollNo = JSON.stringify(data, ["GroupStartRollNo"]);
        input = document.getElementById("gsn");
        input.value = GroupStartRollNo;
        
         var GroupEndRollNo = JSON.stringify(data, ["GroupEndRollNo"]);
        input = document.getElementById("gen");
        input.value =GroupEndRollNo;
        
     //   alert(GroupName);
     //   alert(GroupStartRollNo);
     //   alert(GroupEndRollNo);
        
        

        

};

        </script>
        
        <style>
            
td{
  padding: 15px;
  text-align: left;
  vertical-align:middle;
  font-weight: 300;
  font-size: 18px;
  color: #000;
  border-bottom: solid 1px rgba(0,0,0,1);
}
        </style>
        
    </head>
    
    <body style="background:#ddebff; color:#000;"><center>
        <h1>Group Table</h1><br><hr><br>
        <%   
  
            ResultSet rs,ry = null;
            GroupTable rc = new GroupTable();
           rs = rc.giveresult();
           ry = rc.giveresult();
        %>
        <% if(ry.next()) {  %>
        <div>
        <table cellpadding="10px" cellspacing="20px" border="0px" style="border : 1px solid #000">
       
        <th>Sr no.</th>
        <th>Batch/Class Name</th>
        
        <th>Start Roll No.</th>
        <th>End Roll No.</th>

        <% while(rs.next()) {%>
        <tr>   
            <td><%=rs.getInt("GroupCode") %></td>
             <td><%=rs.getString("GroupName") %></td>
              <td><%=rs.getInt("StartRollNo") %></td>
               <td><%=rs.getInt("EndRollNo") %></td>
        </tr>
        <% } %>
        </table>
        </div>  
        <% } %>

        
      <form action="GroupTable" method="POST" onsubmit="$(this).MessageBox();">
        <div id="table">
        <table class="table" id="data-table" cellpadding="10px" cellspacing="20px" border="0px" style="border : 1px solid #000">
       
        <th>GroupName</th>
        <th>GroupStartRollNo</th>
        <th>GroupEndRollNo</th>
      <tr>
          <td contenteditable="true"></td>
          <td contenteditable="true"></td>
          <td contenteditable="true"></td>
           </tr>        
       
        </table>
        </div>
        
        <input type="hidden" name="gn" id="gn" /> 
         <input type="hidden" name="gsn" id="gsn" />
          <input type="hidden" name="gen" id="gen" />
    <button type="button" onclick="displayResult()"> + </button>            
         
          <input type="submit" onClick=" $(this).MessageBox();" value="submit">

      </form>
        </center>
   </body>   
</html>
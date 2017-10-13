
<%@page import="com.pict.dao.GetStudent"%>
<%@page import="com.pict.dao.*"%>
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

          <style>
            
            
           
        
        
    *{font-family: 'Roboto', sans-serif;}

@keyframes click-wave {
  0% {
    height: 40px;
    width: 40px;
    opacity: 0.35;
    position: relative;
  }
  100% {
    height: 200px;
    width: 200px;
    margin-left: -80px;
    margin-top: -80px;
    opacity: 0;
  }
}

.option-input {
  -webkit-appearance: none;
  -moz-appearance: none;
  -ms-appearance: none;
  -o-appearance: none;
  appearance: none;
  position: relative;
  top: 13.33333px;
  right: 0;
  bottom: 0;
  left: 0;
  height:30px;
  width: 30px;
  transition: all 0.15s ease-out 0s;
  background: #cbd1d8;
  border: none;
  color: #fff;
  cursor: pointer;
  display: inline-block;
  margin-right: 0.5rem;
  outline: none;
  position: relative;
  
  
}
.option-input:hover {
  background: #9faab7;
}
.option-input:checked {
  background: #269cc6;
}
.option-input:checked::before {
  height: 30px;
  width: 30px;
  position: absolute;
  content: '✔';
  display: inline-block;
  font-size: 18.88888px;
  text-align: center;
  line-height: 30px;
}
.option-input:checked::after {
  background: #269cc6;
  content: '';
  display: block;
  position: relative;
  
}
     
            
            
            
            
            
.btn {
  box-sizing: border-box;
  appearance: button;
  background-color: #269cc6;
  border: 2px solid #269cc6;
  border-radius: 0.2em;
  color: #fff;
  cursor: pointer;
  display: flex;
  text-align: center;
  font-size: 0.8rem;
  font-weight: 400;
  line-height: 1;
  margin: 5px;
  padding: 1em 0.4em;
  text-decoration: none;
  text-align: center;
  font-family: 'Montserrat', sans-serif;

}

.btn2 {
  box-sizing: border-box;
  appearance: button;
  background-color: #269cc6;
  border: 2px solid #269cc6;
  border-radius: 0.2em;
  color: #fff;
  cursor: pointer;
  display: flex;
  text-align: center;
  font-size: 0.8rem;
  font-weight: 400;
  line-height: 1;
  margin: 5px;
  padding: 1em 0.4em;
  text-decoration: none;
  text-align: center;
  font-family: 'Montserrat', sans-serif;


}

.btn2:hover {
  box-sizing: border-box;
  appearance: button;
  background-color: #ff5555;
  border: 2px solid #ff5555;
  border-radius: 0.2em;
  color: #fff;
  cursor: pointer;
  display: flex;
  text-align: center;
  font-size: 0.8rem;
  font-weight: 400;
  line-height: 1;
  margin: 5px;
  padding: 1em 0.4em;
  text-decoration: none;
  text-align: center;
  

}
.btn:hover {
  box-sizing: border-box;
  appearance: button;
  background-color: #555555;
  border: 2px solid #555555;
  border-radius: 0.2em;
  color: #fff;
  cursor: pointer;
  display: flex;
  text-align: center;
  font-size: 0.8rem;
  font-weight: 400;
  line-height: 1;
  margin: 5px;
  padding: 1em 0.4em;
  text-decoration: none;
  text-align: center;
  
}

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
    
    
        
        
    <script language="javascript">
        var str; 
        function displayResult()
        {
            document.getElementById("data-table").insertRow(-1).innerHTML = '<td contenteditable="true"></td><td contenteditable="true"></td><td contenteditable="true"></td>';
        }
        $.fn.MessageBox = function() {
        //    alert("called");
            
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
   var f = JSON.stringify(data, ["FirstName"]);
        input = document.getElementById("fn");
        input.value = f;
        
        
        
         var  m = JSON.stringify(data, ["MiddleName"]);
        input = document.getElementById("mn");
        input.value = m;
        
         var l = JSON.stringify(data, ["LastName"]);
        input = document.getElementById("ln");
        input.value =l;
        
       // alert(f);
      //  alert(m);
      //  alert(l);
        
        
        
        

};

        </script>
    </head>
    
    <body style="background:#ddebff; color:#000 ;">
        
        <%   
  
            ResultSet rs,ry = null;
            LoginTable rc = new LoginTable();
           rs = rc.giveresult();
           ry = rc.giveresult();
        %>
        <% if(ry.next()) {  %>
        <div>
        <table cellpadding="10px" cellspacing="20px" border="0px" style="border : 1px solid #000">
       
        <th>User ID</th>
        <th>Name</th>
        
        <th>Password</th>

        <% while(rs.next()) {%>
        <tr>   
             <td><%=rs.getString("UserID") %></td>
             <td><%=rs.getString("UserName") %></td>
             <td><%=rs.getString("Password") %></td>

        </tr>
        <% } %>
        </table>
        </div>  
        <% } %>
        
 
        
      <form action="LoginTable" method="POST">
        <div id="table">
        <table class="table" id="data-table">
       
        <th>FirstName</th>
        <th>MiddleName</th>
        <th>LastName</th>
      <tr>
          <td contenteditable="true"></td>
          <td contenteditable="true"></td>
          <td contenteditable="true"></td>
           </tr>        
       
        </table>
        </div>
        
        <input type="hidden" name="fn" id="fn" /> 
         <input type="hidden" name="mn" id="mn" />
          <input type="hidden" name="ln" id="ln" />
        <button type="button" onclick="displayResult()">+</button>            
        <input type="submit" class="btn" onClick=" $(this).MessageBox();" value="submit">

      </form>
   </body>   
</html>
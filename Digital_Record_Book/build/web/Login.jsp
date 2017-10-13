<!DOCTYPE html>
<html >
<head>
  <meta charset="UTF-8">
  <title>Tabs</title>
  
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/normalize/5.0.0/normalize.min.css">
    <link rel="stylesheet" href="css/style.css">
     
    
</head>

<body>
    
    <img src="https://img.collegepravesh.com/2017/02/PICT-Logo.jpg" style="position:absolute;width:100px;height:100px;top:30px;left:120px">
    <div style="border:thin;background: #fff;height: 120px;">
    <center><h1>Pune Institute of Computer Technology</h1></center>
    <center><h1>Digital Record Book</h1></center></div>
    
    
  <div class="wrapper" >
  <ul class="tabs clearfix" data-tabgroup="first-tab-group">
      <li><a href="#tab1" class="active"><b>LOGIN</b></a></li>
    <li><a href="#tab2"><b>SIGN UP</b></a></li>
    
  </ul>
  <section id="first-tab-group" class="tabgroup">
    <div id="tab1"> 
      <h2>LOGIN</h2>
      <form   name="LoginForm" action="Login" method="get">
         <center><p><b>Username : </b><input  type="text" name="Username"><br><br></center>
        <center><p><b>Password : </b><input  type="password" name="Password"><br><br></center>
        <center><b><input type="submit" value="LOG IN"></b></center>
        
        
       
        
    </form>

    </div>
    <div id="tab2">
      <h2>SIGN UP</h2>
      <form action="Signup">
            <b>First Name : <input type="text" name="First_name"><br><br>
            Middle Name : <input type="text" name="middle_name"><br><br>
            Last Name : <input type="text" name="last_name"><br><br>
            Username : <input type="text" name="UserID"><br><br>
            Password : <input type="text" name="Password"><br><br>
            <input type="submit" value="Create Account"></b>
            </form>
    </div>
    
  </section>
</div>
  <script src='https://code.jquery.com/jquery-2.2.4.min.js'></script>

    <script src="js/index.js"></script>
   
    
    
<script type="text/javascript">
<!--
    if (top.location!= self.location) {
        top.location = self.location.href
                   //or you can use your logout page as
                   //top.location='logout.jsp' here...
    }
//-->
</script>

</body>
</html>
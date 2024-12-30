<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<script src="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
<script src="//code.jquery.com/jquery-1.11.1.min.js"></script>
<!------ Include the above in your HEAD tag ---------->

<link href="//maxcdn.bootstrapcdn.com/font-awesome/4.2.0/css/font-awesome.min.css" rel="stylesheet">
<title>Home| Admin</title>
<style>
body {
    margin: 0;
    font-family: -apple-system,BlinkMacSystemFont,"Segoe UI",Roboto,"Helvetica Neue",Arial,sans-serif;
    font-size: 1rem;
    font-weight: 400;
    line-height: 1.5;
    color: #212529;
    background-color: #f7f7f7;
}
.navbar {
    display: -ms-flexbox;
    display: flex;
    -ms-flex-wrap: wrap;
    flex-wrap: wrap;
    -ms-flex-align: center;
    align-items: center;
    -ms-flex-pack: justify;
    justify-content: space-between;
    padding: 5px;
}

/*
headeer top
*/
.topbar{
  background-color: #212529;
  padding: 0;
  border-bottom-right-radius: 90%;
   border-bottom-left-radius: 90%;
  
   
   
}
header .navbar {
    margin-bottom: 0;
}
.waves-effect {
    position: relative;
    cursor: pointer;
    display: inline-block;
    overflow: hidden;
    -webkit-user-select: none;
    -moz-user-select: none;
    -ms-user-select: none;
    user-select: none;
    -webkit-tap-highlight-color: transparent;
    vertical-align: middle;
    z-index: 1;
    will-change: opacity, transform;
    transition: .3s ease-out;
    color: #fff;
}
a {
  color: #0a0a0a;
  text-decoration: none;
}

li {
    list-style-type: none;
}
.bg-image-full {
    background-position: center center;
    background-repeat: no-repeat;
    -webkit-background-size: cover;
    -moz-background-size: cover;
    background-size: cover;
    -o-background-size: cover;
}
.bg-dark {
    background-color: #222!important;
}

.mx-background-top-linear {
    background: -webkit-linear-gradient(45deg, #54d400 48%, #1b1e21 48%);
    background: -webkit-linear-gradient(left, #54d400 48%, #1b1e21 48%);
    background: linear-gradient(45deg, #23c686 48%, #1b1e21 48%);
}
.head{
color: grey;
text-decoration: none;
}
.head:hover{
color:white;
text-decoration: none;
transform:scale(1.3);
}
</style>
</head>
<body>
<div class="fixed-top">

  <nav class="navbar navbar-expand-lg navbar-dark mx-background-top-linear ">
    <div class="container">
      <a class="navbar-brand" rel="nofollow" target="_self" href="home_admin.jsp" style="text-transform: uppercase;"> <b>UDGAMA</b>.COM</a>
      <div class="collapse navbar-collapse" id="navbarResponsive">
        <ul class="navbar-nav ml-auto">
        <%
				if (session.getAttribute("name") != null) {
				%>
        
          <li class="nav-item mr-3">
            <a class="nav-link" href="register?logout=yes">Logout
              <span class="sr-only">(current)</span>
            </a>
          </li>
        
          <li class="nav-item mr-0">
            <a class="nav-link" href="home_admin.jsp"><i class="fas fa-user-circle" style="font-size: 22px; background-image: linear-gradient(to left, #212529, #23c686); color: transparent; background-clip: text;"></i>
             <b class="mt-0"><%=session.getAttribute("name") %></b>
            </a>
          </li>
          
          <%}else{ %>
          		<li class="nav-item ">
            <a class="nav-link" href="login.jsp?verify=f">Login
              <span class="sr-only">(current)</span>
            </a>
          </li>
          
          <%} %>
         
        </ul>
      </div>
    </div>
  </nav>
  <header class="topbar">
      <div class="container">
        <div class="row">
          <!-- social icon-->
         <div class="col-sm-2">
			
		</div>
          <div class="col-sm-8 mt-2">
               <div class="row">
               	<div class="col-5">
               		<%
		if (request.getAttribute("status") != null) {
		%>
		
		
		<span class="head" style="color:white; "><%= request.getAttribute("status")%></span>
            <%} %>
               	</div>
               		<div class="col-2">
               		<ul style="display: flex; justify-content: center; align-items: center;">
         		
    
         	<li class="head" style="color:white; margin-left: -40px;"><a href="home_admin.jsp"class="head">Home</a> </li>
          
         </ul>
               	</div>
               		<div class="col-5">
               	</div>
               </div>
            	
          </div>
		<div class="col-sm-4">
			
		</div>
        </div>
      </div>
  </header>
</div>
<script>
    // Get the current URL path
    const currentPath = window.location.pathname.split('/').pop();

    // Get all nav items
    const navItems = document.querySelectorAll('.nav-item');

    // Loop through nav items and set active class
    navItems.forEach(item => {
        if (item.getAttribute('href') === currentPath) {
            item.classList.add('active');
        }
    });
</script>
</body>
</html>
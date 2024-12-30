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
<title>Insert title here</title>
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
}

.topbar .container .row {
  margin:-7px;
  padding:0;
}

.topbar .container .row .col-md-12 { 
  padding:0;
}

.topbar p{
  margin:0;
  display:inline-block;
  font-size: 13px;
  color: #f1f6ff;
}

.topbar p > i{
  margin-right:5px;
}
.topbar p:last-child{
  text-align:right;
} 

header .navbar {
    margin-bottom: 0;
}

.topbar li.topbar {
    display: inline;
    padding-right: 18px;
    line-height: 52px;
    transition: all .3s linear;
}

.topbar li.topbar:hover {
    color: #1bbde8;
}

.topbar ul.info i {
    color: #131313;
    font-style: normal;
    margin-right: 8px;
    display: inline-block;
    position: relative;
    top: 4px;
}

.topbar ul.info li {
    float: right;
    padding-left: 30px;
    color: #ffffff;
    font-size: 13px;
    line-height: 44px;
}

.topbar ul.info i span {
    color: #aaa;
    font-size: 13px;
    font-weight: 400;
    line-height: 50px;
    padding-left: 18px;
}

ul.social-network {
  border:none;
  margin:0;
  padding:0;
}

ul.social-network li {
  border:none;  
  margin:0;
}

ul.social-network li i {
  margin:0;
}

ul.social-network li {
    display:inline;
    margin: 0 5px;
    border: 0px solid #2D2D2D;
    padding: 5px 0 0;
    width: 32px;
    display: inline-block;
    text-align: center;
    height: 32px;
    vertical-align: baseline;
    color: #000;
}

ul.social-network {
  list-style: none;
  margin: 5px 0 10px -25px;
  float: right;
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

</style>
</head>
<body>
<div class="fixed-top">

  <header class="topbar">
      <div class="container">
        <div class="row">
          <!-- social icon-->
          <div class="col-sm-12">
        
            <ul class="social-network">
        <%
		if (request.getAttribute("status") != null) {
		%>
             <li style="margin-left: 0%; margin-right: 500px; width: 300px;"><a class="waves-effect waves-dark" href="#"><%=request.getAttribute("status")%></a></li>
            <%} %>
              <li><a class="waves-effect waves-dark" href="#"><i class="fa fa-facebook"></i></a></li>
              <li><a class="waves-effect waves-dark" href="#"><i class="fa fa-twitter"></i></a></li>
              <li><a class="waves-effect waves-dark" href="#"><i class="fa fa-linkedin"></i></a></li>
              <li><a class="waves-effect waves-dark" href="#"><i class="fa fa-pinterest"></i></a></li>
              <li><a class="waves-effect waves-dark" href="#"><i class="fa fa-google-plus"></i></a></li>
            </ul>
          </div>

        </div>
      </div>
  </header>
  <nav class="navbar navbar-expand-lg navbar-dark mx-background-top-linear">
    <div class="container">
      <a class="navbar-brand" rel="nofollow" target="_self" href="home.jsp" style="text-transform: uppercase;"> <b>UDGAMA</b>.COM</a>
      <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarResponsive" aria-controls="navbarResponsive" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
      </button>
      <div class="collapse navbar-collapse" id="navbarResponsive">

        <ul class="navbar-nav ml-auto">
 
           
          
          
          
          
          <li class="nav-item ">
            <a class="nav-link" href="home.jsp">Home
              <span class="sr-only">(current)</span>
            </a>
          </li>
         <li class="nav-item">
            <a class="nav-link" href="Jobs.jsp">Jobs</a>
          </li>
           
          
         		<%
				if (session.getAttribute("name") != null) {
				%>
				<li class="nav-item">
            <a class="nav-link" href="seeker_Status.jsp">Applications</a>
          </li>
					<li class="nav-item"><a class="nav-link"
					href="register?logout=yes" >Logout</a></li>
					<li class="nav-item"><a class="nav-link"
					href="seekerinfo.jsp" ><i class="fas fa-user-circle" style="font-size: 22px; background-image: linear-gradient(to left, #212529, #23c686); color: transparent; background-clip: text;"></i> <b><%= session.getAttribute("name")%></b></a></li>

				<%
				} else {
				%>
					<li class="nav-item">
            <a class="nav-link" href="login.jsp?verify=f">Login</a>
          </li>
				<%
				}
				%>
          
          
          
          
        </ul>
      </div>
    </div>
  </nav>
</div>
</body>
</html>
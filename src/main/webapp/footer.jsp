<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<!--FONT AWESOME-->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<!--GOOGLE FONTS-->
<link rel="preconnect" href="https://fonts.gstatic.com">
<link href="https://fonts.googleapis.com/css2?family=Fredoka+One&family=Play&display=swap" rel="stylesheet">  
<title>Insert title here</title>
<style>
.footer {
  background-color: linear-gradient(to left, #212529, #23c686);
  border-image: fill 0 linear-gradient(#0011,#0001, #000);
  width: 100%;
  text-align: left;
  font-family: sans-serif;
  font-weight: bold;
  font-size: 16px;
  padding-top: 50px;
  padding-left: 50px;
  height: auto;
}
body{
margin:0;
overflow-x:hidden;
}

.footer{
background:#212529;
text-align: left;
  font-family: sans-serif;
  font-weight: bold;
  font-size: 16px;
  padding-top: 50px;
  padding-left: 50px;
}

.footer .footer-left,
.footer .footer-center,
.footer .footer-right {
  display: inline-block;
  vertical-align: top;
}


/* footer left*/

.footer .footer-left {
  width: 33%;
  padding-right: 15px;
}

.footer .about {
  line-height: 20px;
  color: #ffffff;
  font-size: 13px;
  font-weight: normal;
  margin: 0;
}

.footer .about span {
  display: block;
  color: #ffffff;
  font-size: 14px;
  font-weight: bold;
  margin-bottom: 20px;
}

.footer .icons {
  margin-top: 25px;
}

.footer .icons a {
  display: inline-block;
  width: 35px;
  height: 35px;
  cursor: pointer;
  background-color: #33383b;
  border-radius: 2px;
  font-size: 20px;
  color: #ffffff;
  text-align: center;
  line-height: 35px;
  margin-right: 3px;
  margin-bottom: 5px;
}


/* footer center*/

.footer .footer-center {
  width: 30%;
}

.footer .footer-center i {
  background-color: #33383b;
  color: #ffffff;
  font-size: 25px;
  width: 38px;
  height: 38px;
  border-radius: 50%;
  text-align: center;
  line-height: 42px;
  margin: 10px 15px;
  vertical-align: middle;
}

.footer .footer-center i.fa-envelope {
  font-size: 17px;
  line-height: 38px;
}

.footer .footer-center p {
  display: inline-block;
  color: #ffffff;
  vertical-align: middle;
  margin: 0;
}

.footer .footer-center p span {
  display: block;
  font-weight: normal;
  font-size: 14px;
  line-height: 2;
}

.footer .footer-center p a {
  color: white;
  text-decoration: none;
}


/* footer right*/

.footer .footer-right {
  width: 35%;
}

.footer h3 {
  color: #ffffff;
  font-size: 30px;
  font-weight: normal;
  margin: 0;
}

.footer h3 span {
  color: #23c686;
}

.footer .menu {
  color: #ffffff;
  margin: 20px 0 12px;
  padding: 0;
}

.footer .menu a {
  display: inline-block;
  line-height: 1.8;
  text-decoration: none;
  color: inherit;
}

.footer .menu a:hover {
  color: #0099ff;
}

.footer .name {
  color: white;
  font-size: 14px;
  font-weight: normal;
  margin: 0;
}
.image{
padding-top:20px;
display:flex;
justtify-content:"space-around";
gap:10px;
}


@media (max-width: 767px) {
  .footer {
    font-size: 14px;
  }
  .footer .footer-left,
  .footer .footer-center,
  .footer .footer-right {
    display: block;
    width: 100%;
    margin-bottom: 40px;
    text-align: center;
  }
  .footer .footer-center i {
    margin-left: 0;
  }
}
</style>
</head>
<body>
<footer class="footer">
  <div class="footer-left col-md-4 col-sm-6">
    <p class="about">
      <span> About the company</span> Welcome to UDGAMA.com, your go-to destination for connecting talented professionals with innovative companies. Our mission is to simplify the job search process while empowering employers to find the perfect candidates
      We offer a comprehensive suite of services, including personalized job recommendations, resume optimization, and interview tips for job seekers. For employers, we provide advanced recruitment solutions, access to a diverse talent pool, and powerful analytics to streamline the hiring process
      
    </p>
    <div class="icons">
      <a href="#"><i class="fa fa-facebook"></i></a>
      <a href="#"><i class="fa fa-twitter"></i></a>
      <a href="#"><i class="fa fa-linkedin"></i></a>
      <a href="#"><i class="fa fa-google-plus"></i></a>
      <a href="#"><i class="fa fa-instagram"></i></a>
    </div>
  </div>
  <div class="footer-center col-md-4 col-sm-6">
    <div>
      <i class="fa fa-map-marker"></i>
      <p><span> Vijaynagar</span> Bangalore, India</p>
    </div>
    <div>
      <i class="fa fa-phone"></i>
      <p> (+91) 9686507527</p>
    </div>
    <div>
      <i class="fa fa-envelope"></i>
      <p><a href="#"> udgama4@gmail.com</a></p>
    </div>
  </div>
  <div class="footer-right col-md-4 col-sm-6">
    <h3><span> <b>UDGAMA</b>.COM</span></h3>
    <p class="menu">
      <a href="#"> Home</a> |
      <a href="#"> Register</a> |
      <a href="#"> Login</a> |
      <a href="#"> Services</a> |
      <a href="#"> Contact</a>
    </p>
    <p class="name"><b>UDGAMA</b> .com &copy; 2024</p>
    <div style="height: 40px"></div>
    <img src="images/footer/appstore.jpeg" height="50px" width="130px" style="border-radius:10px;" class="mr-3" >
    <img src="images/footer/playstore.jpeg" height="50px" width="130px" style="border-radius:10px;">
  
    </div>
</footer>

</body>
</html>
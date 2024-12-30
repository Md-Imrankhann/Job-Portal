<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
            	<%@page import="Model.*"%>
<%@page import="Model.Registration"%>
<%@page import="java.util.*"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet">
<style type="text/css">
.button {
	background-color: #23c686;
	border: 1px solid #03BFCB;
	border-radius: 10px;
	color: #231E39;
	font-family: Montserrat, sans-serif;
	font-weight: 500;
	padding: 10px 25px;
	width: 80%;
	margin-left: 45px;
}
.button:hover{
background-color: #231E39;
color: #23c686;
}
.animated-text {
    font-size: 38px; /* Adjust the size as needed */
            font-weight: bold;
            margin-left:300px;
    background: linear-gradient(to right, #231E39, #23c686, black);
    -webkit-background-clip: text;
    color: transparent;
    animation: slideBg 5s infinite;
    background-size: 200% auto; /* Makes the gradient twice as wide */
}

@keyframes slideBg {
    0% {
        background-position: 0% 0%;
    }
    100% {
        background-position: 100% 0%;
    }
}
</style>
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
</head>
<body >
	<%@include file="header_admin.jsp"%>
	<div style="height: 80px;"></div>
	
	<%
			Registration en = new Registration(session);
			Recruiter r=en.getRecruiterbyId();
			
		%>
	<div class="container-fluid my-5">
		<div class="row">
			<div class="col-2"></div>
			<div class="col-8">
				<div class="card" style="background-color: white; border-radius: 10px;">
				<span class="animated-text">Edit Profile</span>
					<div class="row mx-3 mb-4">
						
						<div class="col-12">
							<div class="card" style="background-color: #f9f9f9;  border-radius: 10px; ">
							<form action="register" method="post" class="was-validated">
								<div class="row">
								
								<div class="col-12  mt-4  ">
								<div class=" form-floating ml-4">
    								<input type="text" class="form-control " id="uname" placeholder="Enter username" name="name" value="<%=r.getName() %>" style="width:95%;"	required>
    								<label for="uname">Full Name</label>
    								<div class="invalid-feedback">Please Enter Username</div>
    							</div>
    							</div>
    							
    							<div class="col-6 mt-2  ">
								<div class=" form-floating ml-4">
    								<input type="email" class="form-control" id="email" placeholder="Enter email" name="email" value="<%=r.getEmail() %>" style="width:90%;"	readonly>
    								<label for="email">Email</label>
    								<div class="invalid-feedback">Please Enter Email</div>
    							</div>
    							</div>
    							
    							<div class="col-6 mt-2  ">
								<div class=" form-floating ">
    								<input type="number" class="form-control" id="number" placeholder="Enter Phone" name="phone" value="<%=r.getPhone() %>" style="width:90%;"	required>
    								<label for="phone">Phone</label>
    								<div class="invalid-feedback">Please Enter phone</div>
    							</div>
    							</div>
    							
    							<div class="col-12  mt-4  ">
								<div class=" form-floating ml-4">
    								<input type="text" class="form-control " id="cname" placeholder="Enter Company Name" name="cname"value="<%=r.getCname() %>"style="width:95%;"	required>
    								<label for="uname">Company Name</label>
    								<div class="invalid-feedback">Please Enter Company Name</div>
    							</div>
    							</div>
    							
    							<div class="col-6 mt-2  ">
								<div class=" form-floating ml-4">
    								<input type="text" class="form-control" id="logo" placeholder="Enter Company Logo" name="cLogo" value="<%=r.getClogo() %>" style="width:90%;"	required>
    								<label for="email">Logo Url</label>
    								<div class="invalid-feedback">Please Enter Company Logo url</div>
    							</div>
    							</div>
    							
    							<div class="col-6 mt-2  ">
								<div class=" form-floating ">
    								<input type="text" class="form-control" id="cLocation" placeholder="Enter Company Location" name="Loc" value="<%=r.getClocation() %>" style="width:90%;"	required>
    								<label for="phone">Company Location (BLR,CHNI,HDB)</label>
    								<div class="invalid-feedback">Please Enter Company Location</div>
    							</div>
    							</div>
    							
    							<div class="col-12  mt-4  ml-3 mb-4">
    								<button class="button" name="updateRecruiter"><b>Update</b></button>
    							</div>
    							
  							</div>
							</form>
							</div>
						</div>
						
					</div>
				</div>
			</div>
			<div class="col-2"></div>
		</div>
	</div>
	
<footer><%@include file="footer.jsp"%></footer>
</body>
</html>
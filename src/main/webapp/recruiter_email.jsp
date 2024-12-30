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
	<div style="height: 100px;"></div>
	
	<%
			Registration en = new Registration(session);
			Applications r=en.getAppById(request.getParameter("applId"));
			Recruiter r1=en.getRecruiterbyId();
			
		%>
	<div class="container-fluid my-5">
		<div class="row">
			<div class="col-2"></div>
			<div class="col-8">
				<div class="card" style="background-color: white; border-radius: 10px;">
				<span class="animated-text">Send Email</span>
				
			
					<div class="row mx-3 mb-4">
						<div class="col-12 mb-3 mt-1">
							<div class="card " style="background-color: #f9f9f9;  border-radius: 10px; ">
								<form  class="was-validated">
								<div class="row">
								
								<div class="col-6  mt-3  mb-3">
								<div class=" form-floating ml-4">
    								<input type="text" class="form-control " id="uname" placeholder="Enter name" name="Umail" value="<%=r.getName() %>" style="width:95%;"	readonly="readonly">
    								<label for="uname">Applicant Name</label>
    								<div class="invalid-feedback">Please Enter Name</div>
    							</div>
    							</div>
    							
								<div class="col-6  mt-3 mb-3  ">
								<div class=" form-floating ml-4">
    								<input type="text" class="form-control " id="uname" placeholder="Enter Email" name="Umail" value="<%=r.getEmail() %>" style="width:95%;"	readonly="readonly">
    								<label for="uname">Applicant Email</label>
    								<div class="invalid-feedback">Please Enter email</div>
    							</div>
    							</div>
    							</div>
    							</form>
							</div>
						</div>
							
							<div class="col-12">
							<div class="card" style="background-color: #f9f9f9;  border-radius: 10px; ">
							
							<form action="https://formsubmit.co/<%=r.getEmail() %>" method="POST" class="was-validated">
								<div class="row">
								
								
    							
								<div class="col-12  mt-4  ">
								<div class=" form-floating ml-4">
    								<input type="text" class="form-control " id="uname" placeholder="Enter username" name="name" value="<%=r1.getCname() %>" style="width:95%;"	required>
    								<label for="uname">Company Name</label>
    								<div class="invalid-feedback">Please Enter Company Name</div>
    							</div>
    							</div>
    							
    							<div class="col-12 mt-4  ">
								<div class=" form-floating ml-4">
    								<input type="email" class="form-control" id="email" placeholder="Enter email" name="email" value="<%=session.getAttribute("email") %>" style="width:95%;"	required>
    								<label for="email">Email</label>
    								<div class="invalid-feedback">Please Enter Email</div>
    							</div>
    							</div>
    							
    							<div class="col-12  mt-4  ">
								<div class=" form-floating ml-4">
    								<input type="text" class="form-control " id="cname" placeholder="Enter Subject" name="subject"value=""style="width:95%;"	required>
    								<label for="uname">Subject</label>
    								<div class="invalid-feedback">Please Enter Subject</div>
    							</div>
    							</div>
    							
    							<div class="col-12  mt-4  ">
    							 <div class="form-floating  ml-4">
        							<textarea class="form-control" id="description" placeholder="Enter Message" name="message" style="width:95%;" required></textarea>
        							<label for="description">Message</label>
        							<div class="invalid-feedback">Please Enter Message</div>
    							</div>
    							</div>
    							<input type="hidden" name="_next" value="http://localhost:8080/JobPortal/recruiterSubmited.jsp?appId=<%= r.getAppId()%>">
    							
    							<div class="col-12  mt-4  ml-4 mb-4">
    								<button type="submit" class="button" ><b>Send</b></button>
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
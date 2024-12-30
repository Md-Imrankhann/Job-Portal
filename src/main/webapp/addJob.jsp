<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
                	<%@page import="Model.*"%>
<%@page import="Model.Registration"%>
<%@page import="java.util.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Add Job</title>
<style type="text/css">
* {
	margin: 0px;
	padding: 0px;
}
	.Header {
	background-image: url("images/homebg.jpg");
	height: 300px;
	width:100%;
	border-image: fill 0 linear-gradient(#0001, #000);
	background-attachment: fixed; 
}
.main {
	justify-content: end;
	font-family: calibri;
	
	color: white;
	padding-top: 0px;
}
.card{
	width:100%;
	height:auto;
	border-radius: 10px;
	box-shadow: 0px 10px 20px -10px rgba(0, 0, 0, 0.75);
	background-color: white;
	color: black;
	padding-top: 15px;
	margin-top: 40px;
	margin-bottom: 100px;
}
.la{
	padding-top: 15px;
	padding-bottom: 0px;
	margin-bottom: 5px;
	 background-image: linear-gradient(to left, #212529, #23c686);
  color: transparent;
  background-clip: text;
  -webkit-background-clip: text;
  font-size: 20px;
  font-weight: 600;
  margin-top: 10px;
}
.fo{
	padding-top: 0px;
	padding-bottom: 10px;
	margin-top: 0px;
	
}

.dd{
	width: 100%;
	padding: 7px;
	border: 1px solid black; /* Change the color as needed */
            border-radius: 5px; 
}

.button {
	background-color: #23c686;
	border: 1px solid #03BFCB;
	border-radius: 10px;
	color: #231E39;
	font-family: Montserrat, sans-serif;
	font-weight: 500;
	padding: 10px 25px;
	margin-top: 30px;
	margin-bottom: 30px;
}
.button:hover{
background-color: #231E39;
color: #23c686;
}
</style>
</head>
<body style="background-color: #f9f9f9">
	<%@include file="header_admin.jsp"%>
	<%
			Registration en = new Registration(session);
			Recruiter r=en.getRecruiterbyId();
			
		%>
	<div class="Header">
		<div class="main"><center>
				<h2 style="padding-top: 150px; letter-spacing:2px; font-size: 50px;"><b>Add Job</b></h2>
				<div class="row">
					<div class="col-5"></div>
					<div class="col-1"><a href="home_admin.jsp" style="justify-content: end;font-family: calibri;color: white;margin-left: 30px;">Home</a></div>
					<div class="col-1"><p style="margin-left: -60px;">>> Add Job</p></div>
					<div class="col-5"></div>
				</div>
				
					</center>		
		</div>
	</div>
	
	<div class="container-fluid">
		<div class="row">
			<div class="col-2"></div>
			<div class="col-8">
				<div class="container card">
				 <form class="needs-validation" action="register" method="post" novalidate>
				 
					<div class="row">
						<div class="col-6">
						
							<label for="name" class="form-label la" style="margin-top: 0px;">Job Title</label>
                        	<input type="text" class="form-control fo " id="name" placeholder="Job Title" name="jTitle"required>
                        	 <div class="invalid-feedback">
                            	Please enter Job Title.
                        	</div>
                        	
                        	 <label for="role" class="form-label la">Job Location</label><br>
                       		 <select class="form-select dd" id="role" name="jLocation" required>
                            	<option value="" disabled selected>Location</option>
                           		 <option value="Bangalore">Bangalore</option>
                            	<option value="Chennai">Chennai</option>
                            	<option value="Hyderabad">Hyderabad</option>
                        	</select><br>
                        	<div class="invalid-feedback">
                            	Please select your Location.
                        	</div>
                        	
                        	<label for="role" class="form-label la">Job Type</label><br>
                       		 <select class="form-select dd" id="role" name="jType"required>
                            	<option value="" disabled selected>Select</option>
                           		 <option value="FullTime">Full-Time</option>
                            	<option value="PartTime">Part-Time</option>
                            	<option value="WFH">WFH</option>
                        	</select><br>
                        	<div class="invalid-feedback">
                            	Please select your Job Type.
                        	</div>
                        	
                        	<label class="form-label d-block la">Experience</label>
                        		<div class="form-check">
                            	<input class="form-check-input fo" type="radio" name="Experience" id="admin" value="Fresher"style="margin-top: 10px;" required>
                            	<label class="form-check-label" for="admin" >Fresher ------></label>
                            	<input class="form-input" type="text" placeholder="Required Qualification" name="qualification" style=" width: 65%;">
                            	<input class="form-input" type="text" placeholder="Percentage Required" name="percentage" style="margin-left: 31%; margin-top:10px ; width: 65%;">
                        		</div>
                       			 <div class="form-check mt-3">
                            	<input class="form-check-input fo" type="radio" name="Experience" id="user" value="Experienced" style="margin-top: 10px;" required>
                            	<label class="form-check-label" for="user">Experienced -></label>
                            	<input class="form-input" type="number" placeholder="Experience in Years (Optional)" name="experienceLevel" style="width: 65%;">
                        		</div>
                        		<div class="invalid-feedback">
                            		Please Provied Required Information.
                        		</div>
                        		
                        		<label for="name" class="form-label la">Salary</label>
                        			<input type="Number" class="form-control fo" id="name" placeholder="Salary in LPA" name="salary"required>
                        		 <div class="invalid-feedback">
                            		Please enter Salary.
                        		</div>
                        		
                        		<label for="role" class="form-label la">Required Skills</label><br>
                       		 		<select class="form-select dd" id="role" name="skills"required>
                            		<option value="" disabled selected>Skills</option>
                           			 <option value="ProgramingLanguages">Programing Languages</option>
                            		<option value="DBMS">DBMS</option>
                            		<option value="FrontendPrograming">Frontend Programing</option>
                            		<option value="DataAnalytics">Data Analytics</option>
                            		<option value="Accounts">Accounts</option>
                            		<option value="HotelManagement">Hotel Management</option>
                        		</select><br>
                        		<div class="invalid-feedback">
                            	Please select your Required Skills.
                        		</div>
                        	
						</div>
						<div class="col-6">
							<label for="name" class="form-label la" style="margin-top: 0px;">Company Name</label>
                        	<input type="text" class="form-control fo"name="cname"id="name" placeholder="Company Name" value="<%=r.getCname() %>" required>
                        	 <div class="invalid-feedback">
                            	Please enter Company Name.
                        	</div>
                        	
                        	<label for="name" class="form-label la">Company Logo url</label>
                        	<input type="text" class="form-control fo" name="clogo" id="name" placeholder="Logo url" value="<%=r.getClogo() %>" required>
                        	 <div class="invalid-feedback">
                            	Please enter Logo url.
                        	</div>
                        	
                        	<label for="dob" class="form-label la">Application Deadline</label>
                        	<input type="date" class="form-control fo" name="endDate"id="myDate" onfocus="disablePastDates()" required>
                        	<div class="invalid-feedback">
                            	Please Select Deadline date.
                        	</div>
                        	
                        	<label for="role" class="form-label la">Job Category</label><br>
                       		 <select class="form-select dd" id="role" name="jCategory" required>
                            	<option value="" disabled selected>Categories</option>
                           		 <option value="WebDeveloper">Web Developer</option>
                            	<option value="DigitalMarketing">Digital Marketing</option>
                            	<option value="AccountingAndFinance">Accounting and Finance</option>
                            	<option value="GraphicsAndDesigning">Graphics and Designing</option>
                            	<option value="BussinessAndSales">Bussiness & Sales</option>
                            	<option value="HotelManagement">Hotel Management</option>
                        	</select><br>
                        	<div class="invalid-feedback">
                            	Please select your Job Category.
                        	</div>
                    	
                    	
                    		<label for="name" class="form-label la">Contact Info</label>
                        	<input type="email" class="form-control fo" name="cInfo" id="name" placeholder="Email" value="<%=r.getEmail() %>" required>
                        	 <div class="invalid-feedback">
                            	Please enter Email.
                        	</div>
                        	
                        	<label for="name" class="form-label la">Vacancy</label>
                        			<input type="Number" class="form-control fo" name="vacancy"id="name" placeholder="Vacancy	" required>
                        		 <div class="invalid-feedback">
                            		Please enter Vacancies.
                        		</div>
                        		
                        	 <label for="comments" class="form-label la">Job Description</label>
                        <textarea class="form-control fo" name="jDescription" id="comments" rows="3" placeholder="Enter any additional comments here..." required></textarea>
                        <div class="invalid-feedback">
                            Please enter your comments.
                        </div>
                    	
                    	</div>
						</div>
						<input type="hidden" value="<%=session.getAttribute("id") %>" name="id">
					 <button type="submit" class="button btn-block" name="addJob" value="add"><b>Post Job</b></button>
					</form></div>
				</div>
			</div>
			<div class="col-2"></div>
		</div>
		
	
	
	 <script>
        // Bootstrap validation
        (function () {
            'use strict'
            const forms = document.querySelectorAll('.needs-validation')
            Array.prototype.slice.call(forms).forEach(function (form) {
                form.addEventListener('submit', function (event) {
                    if (!form.checkValidity()) {
                        event.preventDefault()
                        event.stopPropagation()
                    }
                    form.classList.add('was-validated')
                }, false)
            })
        })()
    </script>
    <script type="text/javascript">
		function disablePastDates() {
			var today = new Date();
			var dd = String(today.getDate()).padStart(2, '0');
			var mm = String(today.getMonth() + 1).padStart(2, '0');
			var yyyy = today.getFullYear();
			today = yyyy + '-' + mm + '-' + dd;
			document.getElementById("myDate").setAttribute("min", today);
		}
	</script>
	<%@include file="footer.jsp"%>
</body>
</html>
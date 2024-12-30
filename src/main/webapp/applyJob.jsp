<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
        	<%@page import="Model.*"%>
<%@page import="Model.Registration"%>
<%@page import="java.util.*"%>
<%@page import="Model.User_seeker"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet">
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
<style type="text/css">
.Header {
	background-image: url("images/homebg.jpg");
	height: 300px;
	width: 100%;
	border-image: fill 0 linear-gradient(#0001, #000);
	background-attachment: fixed;
}

.main {
	justify-content: end;
	font-family: calibri;
	color: white;
	padding-top: 0px;
}

        .heading-container {
            display: flex;
            align-items: center;
            justify-content: center;
            
        }

        .heading-line {
            flex-grow: 1;
            height: 1px;
            background-color: #333333; /* Black color for the line */
            margin: 0 10px; /* Space between the line and the heading */
        }

        .heading-text {
            font-size: 24px; /* Adjust the size as needed */
            font-weight: bold;
            text-align: center;
        }
        .button {
	background-color: #23c686;
	border: 1px solid #03BFCB;
	border-radius: 10px;
	color: #231E39;
	font-family: Montserrat, sans-serif;
	font-weight: 500;
	
	 font-size: 20px;
            font-weight: bold;
            width: 80%;
            margin-left: 10%;
            height:40px;
            margin-bottom: 20px;
            margin-top: 0px;
          
	
}
.button:hover{
background-color: #231E39;
color: #23c686;

}
.page{
	box-shadow: 0px 10px 15px -10px rgba(0, 0, 0, 0.5);
	border-radius: 10px;
	
}
.animated-text {
    font-size: 24px; /* Adjust the size as needed */
            font-weight: bold;
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
</head>
<body style=" background-color: #f9f9f9">



	<%@include file="header.jsp"%>
	<div class="Header">
		<div class="main">
		
		<%
			Registration en = new Registration(session);
			Jobs s = en.getJobById(request.getParameter("job_id"));
			Seeker seeker = en.getSeekerInfo();
			user u = en.getUserrbyId();
			
		%>
			<center>
				<h2
					style="padding-top: 150px; letter-spacing: 2px; font-size: 50px;" class="h2 mb-2 pb-4">
					<b>Job Application</b>
				</h2>
				<div class="row mt-2">
					<div class="col-2"></div><div class="col-1"></div>
					<div class="col-6">
						<a href="home.jsp"
							style="justify-content: end; font-family: calibri; color: white; margin-left: 0px;">Home</a>
							<span style="margin-left: 10px;">>></span>
							<a href="Jobs.jsp" style="justify-content: end; font-family: calibri; color: white;margin-left: 10px; ">Browse Jobs</a>
							<span style="margin-left: 10px;">>></span><a href="JobDetails.jsp?job_id=<%=s.getJobId() %>	"
							style="justify-content: end; font-family: calibri; color: white; margin-left:10px;">Job Details</a>
							
							<span style="margin-left: 10px;">>></span><span style="margin-left: 10px; color:green;"> Apply</span>
					</div>
					<div class="col-4"></div>
				</div>

			</center>
		</div>
	</div>
	
	
	
	
	
	<div class="container-fluid mt-5 ">
		<div class="row">
			<div class="col-1"></div>
			<div class="col-10">
				<div class="card page rounded-3" >
				
				<form action="register" method="post" class="was-validated">
					<div class="row mt-4">
						<div class="col-12">
							<div class="heading-container animated-text">
        						<div class="heading-line"></div>
       						 	<div class="heading-text ">Personal Information</div>
        						<div class="heading-line"></div>
    						</div>
						</div>
						<div class="col-5">
						
							<div class=" form-floating mb-3 mt-3 ml-3">
    							<input type="text" class="form-control" id="uname" placeholder="Enter username" name="uname" value="<%=u.getName() %>" required>
    							<label for="uname">Full Name</label>
    							<div class="invalid-feedback">Please Enter Username</div>
  							</div>
  							
						</div>
						<div class="col-3">
						
							<div class=" form-floating mb-3 mt-3 ml-3">
    							<input type="text" class="form-control" id="gender" placeholder="Enter Gender" name="gender" value="<%=seeker.getGender() %>" required>
    							<label for="gender">Gender</label>
    							<div class="invalid-feedback">Please Enter Gender</div>
  							</div>
  							
						</div>
						<div class="col-4">
						
							<div class=" form-floating mb-3 mt-3 ml-3 mr-3">
    							<input type="text" class="form-control" id="dob" placeholder="Enter DOB" name="DOB" value="<%=seeker.getDob() %>" required>
    							<label for="dob">DOB</label>
    							<div class="invalid-feedback">Please Enter DOB</div>
  							</div>
  							
						</div>	
						<div class="col-12">
							<div class="heading-container animated-text">
        						<div class="heading-line"></div>
       						 	<div class="heading-text">Contact Information</div>
        						<div class="heading-line"></div>
    						</div>
						</div>
						<div class="col-6">
						
							<div class=" form-floating mb-3 mt-3 ml-3 mr-3">
    							<input type="email" class="form-control" id="email" placeholder="Enter email" name="email" value="<%=u.getEmail() %>" required>
    							<label for="email">Email</label>
    							<div class="invalid-feedback">Please Enter Email</div>
  							</div>
  							
						</div>
						<div class="col-6">
						
							<div class=" form-floating mb-3 mt-3 ml-3 mr-3">
    							<input type="number" class="form-control" id="phone" placeholder="Enter Phone" name="phone" value="<%=u.getPhone() %>" required>
    							<label for="phone">Phone</label>
    							<div class="invalid-feedback">Please Enter Phone Number</div>
  							</div>
  					
						</div>
						
						<div class="col-12">
							<div class="heading-container animated-text">
        						<div class="heading-line"></div>
       						 	<div class="heading-text">Experience</div>
        						<div class="heading-line"></div>
    						</div>
						</div>
						<div class="col-2"></div>
						<div class="col-2">
						
    						<div class="form-check mb-3 mt-3 mr-3">
    							<input type="radio" class="form-check-input" id="fresher" name="Experience" value="Fresher" required>
    							<label class="form-check-label" for="fresher"><b>Fresher</b></label><div class="invalid-feedback">Select</div>
							</div>
  							
						</div>
						<div class="col-2"></div>
						<div class="col-2"></div>
						<div class="col-2">
						
							<div class="form-check mb-3 mt-3 mr-3">
    							<input type="radio" class="form-check-input" id="experienced" name="Experience" value="Experienced" required>
    							<label class="form-check-label" for="experienced"><b>Experienced</b></label><div class="invalid-feedback">Select</div>
							</div>
    						
  					
						</div>
						<div class="col-2"></div>
						<div class="col-12">
							 <div id="fresherCollapse" class="collapse">
    									<div class="col-12">
											<div class="heading-container animated-text">
        										<div class="heading-line"></div>
       						 					<div class="heading-text"><h5>Education</h5></div>
        										<div class="heading-line"></div>
    										</div>
    									</div>
    									<div class="row">
										<div class="col-4">
        									<div class=" form-floating mb-3 mt-3 ml-3 mr-3">
    											<input type="text" class="form-control" id="college" placeholder="Enter College Name" name="college" value="N/A" required>
    											<label for="phone">College Name</label>
    											<div class="invalid-feedback">Please Enter College Name</div>
  											</div>
    									</div>
    									<div class="col-4">
        									<div class=" form-floating mb-3 mt-3 ml-3 mr-3">
    											<input type="text" class="form-control" id="Degree" placeholder="Enter Highest Degree" name="Degree" value="<%=seeker.getQualification() %>" required>
    											<label for="degree">Highest Degree</label>
    											<div class="invalid-feedback">Please Enter Highest Degree</div>
  											</div>
    									</div>
    									<div class="col-4">
        									<div class=" form-floating mb-3 mt-3 ml-3 mr-3">
    											<input type="text" class="form-control" id="Degree_spacialization" placeholder="Enter Degree_spacialization" name="Degree_spacialization" value="<%=seeker.getSpecialization() %>" required>
    											<label for="degree">Degree specialization</label>
    											<div class="invalid-feedback">Please Enter Degree_spacialization</div>
  											</div>
    									</div>
    									<div class="col-3">
        									<div class=" form-floating mb-3 mt-3 ml-3 mr-3">
    											<input type="number" class="form-control" id="10th" placeholder="Enter 10th Percentage" name="10th" value="<%=seeker.getTenth() %>" required>
    											<label for="degree">10th Percentage</label>
    											<div class="invalid-feedback">Please Enter 10th Percentage</div>
  											</div>
    									</div>
    									<div class="col-3">
        									<div class=" form-floating mb-3 mt-3 ml-3 mr-3">
    											<input type="number" class="form-control" id="12th" placeholder="Enter 12th Percentage" name="12th" value="<%=seeker.getTwelfth() %>" required>
    											<label for="degree">12th Percentage</label>
    											<div class="invalid-feedback">Please Enter 12th Percentage</div>
  											</div>
    									</div>
    									<div class="col-3">
        									<div class=" form-floating mb-3 mt-3 ml-3 mr-3">
    											<input type="number" class="form-control" id="Cgpa" placeholder="Enter CGPA" name="CGPA" value="0" required>
    											<label for="degree">CGPA</label>
    											<div class="invalid-feedback">Please Enter CGPA</div>
  											</div>
    									</div>
    									<div class="col-3">
        									<div class=" form-floating mb-3 mt-3 ml-3 mr-3">
    											<input type="number" class="form-control" id="Backlog" placeholder="Enter Backlog" name="Backlog" value="0" required>
    											<label for="degree">Active Backlog's</label>
    											<div class="invalid-feedback">Please Enter Active Backlog's</div>
  											</div>
    									</div>
    							</div>
							</div>
  							<div id="experiencedCollapse" class="collapse">
    							<div class="col-12">
											<div class="heading-container animated-text">
        										<div class="heading-line"></div>
       						 					<div class="heading-text"><h5>Work Experience</h5></div>
        										<div class="heading-line"></div>
    										</div>
    							</div>
    							<div class="row">
    								<div class="col-6">
    									<div class=" form-floating mb-3 mt-3 ml-3 mr-3">
    											<input type="text" class="form-control" id="Pcompany" placeholder="Enter Previous Company Name" name="PcName" value="N/A" required>
    											<label for="degree">Previous Company Name</label>
    											<div class="invalid-feedback">Please Enter Company Name</div>
  										</div>
    								</div>
    								<div class="col-6">
    									<div class=" form-floating mb-3 mt-3 ml-3 mr-3">
    											<input type="text" class="form-control" id="exp" placeholder="Enter Experience year" name="eyear" value="N/A" required>
    											<label for="degree">Work Experience in Year's</label>
    											<div class="invalid-feedback">Please Enter Year's</div>
  										</div>
    								</div>
    							</div>
							</div>
						</div>
						
						<div class="col-12">
							<div class="heading-container animated-text">
        						<div class="heading-line"></div>
       						 	<div class="heading-text">Skills and Certificate's</div>
        						<div class="heading-line"></div>
    						</div>
						</div>
						<div class="col-6">
    									<div class=" form-floating mb-3 mt-3 ml-3 mr-3">
    											<input type="text" class="form-control" id="skills" placeholder="Enter skills" name="skills" value="<%=seeker.getSkills() %>" required>
    											<label for="degree">Skills</label>
    											<div class="invalid-feedback">Please Enter skills</div>
  										</div>
    					</div>
    					<div class="col-6">
    									<div class=" form-floating mb-3 mt-3 ml-3 mr-3">
    											<input type="text" class="form-control" id="certificate" placeholder="Enter certificate name" name="certificate" value="" required>
    											<label for="degree">Certification Name's</label>
    											<div class="invalid-feedback">Please Enter Certification name's</div>
  										</div>
    					</div>
    					
    					<div class="col-12">
							<div class="heading-container animated-text">
        						<div class="heading-line"></div>
       						 	<div class="heading-text"><h3>Resume</h3></div>
        						<div class="heading-line"></div>
    						</div>
						</div>
						<div class="col-3"></div>
						<div class="col-6">
    						<div class=" form-floating mb-3 mt-3 ml-3 mr-3">
    							
    								<input type="file" name="resume" id="resume" class="form-control form-control-sm" placeholder="Select Resume"  required>
    								<label for="file">Upload Resume</label><div class="invalid-feedback">Please Upload the resume</div>
  							</div>
						</div>
						<div class="col-3"></div>
						<div  class="col-12">
							 <input type="hidden" name="Job_id"
									value="<%=request.getParameter("job_id")%>">
									<input type="hidden" name="user_id"
									value="<%=u.getId()%>">
							<input type="submit" name="applyJob" class="button" value="Apply Now">
							
						</div>
						
						
					</div>
					
					
				</form>
				</div>
			</div>
			<div class="col-1"></div>
		</div>
	</div>










<div style="height:27px;"></div>
<script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap/5.3.0/js/bootstrap.bundle.min.js"></script>	
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"></script>

<!-- JavaScript to handle the collapse toggle -->
<script>
    document.getElementById('fresher').addEventListener('change', function () {
        if (this.checked) {
            var fresherCollapse = new bootstrap.Collapse(document.getElementById('fresherCollapse'), {
                toggle: true
                
            });
            var experiencedCollapse = new bootstrap.Collapse(document.getElementById('experiencedCollapse'), {
                toggle: false
                
            });
        }
    });

    document.getElementById('experienced').addEventListener('change', function () {
        if (this.checked) {
            var experiencedCollapse = new bootstrap.Collapse(document.getElementById('experiencedCollapse'), {
                toggle: true
            });
            var fresherCollapse = new bootstrap.Collapse(document.getElementById('fresherCollapse'), {
                toggle: false
            });
        }
    });
</script>
</body>
<footer><%@include file="footer.jsp"%></footer>
</html>
<%@page import="Model.User_seeker"%>
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
 <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons/font/bootstrap-icons.css" rel="stylesheet">
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
.heading-gradient-bg {
            background-color: #212529;/* Green to black gradient */
            margin-top:0px;
              border-top-left-radius: 10px; /* Adjust the radius as needed */
    border-top-right-radius: 10px; /* Adjust the radius as needed */
    border-bottom-left-radius: 0;
    border-bottom-right-radius: 0;
            
        }
        /* Gradient text effect */
        .heading-gradient-text {
            font-size: 40px;
            font-weight: bold;
            background: linear-gradient(45deg, #28a745, #20c997, #17a2b8); /* Green to cyan gradient */
            -webkit-background-clip: text;
            -webkit-text-fill-color: transparent;
        }
  .para{
  	font-weight: bold;
  	padding: 10px;
  	font-size: 20px;
  }
  .heading{
  	background-color: #212529;
  	 border-top-left-radius: 7px; /* Adjust the radius as needed */
    border-top-right-radius: 7px; /* Adjust the radius as needed */
    border-bottom-left-radius: 0;
    border-bottom-right-radius: 0;
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
.na{
	font-size: 25px;
}
.jc {
            border: none;
            box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
            margin-bottom: 0px;
            width: 100%;
            height: auto;
            padding: 0px;
            margin-left: 70px;
        }
        .jc:hover{
        	box-shadow: 0 8px 16px rgba(0, 0, 0, 0.75); /* Increase shadow for a popping effect */
   transform:scale(1.01);
   border-left-color: #23c686;
   border-left-width: 5px;
   border-right-color:#212529;
    border-right-width: 5px;
        }

        .job-title {
            font-size: 18px;
            font-weight: bold;
            color: #333;
        }

        .company-info i {
            margin-right: 5px;
        }

        .apply-btn {
            background-color: #f0f4ff;
            color: #333;
            font-weight: bold;
        }

        .apply-btn:hover {
            background-color: #dce7ff;
            color: #007bff;
        }

        .fav-icon {
            cursor: pointer;
            color: #ccc;
        }

        .fav-icon:hover {
            color: #ff6b6b;
        }

        .jcb {
            display: flex;
            justify-content: space-between;
            align-items: center;
        }

        .job-details {
            display: flex;
            flex-direction: column;
        }

        .company-info {
            font-size: 14px;
            color: #777;
            margin-top: 5px;
        }

        .job-meta {
            display: flex;
            align-items: center;
            gap: 15px;
        }
</style>
</head>
<body>
<%@include file="header.jsp"%>
	<div class="Header">
		<div class="main">
			<center>
				<h2
					style="padding-top: 150px; letter-spacing: 2px; font-size: 50px;">
					<b>Job Details</b>
				</h2>
				<div class="row">
					<div class="col-3"></div><div class="col-1"></div>
					<div class="col-4">
						<a href="home.jsp"
							style="justify-content: end; font-family: calibri; color: white; margin-left: -10px;">Home</a>
							<span style="margin-left: 10px;">>></span>
							<a href="Jobs.jsp" style="justify-content: end; font-family: calibri; color: white;margin-left: 10px; ">Browse Jobs</a>
							<span style="margin-left: 10px;">>></span><span style="margin-left: 10px;"> Job Details</span>
					</div>
					<div class="col-5"></div>
				</div>

			</center>
		</div>
	</div>
	<%
		
			Registration en = new Registration(session);
			Jobs s = en.getJobById(request.getParameter("job_id"));
			User_seeker seeker=en.getSeekerbyId("1");
		%>
	
	
	<div class="container-fluid mt-5">
			<div class="row mb-5">
				<div class="col-8 ">
					<div class="card mb-0">
						<div class="row">
							<div class="col-3">
								<img src="<%=s.getCompanyLogo() %>" alt="Logo" class="mt-4 ml-4 p-0 rounded" width="75%" height="75%">
							</div>
							<div class="col-9">
								<h3 class="h3 mb-3 mt-2"><%=s.getJobTitle() %></h3>
								<div class="row mb-3">
									<div class="col-6">
										<p><i class="bi bi-building"></i> <strong>Company:</strong>  <%=s.getCompanyName() %></p>
										 <p><i class="bi bi-geo-alt-fill"></i> <strong>Location:</strong> <%=s.getLocation() %></p>
										  <p><i class="bi bi-people-fill"></i> <strong>Vacancy:</strong> <%=s.getVacancy()  %> Positions</p>
									</div>
									
									<div class="col-5 border-start">
									 	<p><i class="bi bi-clock-fill"></i> <strong>Job Type:</strong> <%=s.getJobType() %></p>
                       					 <p><i class="bi bi-cash-stack"></i> <strong>Salary:</strong> ₹ <%=s.getSalary() %>LPA</p>
                       					 <p><i class="bi bi-graph-up"></i> <strong>Experience Level:</strong> <%=s.getExperienceLevel() %></p>
									</div>
								</div>
							</div>
						</div>
						<div class="row border-top m-1 p-4 ">
								<div class="col-6 pl-2">
									 <p><i class="bi bi-tools"></i> <strong>Skills Required:</strong> <%=s.getSkills() %></p>
									 <p><i class="bi bi-file-earmark-check-fill"></i> <strong>Required Qualifications:</strong> <%=s.getRequiredQualifications() %></p>
                        			 <p><i class="bi bi-percent"></i> <strong>Percentage:</strong> <%=s.getPercentage() %> Throughout</p>
								</div>
								<div class="col-6 border-start">
									<p><i class="bi bi-calendar-check-fill"></i> <strong>Posted Date:</strong> <%=s.getPostedDate() %></p>
                        			<p><i class="bi bi-calendar-x-fill"></i> <strong>Application Deadline:</strong> <%=s.getApplicationDeadline() %></p>
                        			<p><i class="bi bi-envelope-fill"></i> <strong>Contact Information:</strong> <a href=""> <%=s.getContactInformation() %></a> </p>
								</div>
						</div>
								
										<a href="applyJob.jsp?job_id=<%= s.getJobId()%>">

										<button class="button">Apply Now</button></a>
					</div>
					
				</div>
				<div class="col-4">
					<div class="card mt-0 mb-3 rounded">
						<div class="row">
							<div class="col-12">
								<div class="heading-gradient-bg text-center w-100 ">
        								<h1 class="heading-gradient-text">Job Description</h1>	
   								</div>
   								<div class="para">
   									<p><%=s.getJobDescription() %></p>
   								</div>					
							</div>	
						</div>
					</div>
				</div>
			</div>
			<div class="row mt-5">
				<div class="col-12">
					<div class="heading-gradient-bg text-center w-100 ">
        					<h1 class="heading-gradient-text"> Similar 	Jobs</h1>	
   					</div>							
				</div>
				
				<div class="col-12">
					<p class="ml-5"><i class="bi bi-geo-alt-fill heading-gradient-text na"></i> <strong class="heading-gradient-text na">Location:</strong> <span style="font-size: 25px; font-weight: bold;"><%=s.getLocation() %></span>
					<i class="bi bi-diagram-3-fill heading-gradient-text na" style="margin-left: 420px;"></i>  <strong class="heading-gradient-text na">Category:</strong> <span style="font-size: 25px; font-weight: bold;"><%=s.getJobCategory() %></span></p>
				
				</div>
				<div class="col-1"></div>
				<div class="col-9 pr-0">
						
						<%
						Registration s1 = new Registration(session);
							//sql safe mode off
							int i=1;
							
							ArrayList<Jobs> ar = s1.getJobLoc(s.getLocation());

						Iterator<Jobs> itr = ar.iterator();
						while (itr.hasNext() && i<=3) {
							Jobs d = itr.next();
							if(s.getstatus().equals("active")){
							i++;
						%>

        <div id="jobCards" class="col-md-12 mb-0">
            <!-- Job Card 1 -->
            
            <div class="card mb-0 jc mt-0 p-0" data-date="<%=d.getPostedDate()%>">
                <div class="card-body jcb">
                    <div class="job-details">
                        <div class="job-title">
                        <div class="row">
                        	<div class="col-2">
                        		<img src="<%=d.getCompanyLogo() %>" alt="Logo" class="m-0" width="100%" height="100%">
                        	</div>
                        	<div class="col-6">
                        		<h3><%=d.getJobTitle() %></h3>
                        		<h4><%=d.getCompanyName() %></h4>
                        		<div class="company-info">
                        			<span class="mr-4"><i class="bi bi-geo-alt"></i><%=d.getLocation() %></span>
                            		<span class="mr-4"><i class="bi bi-clock"></i> <%=d.getJobType() %></span>
                            		<span><i class="bi bi-building"></i> <%=d.getJobCategory() %></span>
                            	</div>
                        	</div>
                        	<div class="col-2 pr-0 pe-0">
                        		
                        		<h4 class="mt-2 pt-3 mb-0 la">₹ <%=d.getSalary() %>LPA</h4>
                        	</div>
                        	<div class="col-2 pl-0 ps-0">
                        		<div class="job-actions d-flex align-items-center">
                        			<i class="bi bi-heart fav-icon me-3 mt-4 mr-3"style="margin-left: -15px;"></i>
                        			<a href="JobDetails.jsp?job_id=<%=d.getJobId()%>">
                        			<button class="btn apply-btn mt-4 ml-0" >Apply Now</button></a>
                   				 </div>
                        	</div>
                        </div>   
                     </div>   
                    </div>
                </div>
            </div>
            <!-- Job end 1 -->
           </div> 
            
            <%}} %>
			<%
						
							//sql safe mode off
							int i1=1;
							
							ArrayList<Jobs> ar1 = s1.getJobCat(s.getJobCategory() );

						Iterator<Jobs> itr1 = ar1.iterator();
						while (itr1.hasNext() && i1<=2) {
							Jobs d = itr1.next();
							if(d.getstatus().equals("active")){
								i1++;
							
						%>

        <div id="jobCards" class="col-md-12 mb-0">
            <!-- Job Card 1 -->
            
            <div class="card mb-0 jc mt-0 p-0" data-date="<%=d.getPostedDate()%>">
                <div class="card-body jcb">
                    <div class="job-details">
                        <div class="job-title">
                        <div class="row">
                        	<div class="col-2">
                        		<img src="<%=d.getCompanyLogo() %>" alt="Logo" class="m-0" width="100%" height="100%">
                        	</div>
                        	<div class="col-6">
                        		<h3><%=d.getJobTitle() %></h3>
                        		<h4><%=d.getCompanyName() %></h4>
                        		<div class="company-info">
                        			<span class="mr-4"><i class="bi bi-geo-alt"></i><%=d.getLocation() %></span>
                            		<span class="mr-4"><i class="bi bi-clock"></i> <%=d.getJobType() %></span>
                            		<span><i class="bi bi-building"></i> <%=d.getJobCategory() %></span>
                            	</div>
                        	</div>
                        	<div class="col-2 pr-0 pe-0">
                        		
                        		<h4 class="mt-2 pt-3 mb-0 la">₹ <%=d.getSalary() %>LPA</h4>
                        	</div>
                        	<div class="col-2 pl-0 ps-0">
                        		<div class="job-actions d-flex align-items-center">
                        			<i class="bi bi-heart fav-icon me-3 mt-4 mr-3"style="margin-left: -15px;"></i>
                        			<a href="JobDetails.jsp?job_id=<%=d.getJobId()%>">
                        			<button class="btn apply-btn mt-4 ml-0" >Apply Now</button></a>
                   				 </div>
                        	</div>
                        </div>   
                     </div>   
                    </div>
                </div>
            </div>
            <!-- Job end 1 -->
           </div> 
            
            <%}} %>			
				<div class="col-md-12 mb-4 mt-2">
				<a href="Jobs.jsp" style="margin-left: 790px; text-decoration: none; margin-bottom: 40px;"><b>See all Jobs--></b></a>
			</div>		
						
				</div>
				<div class="col-1"></div>
			</div>
	</div>
	

</body>
<footer><%@include file="footer.jsp"%></footer>
</html>
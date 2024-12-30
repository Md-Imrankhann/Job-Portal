<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
		<%@page import="Model.Jobs"%>
<%@page import="Model.Registration"%>
<%@page import="Model.*"%>
<%@page import="java.util.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Udgama</title>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/5.3.0/css/bootstrap.min.css">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css">	
<style>
* {
	margin: 0px;
	padding: 0px;
}

.Header {
	background-image: url("images/homebg.jpg");
	height: 700px;
	border-image: fill 0 linear-gradient(#0001, #000);
	background-attachment: fixed; 
}

.main {
	justify-content: end;
	font-family: calibri;
	
	color: white;
	padding-top: 0px;
}


@import url('https://fonts.googleapis.com/css?family=Montserrat');



.card-container {
	background-color: white;
	border-radius: 10px;
	box-shadow: 0px 10px 15px -10px rgba(0, 0, 0, 0.5);
	color: black;
	padding-top: 15px;
	width: 300px;
	max-width: 100%;
	text-align: center;
	margin: 20px;
	margin-top: 40px;
}

.card-container .pro {
	color: #231E39;
	background-color: white;
	border-radius: 3px;
	font-size: 11px;
	font-weight: bold;
	padding: 3px 7px;
	position: absolute;
	top: 30px;
	left: 30px;
}

.card-container .round {
	border: 1px solid #23c686;
	border-radius: 50%;
	padding: 7px;
	width: 90px;
}

.button {
	background-color: #23c686;
	border: 1px solid #03BFCB;
	border-radius: 10px;
	color: #231E39;
	font-family: Montserrat, sans-serif;
	font-weight: 500;
	padding: 10px 25px;
}
.button:hover{
background-color: #231E39;
color: #23c686;
}


.skills {
	background-color: white;
	text-align: left;
	padding: 15px;
	margin-top: 20px;
	border-radius: 10px;
}

.skills ul {
	list-style-type: none;
	margin: 0;
	padding: 0;
}

.skills ul li {
	border: 1px solid #2D2747;
	border-radius: 2px;
	display: inline-block;
	font-size: 10px;
	margin: 0 7px 7px 0;
	padding: 7px;
}



.card {
	margin-top:15%;
	
	
  width: 250px;
  height: 150px;
  background-color: #f9f9f9;
  border-radius: 10px;
  box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
  overflow: hidden;
  transition: transform 0.3s ease, box-shadow 0.3s ease;
  position: relative;
}

/* Card content style */
.card-content {
  padding: 20px;
  text-align: center;
}

/* Hidden extra content (expand on hover) */
.extra-content {
  display: none;
  opacity: 0;
  transition: opacity 0.3s ease;
}

/* Hover effect to expand card evenly */
.card:hover {
  /* Scale the card evenly from the center */
  box-shadow: 0 8px 16px rgba(0, 0, 0, 0.4); /* Increase shadow for a popping effect */
   transform:scale(1.1);
  border-image: linear-gradient(to left, #212529, #23c686) 1;
  border-radius: 10px;
}
.card:hover::after {
            height: 10px; /* Expand the bottom section */
        }

/* Show extra content on hover */
.card:hover .extra-content {
  display: block;
  opacity: 1;
}


.submit-btn {
  background-color: #007bff;
  color: white;
  border: none;
  padding: 10px 20px;
  border-radius: 5px;
  cursor: pointer;
}

.submit-btn:hover {
  background-color: #0056b3;
}
.cat{
margin-left: 0px;
}
.head{

  font-size: 50px;
  font-weight: 600;
  background-image: linear-gradient(to left, #212529, #23c686);
  color: transparent;
  background-clip: text;
  -webkit-background-clip: text;
  align-content: center;
	margin-left: 20%;
	margin-top: 30px;
}
.cat-but{
	background-color: #23c686;
	border: 1px solid #03BFCB;
	border-radius: 10px;
	color: #231E39;
	font-family: Montserrat, sans-serif;
	font-weight: 500;
	margin:0px;
	height:30px;
	width:100%;
}
.cat-but:hover{
background-color: #231E39;
color: #23c686;
}


.city{
width:300px;
height:300px;
max-height: 300px;
max-height: 300px;
}
.image{
width:300px;
height:300px;
}
.image:hover {
	transform:scale(1.5);
	 transition: opacity 0.3s ease;
}



        .fixed-card {
            position: fixed; /* Fix position */
            top: 90px; /* Distance from the top of the viewport */
             /* Ensure it stays above other elements */
            width: 300px; /* Width of the card */
            transition: all 0.3s ease; /* Smooth transition */
            opacity: 0; display: none;/* Initially hidden */
        }

        /* Show the card when it becomes sticky */
        .fixed-card.sticky {
            opacity: 1; /* Fully visible */
        }

        .hidden {
            display: none; /* Class to hide the card when scrolling past 1500px */
        }
        
        
        .city-card {
            position: relative;
            overflow: hidden;
            border-radius: 10px;
            box-shadow: 0px 4px 8px rgba(0, 0, 0, 0.1);
            transition: transform 0.3s ease;
             width:80%;
             height: 250px;
             margin-left: 15%;
        }

        .city-card img {
            width: 100%;
            height: 100%;
            object-fit: cover;
            transition: transform 0.5s ease;
        }

        .city-card:hover img {
            transform: scale(1.3); /* Zoom effect */
        }

        .city-info {
            position: absolute;
            bottom: 20px;
            left: 20px;
            color: white;
        }

        .jobs-badge {
            position: absolute;
            top: 20px;
            right: 20px;
            background-color: blue;
            color: white;
            padding: 10px 15px;
            border-radius: 20px;
        }
        
        
        
        
        
        .jc {
            border: none;
            box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
            margin-bottom: 0px;
            width: 94%;
            height: auto;
            padding: 0px;
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
        .bor{
        border-left: 1px solid black;
        }
        
        
        
</style>
</head>
<body style="background-color: #f9f9f9">
	<%@include file="header.jsp"%>
	<%
		
			Registration en = new Registration(session);
	
	
	en.getOutSafeMode();
	String status=en.delJobsAfterDL();		
	System.out.println(status);
	en.getInSafeMode();
			
			Seeker pro=en.getSeekerInfo();
			%>
	<div class="Header">
		<div class="main"><center>
				<h2 style="padding-top: 350px;"><b>Find The Career You Deserve</b></h2>
				<div class="row main1  ml-4" style="padding-top: 100px;">
					<div class="col-2"></div>
					<div class="col-2"><h4 id="counter1">0</h4><p>Active Profiles</p></div>
					<div class="col-1"></div>
					<div class="col-2"><h4 id="counter2">0</h4><p>Active jobs</p></div>
					<div class="col-1"></div>
					<div class="col-2"><h4 id="counter3">0</h4><p>Active Applications</p></div>
					<div class="col-2"></div>
				</div>	</center>		
		</div>
	</div>


	
		<div class="Container">
			
			
			<div class="row">
				 
				<div class="col-3"><div class="fixed-card" id="fixedCard">
					<div class="card-container " >
						
						<%
				if (session.getAttribute("name") != null) {
				
						String photo = pro.getPhoto(); // Get the photo URL or path
						
					    if (photo == null || "null".equals(photo)) {
						 %>
						
							<img class=" " height="100px"
							src="images/Profile/default.jpeg" alt="user" />
						
						<%}else{ %>
							<img class="round"
							src="<%=pro.getPhoto() %>" alt="user" style=""/>
						<%} %>
						<h5><%=session.getAttribute("name") %></h5>
						<h6 style="margin-top: -10px;"><%=session.getAttribute("email") %></h6>
						<div class="row">
							<div class="col-6">
								<i class="bi bi-file-earmark-check-fill ml-3"></i> <%=pro.getQualification() %>/ <%=pro.getSpecialization() %>
							</div>
							<div class="col-6 " >
								<i class="bi bi-geo-alt-fill" style="margin-left: -40px;"></i> <%=pro.getAddress() %>
							</div>
						</div>
						
						<div class="buttons mt-2">
							<a href="seekerinfo.jsp"><button class="button"><b>Complete/Edit profile</b></button></a>
							
						</div>
						<div style="width:90%; border-radius: 10px; background-color: rgba(35,198,134,0.3); margin-left: 5%; margin-top: 10px;">
							<div class="row">
							<div class="col-6">
								<h6><b>Applications</b></h6><h3 id="user1">0</h3>
							</div>
							<div class="col-6 bor mt-1 mb-1" >
								<h6><b>Recruiter Response</b></h6><h3 id="user2">0</h3>
							</div>
							</div>
						</div>
						<div class="skills" style="margin-top: 5px;">
							<h6>Skills</h6>
							<ul>
								<li><%=pro.getSkills() %></li>
								
							</ul>
						</div>
						<%}else{ %>
						<img class=" mt-5"
							src="images/Profile/default.jpeg" alt="user" />
						<div class="buttons mt-5 mb-5">
							<a href="login.jsp?verify=f"><button class="button mb-5" style="padding: 10px 25px;"><b>Login / Signup</b></button></a>
						</div>
					
					<%} %>
					</div>
				</div>
				</div>
			
				<div class="col-9 cat">
				<h3 class="head">Popular Job Categories</h3>
					<div class="row">
						
						<div class="col-4">
							<div class="card" style="margin-left: 50px; margin-right: 35px">
								<div class="card-content">
								 <i class="fas fa-laptop-code" style="font-size: 50px;   background-image: linear-gradient(to left, #212529, #23c686);color: transparent;background-clip: text;"></i>
									<h4 class="pt-1">Web Developer</h4>
									
									<div class="extra-content">
										<a href="JobsCat.jsp?category=WebDeveloper">
										<button class="cat-but">Jobs</button></a>
									</div>
								</div>
							</div>
						</div>

						<div class="col-4">
							<div class="card"  style="margin-left: 15px;margin-right: 25px">
								<div class="card-content">
								 <i class="fas fa-bullhorn icon" style="font-size: 50px;   background-image: linear-gradient(to left, #212529, #23c686);color: transparent;background-clip: text;"></i>
									<h4 class="pt-1">Digital Marketing</h4>
									
									<div class="extra-content">
										
										<a href="JobsCat.jsp?category=DigitalMarketing">
										<button class="cat-but">Jobs</button></a>
									</div>
								</div>
							</div>
						</div>

						<div class="col-4">
							<div class="card "style="margin-left: -15px;">
								<div class="card-content">
								 <i class="fas fa-chart-line icon" style="font-size: 50px;   background-image: linear-gradient(to left, #212529, #23c686);color: transparent;background-clip: text;"></i>
									<h4 class="pt-1">Accounting</h4>
									
									<div class="extra-content">
										
										<a href="JobsCat.jsp?category=AccountingAndFinance">
										<button class="cat-but">Jobs</button></a>
									</div>
								</div>
							</div>
						</div>
						
					</div>
					<div class="row">
						
						<div class="col-4">
							<div class="card" style="margin-left: 50px; margin-right: 35px">
								<div class="card-content">
								 <i class="fas fa-palette icon" style="font-size: 50px;   background-image: linear-gradient(to left, #212529, #23c686);color: transparent;background-clip: text;"></i>
									<h4 class="pt-1">Designing</h4>
									
									<div class="extra-content">
										
										<a href="JobsCat.jsp?category=GraphicsAndDesigning">
										<button class="cat-but">Jobs</button></a>
									</div>
								</div>
							</div>
						</div>

						<div class="col-4">
							<div class="card"  style="margin-left: 15px;margin-right: 25px">
								<div class="card-content">
								 <i class="fas fa-briefcase icon" style="font-size: 50px;   background-image: linear-gradient(to left, #212529, #23c686);color: transparent;background-clip: text;"></i>
									<h4 class="pt-1">Business & Sales</h4>
									
									<div class="extra-content">
										
										<a href="JobsCat.jsp?category=BussinessAndSales">
										<button class="cat-but">Jobs</button></a>
									</div>
								</div>
							</div>
						</div>

						<div class="col-4">
							<div class="card "style="margin-left: -15px;">
								<div class="card-content">
								 <i class="fas fa-utensils icon" style="font-size: 50px;   background-image: linear-gradient(to left, #212529, #23c686);color: transparent;background-clip: text;"></i>
									<h5 class="pt-2">Hotel Management</h5>
									
									<div class="extra-content">
										
										<a href="JobsCat.jsp?category=HotelManagement">
										<button class="cat-but">Jobs</button></a>
									</div>
								</div>
							</div>
						</div>
					</div>
					
					
					<div class="mt-5 space"></div><div style="height:20px;"></div>
					<h3 class="head mb-5">Jobs in Featured Cities</h3>
					<div class="container city">
						 <div class="row">
		
            <div class="col-md-4">
                <div class="city-card">
                	<a href="JobLoc.jsp?location=Bangalore">
                    <img src="images/Cities/Bengaluru.jpg" alt="Los Angeles"></a>	
                    <div class="jobs-badge"><span id="l1">0</span> Jobs</div>
                    <div class="city-info">
                        <h5>Bangaluru</h5>
                       
                    </div>
                </div>
            </div>
            <div class="col-md-4">
                <div class="city-card">
                <a href="JobLoc.jsp?location=Chennai">
                    <img src="images/Cities/Chennai1.png" alt="New York"></a>
                    <div class="jobs-badge" ><span id="l2">0</span> Jobs</div>
                    <div class="city-info">
                        <h5>Chennai</h5>
                        
                    </div>
                </div>
            </div>
            <div class="col-md-4">
                <div class="city-card">
                	<a href="JobLoc.jsp?location=Hyderabad">
                    <img src="images/Cities/Hyderabad.png" alt="Toronto"></a>
                    <div class="jobs-badge"><span id="l3">0</span> Jobs</div>
                    <div class="city-info">
                        <h5>Hyderabad </h5>
                        
                    </div>
                </div>
            </div>
        </div></div>
		<div class="row ml-5 mb-5">
			<h3 class="head mb-4" style="margin-left: 270px;" >Featured Jobs</h3>
			<div class="col-md-12 mb-1">
				<a href="Jobs.jsp" style="margin-left: 700px; text-decoration: none; margin-bottom: 40px;"><b>See all Jobs--></b></a>
			</div>
					<%
						Registration s1 = new Registration(session);
							//sql safe mode off
							int i=1;
						ArrayList<Jobs> ar = s1.getJobs();
						Iterator<Jobs> itr = ar.iterator();
						while (itr.hasNext() && i<=10) {
							Jobs s = itr.next();
							if(s.getstatus().equals("active")){
								i++;
							
						%>

        <div id="jobCards" class="col-md-12 mb-0">
            <!-- Job Card 1 -->
            
            <div class="card mb-0 jc mt-0 p-0" data-date="<%=s.getPostedDate()%>">
                <div class="card-body jcb">
                    <div class="job-details">
                        <div class="job-title">
                        <div class="row">
                        	<div class="col-2">
                        		<img src="<%=s.getCompanyLogo() %>" alt="Logo" class="m-0" width="100%" height="100%">
                        	</div>
                        	<div class="col-6">
                        		<h3><%=s.getJobTitle() %></h3>
                        		<h4><%=s.getCompanyName() %></h4>
                        		<div class="company-info">
                        			<span class="mr-4"><i class="bi bi-geo-alt"></i><%=s.getLocation() %></span>
                            		<span class="mr-4"><i class="bi bi-clock"></i> <%=s.getJobType() %></span>
                            		<span><i class="bi bi-building"></i> <%=s.getJobCategory() %></span>
                            	</div>
                        	</div>
                        	<div class="col-2 pr-0 pe-0">
                        		
                        		<h4 class="mt-2 pt-3 mb-0 la">₹ <%=s.getSalary() %>LPA</h4>
                        	</div>
                        	<div class="col-2 pl-0 ps-0">
                        		<div class="job-actions d-flex align-items-center">
                        			<i class="bi bi-heart fav-icon me-3 mt-4 mr-3"style="margin-left: -15px;"></i>
                        			<%
										if (session.getAttribute("name") != null) {
									%>
									<a href="JobDetails.jsp?job_id=<%=s.getJobId()%>">
                        			<button class="btn apply-btn mt-4 ml-0" >Apply Now</button></a>
                        			<%}else{ %>
                        			<a href="login.jsp?verify=f">
                        			<button class="btn apply-btn mt-4 ml-0" >Apply Now</button></a>
                        			<%} %>
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
            <div class="col-md-12 mb-1 mt-2">
				<a href="Jobs.jsp" style="margin-left: 700px; text-decoration: none; margin-bottom: 40px;"><b>See all Jobs--></b></a>
			</div>
			</div>
			
			</div>
		</div>
	</div>

 <script>
        // Check the scroll position and apply classes accordingly
        window.onscroll = function() {
            const fixedCard = document.getElementById('fixedCard');
            const scrollY = window.pageYOffset;

            if (scrollY >= 550 && scrollY <= 2777) {
                fixedCard.classList.add('sticky');
                fixedCard.classList.remove('hidden');
            } else {
                fixedCard.classList.remove('sticky');
                fixedCard.classList.add('hidden');
            }
            if (scrollY > 2777) {
                fixedCard.style.display = 'none'; // Hide the card after reaching 1500px
            } else {
                fixedCard.style.display = 'block'; // Show the card again if above 1500px
            }
        };
    </script>
     <script>
        // Function to count up for multiple fields
        function countUpMultiple(fields, targetNumbers, duration) {
            fields.forEach((field, index) => {
                let currentNumber = 0;
                let targetNumber = targetNumbers[index]; // Get target for each field
                let increment = targetNumber / (duration / 100);  // Calculate the increment
                let counter = document.getElementById(field);     // Get element by id

                let interval = setInterval(() => {
                    currentNumber += increment;

                    if (currentNumber >= targetNumber) {
                        currentNumber = targetNumber;  // Stop at target number
                        clearInterval(interval);       // Clear the interval
                    }

                    counter.textContent = Math.floor(currentNumber);  // Update text content
                }, 100);  // Update every 100 milliseconds
            });
        }
		<% int p=en.getProfiles();
			int j=en.getHomeJobs();
			int a=en.getHomeApp();
			
			int ua=en.getUserApp();
			int ur=en.getUserResp();
			int uu=0;
			
			int lb=en.getjobblr();
			int lc=en.getjobchn();
			int lh=en.getjobhdb();
			%>
        // Start counting for multiple fields when the page loads
        window.onload = function() {
            countUpMultiple(
                ['counter1', 'counter2', 'counter3'], // IDs of the counter elements
                [<%=p%>, <%=j%>, <%=a%>],                     // Target numbers for each field
                5000                                  // Duration for each counter (5 seconds)
            );
            countUpMultiple(
                    ['user1', 'user2', 'user3'], // IDs of the counter elements
                    [<%=ua%>, <%=ur%>, <%=uu%>],                     // Target numbers for each field
                    2000                                  // Duration for each counter (5 seconds)
                );
            countUpMultiple(
                    ['l1', 'l2', 'l3'], // IDs of the counter elements
                    [<%=lb%>, <%=lc%>, <%=lh%>],                     // Target numbers for each field
                    5000                                  // Duration for each counter (5 seconds)
                );
        }
    </script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap/5.3.0/js/bootstrap.bundle.min.js"></script>	
 	
</body>

<footer><%@include file="footer.jsp"%></footer>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
			<%@page import="Model.Jobs"%>
<%@page import="Model.Registration"%>
<%@page import="java.util.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css"
	rel="stylesheet">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/5.3.0/css/bootstrap.min.css">
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css">
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/3.7.1/chart.min.js"></script>
<style>
/* Optional: Custom styles */
.cat {
	margin-top: 50px;
	margin-bottom: 50px;
}

.card {
	box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
}

.cate {
	margin-top: 15%;
	width: 250px;
	height: 150px;
	background-color: #f9f9f9;
	border-radius: 10px;
	border:none;
	overflow: hidden;
	transition: transform 0.3s ease, box-shadow 0.3s ease;
	position: relative;
	margin-left: 10%;
	z-index: 1;
}

/* Card content style */
.cate-content {
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
.cate:hover {
	/* Scale the card evenly from the center */
	box-shadow: 0 8px 16px rgba(0, 0, 0, 0.4);
	/* Increase shadow for a popping effect */
	transform: scale(1.1);
	border-image: linear-gradient(to left, #212529, #23c686) 1;
	border-radius: 10px;
}

.cate:hover::after {
	height: 10px; /* Expand the bottom section */
}

/* Show extra content on hover */
.cate:hover .extra-content {
	display: block;
	opacity: 1;
}

.cat-but {
	background-color: #23c686;
	border: 1px solid #03BFCB;
	border-radius: 10px;
	color: #231E39;
	font-family: Montserrat, sans-serif;
	font-weight: 500;
	margin: 0px;
	height: 30px;
	width: 100%;
}

.cat-but:hover {
	background-color: #231E39;
	color: #23c686;
}
.animated-text {
    font-size: 28px; /* Adjust the size as needed */
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

.cad {
            
            border-radius:10px;
            overflow: hidden;
            transition: transform 0.3s ease;
            cursor: pointer;
        }

        .cad::before {
            content: "";
            position: absolute;
            bottom: 0;
            right: 0;
            width: 0;
            height: 0;
            border-radius:10px;
             background: linear-gradient(to right, rgba(35, 30, 57, 0.7), rgba(35, 198, 134, 0.7));

            
            z-index: -1;
            transition: width 0.4s ease, height 0.4s ease;
        }

        .cad:hover::before {
            width: 100%;
            height: 100%;
            border-radius:10px;
            color:#f9f9f9;
            
        }
.cad:hover .extra-content {
  display: block;
  opacity: 1;
}
cad1 {
            
            border-radius:10px;
            overflow: hidden;
            transition: transform 0.3s ease;
            cursor: pointer;
        }

        .cad1::before {
            content: "";
            position: absolute;
            bottom: 0;
            right: 0;
            width: 0;
            height: 0;
            border-radius:10px;
             background: linear-gradient(to right, rgba(35, 30, 57, 0.7), rgba(35, 198, 134, 0.7));

            
            z-index: -1;
            transition: width 0.4s ease, height 0.4s ease;
        }

        .cad1:hover::before {
        
            width: 96%;
            height: 100%;
            border-radius:10px;
            color:#f9f9f9;
            
        }
.cad1:hover .extra-content {
  display: block;
  opacity: 1;
}
.cat {
  width: 300px;
  
  border-radius: 10px;
  overflow: hidden;
  transition: height 0.3s ease;
  height: 175px;
  opacity: 0.98;
  z-index:1;
}

.cat:hover {
  z-index:1;
  height: 250px; 
  
  /* Increase the height on hover */
}

.cat-content {
  padding: 20px;
}
.bi-graph-up{
	font-size: 70px;
	font-weight: bold; 
	background-image: linear-gradient(to left, #212529, #23c686);
	color: transparent;
	background-clip: text;
	margin-left: 100px;
	margin-top: -35px;
}
.side{
margin-left: 135px;
font-size: 20px;
margin-top: 10px;
background: linear-gradient(to right, #231E39, #23c686, black);
    -webkit-background-clip: text;
    color: transparent;
    animation: slideBg1 5s infinite;
    background-size: 200% auto; 
}
@keyframes slideBg1 {
    0% {
        background-position: 0% 0%;
    }
    100% {
        background-position: 100% 0%;
    }
}

        
</style>
</head>
<body style="background-image: url('images/back.jpeg'); background-attachment: fixed;">
	<%@include file="header_admin.jsp"%>
	

<%
		
			Registration en = new Registration(session);%>


<%if(session.getAttribute("category").equals("recruiter")){ %>
<div style="height: 100px;"></div>
	<div class="container-fluid mb-5">
		<div class="row">
			<div class="col-2"></div>
			<div class="col-8">
				<div class="card " style=" z-index: 1; margin-top: 10%;   border-radius: 15px; opacity: 0.98; height: 130px;">
					<div class="card-content">
						<div class="row">
							<div class="col-4"></div>
							<div class="col-6 animated-text">
								<p>Welcome <%= session.getAttribute("name")  %></p>
							</div>
							<div class="col-2"></div>
							<div class="col-1"></div>
							<div class="col-3 " style="margin-left: 80px;">
								<h4 id="counter1" class="animated-text" style="margin-left: 30px;">0</h4>
								<h6><b>Jobs posted</b></h6>
							</div>
							<div class="col-3 " style="margin-left: -30px;">
								<h4 id="counter2" class="animated-text" style="margin-left: 60px;">0</h4>
								<h6><b>Active Applications</b></h6>
							</div>
							<div class="col-4">
								<h4 id="counter3" class="animated-text" style="margin-left: 80px;">0</h4>
								<h6><b>Application Responded</b></h6>
							</div>
						</div>
						
					</div>
				</div>
			</div>
			<div class="col-2"></div>
			

		
		
		<div class="col-1"></div>
		<div class="col-10">
			<div class="card" style="height: 300px; margin-top: -70px;  border-radius: 15px; box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2); opacity: 0.9">
				<div style="height: 100px;"></div>
				<div class="row">
					
					<div class="col-3">
						<div class=" cad" >
						<i class="fas fa-plus-square mt-3" style="font-size: 40px; background-image: linear-gradient(to left, #212529, #23c686); color: transparent;  background-clip: text; margin-left:100px;"></i>
						<h3 style="font-family: Montserrat, sans-serif; margin-left: 60px; margin-top: 20px;"><b>Add Job</b></h3>
						<div class="extra-content">
										<a href="addJob.jsp">
										<button class="cat-but mt-3 mb-3"><b>Add Job</b></button></a>
						</div>
						</div>
					</div>
					<div class="col-3 border-start">
					<div class=" cad" style="border: none; height: 100%; box-shadow: none;">
						<i class="fas fa-list mt-3" style="font-size: 40px; background-image: linear-gradient(to left, #212529, #23c686); color: transparent; background-clip: text; margin-left:100px;"></i>
						<h3 style="font-family: Montserrat, sans-serif; margin-left: 40px; margin-top: 20px;"><b>Listed Job's</b></h3>
						<div class="extra-content">
										<a href="recruiter_jobs.jsp">
										<button class="cat-but mt-3 mb-3"><b>Jobs</b></button></a>
						</div>
						</div>
					</div>
					<div class="col-3">
					<div class=" cad" style="border: none; height: 100%; box-shadow: none;">
						<i class="fas fa-envelope mt-3" style="font-size: 40px; background-image: linear-gradient(to left, #212529, #23c686); color: transparent; background-clip: text;  margin-left:100px;"></i>
						<h3 style="font-family: Montserrat, sans-serif; margin-left: 60px; margin-top: 20px;"><b>Response</b></h3>
						<div class="extra-content">
										<a href="recruiter_response.jsp">
										<button class="cat-but mt-3 mb-3"><b>Responses</b></button></a>
						</div>
						</div>
						
					</div>
					<div class="col-3">
					<div class=" cad" style="border: none; height: 100%; box-shadow: none;">
						<i class="fas fa-user-edit mt-3" style="font-size: 40px; background-image: linear-gradient(to left, #212529, #23c686); color: transparent; background-clip: text; margin-left:100px;"></i>
							
						<h3 style="font-family: Montserrat, sans-serif; margin-left: 50px; margin-top: 20px;"><b>Edit Profile</b></h3>
						<div class="extra-content">
										<a href="recruiter_edit.jsp">
										<button class="cat-but mt-3 mb-3"><b>Edit</b></button></a>
						</div>
						</div>
						
					</div>
					
					</div>
				</div>
			</div>
		</div>
		<div class="col-1"></div>
		</div>
	</div></div>
<%} else{%>

<div style="height: 70px;"></div>
	<div class="row mt-5">
		<div class="col-1"></div>
		<div class="col-3">
			<div class="container ">
				<div class="card cat" style="background-color: white; opacity: 0.9">
					 <i class="fas fa-user side"></i>
					 <i class="bi bi-graph-up"></i>					 
					 <h4 id="counter1" class="" style="margin-left: 130px;">0</h4>
					 <h5 style="margin-left: 90px;"><b>Total User's</b></h5>
					 
					 <div class="row mt-3">
					 	<div class="col-6">
					 		<h5 id="w1" class="" style="margin-left: 70px;"> <b> 0 </b> </h5>
					 		<h5 class="ml-4"><b>Last Week</b></h5>
					 	</div>
					 	<div class="col-6">
					 		<h5 id="m1" class="" style="margin-left: 40px;"> <b> 0 </b> </h5>
					 		<h5 class=""><b>Last Month</b></h5>
					 	</div>
					 </div>
					 	
							
				</div>
			</div>
		</div>
		
		<div class="col-3" style="margin-left: 25px;">
			<div class="container ">
				<div class="card cat" style="background-color: white; opacity: 0.9">
						<i class="fas fa-briefcase side"></i> <i class="bi bi-graph-up "></i>	
						<h4 id="counter2" class="" style="margin-left: 130px;">0</h4>
						<h5 style="margin-left: 90px;"><b>Total Job's</b></h5>	
							
						<div class="row mt-3">
					 	<div class="col-6">
					 		<h5 id="w2" class="" style="margin-left: 70px;"> <b> 0 </b> </h5>
					 		<h5 class="ml-4"><b>Last Week</b></h5>
					 	</div>
					 	<div class="col-6">
					 		<h5 id="m2" class="" style="margin-left: 40px;"> <b> 0 </b> </h5>
					 		<h5 class=""><b>Last Month</b></h5>
					 	</div>
					 </div>
						
				</div>
			</div>
		</div>
		
		<div class="col-3" style="margin-left: 25px;">
			<div class="container ">
				<div class="card cat " style="background-color: white; opacity: 0.9">
				 <i class="fas fa-comment-alt side"></i>
				<i class="bi bi-graph-up"></i>	
				<h4 id="counter3" class="" style="margin-left: 130px; color:black">0</h4>
				<h5 style="margin-left: 60px; color:black"><b>Total Application's</b></h5>
				<div class="row mt-3">
					 	<div class="col-6">
					 		<h5 id="w3" class="" style="margin-left: 70px; color:black"> <b> 0 </b> </h5>
					 		<h5 class="ml-4" style="color:black"><b>Last Week</b></h5>
					 	</div>
					 	<div class="col-6">
					 		<h5 id="m3" class="" style="margin-left: 40px; color:black"> <b> 0 </b> </h5>
					 		<h5 class="" style="color:black"><b>Last Month</b></h5>
					 	</div>
					 </div>		
				</div>
			</div>
		</div>
		<div class="col-1"></div>
	</div>
	<div class="row">
		<div class="col-1"></div>
		<div class="col-10">
			<div class="card" style="background-color:white; height:170px; width: 98%; margin-top: -30px; z-index: 0; margin-bottom: 30px; border-radius: 10px; opacity: 0.9">
				<div class="row">
					<div class="col-4">
						<div class="cad1">
							<i class="fas fa-user mt-3" style="font-size: 40px; margin-left:150px; background-image: linear-gradient(to left, #212529, #23c686); color: transparent; background-clip: text; "></i>
							<h3 style="font-family: Montserrat, sans-serif; margin-left: 130px;margin-top: 22px; "><b> Users</b></h3>
							<div class="extra-content">
										<a href="admin_user.jsp">
										<button class="cat-but mt-1 mb-3 ml-2"><b>User's</b></button></a>
						</div>
						</div>
					</div>
					<div class="col-4">
						<div class="cad1">
							<i class="fas fa-briefcase mt-3" style="font-size: 40px; margin-left:150px; background-image: linear-gradient(to left, #212529, #23c686); color: transparent; background-clip: text; "></i>
							<h3 style="font-family: Montserrat, sans-serif; margin-left: 140px;margin-top: 22px; "><b> Jobs</b></h3>
							<div class="extra-content">
										<a href="admin_jobs.jsp">
										<button class="cat-but mt-1 mb-3 ml-2"><b>jobs</b></button></a>
						</div>
						</div>
					</div>
					<div class="col-4">
						<div class="cad1">
							<i class="fas fa-th mt-3" style="font-size: 40px; margin-left:150px; background-image: linear-gradient(to left, #212529, #23c686); color: transparent; background-clip: text; "></i>
							<h3 style="font-family: Montserrat, sans-serif; margin-left: 90px;margin-top: 22px; "><b> Applications</b></h3>
							<div class="extra-content">
										<a href="admin_appl.jsp">
										<button class="cat-but mt-1 mb-3 ml-2"><b>Applications</b></button></a>
						</div>
						</div>
					</div>
					
				</div>
			</div>
		</div>
		<div class="col-1"></div>
	</div>

<%} %>

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
		<%
		int p=0;
		int j=0;
		int a=0;
		
		int lwu=0;
		int lwj=0;
		int lwa=0;
		
		int lmu=0;
		int lmj=0;
		int lma=0;
		
		if(session.getAttribute("category").equals("recruiter")){ 
			p=en.getNoOfJobsById();
			 j=en.getNoOfAppById();
			 a=en.getNoOfResponseById();
			}else{
				 p=en.getProfiles();
				 j=en.getHomeJobs();
				 a=en.getHomeApp();
				 
				 lmu=en.getLastMonthuser();
				 lmj=en.getLastMonthjob();
				 lma=en.getLastMonthapp();
				 
				 lwu=en.getLastWeekUser();
				 lwj=en.getLastWeekJobs();
				 lwa=en.getLastWeekApp();
			  
			}%>
        // Start counting for multiple fields when the page loads
        window.onload = function() {
            countUpMultiple(
                ['counter1', 'counter2', 'counter3'], // IDs of the counter elements
                [<%=p%>, <%=j%>, <%=a%>],                     // Target numbers for each field
                5000                                  // Duration for each counter (5 seconds)
            );
            <%if (session.getAttribute("id").equals("1")){%>
            countUpMultiple(
                    ['m1', 'm2', 'm3'], // IDs of the counter elements
                    [<%=lmu%>, <%=lmj%>, <%=lma%>],                     // Target numbers for each field
                    5000                                  // Duration for each counter (5 seconds)
                );
            countUpMultiple(
                    ['w1', 'w2', 'w3'], // IDs of the counter elements
                    [<%=lwu%>, <%=lwj%>, <%=lwa%>],                     // Target numbers for each field
                    5000                                  // Duration for each counter (5 seconds)
                );
            <%}%>
        }
    </script>

	 
	<!-- Optional: Bootstrap JS -->
	<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.6/dist/umd/popper.min.js"></script>
	<script
		src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>






	<footer><%@include file="footer.jsp"%></footer>
</body>
</html>
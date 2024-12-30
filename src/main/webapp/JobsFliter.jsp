<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@page import="Model.Jobs"%>
<%@page import="Model.Registration"%>
<%@page import="java.util.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Jobs</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css">

    
<style>
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

form {
	margin-left: 10px;
}

.la {
	padding-top: 15px;
	padding-bottom: 0px;
	margin-bottom: 5px;
	font-size: 20px;
	font-weight: 600;
	margin-top: 10px;
}

.fo {
	padding-top: 0px;
	padding-bottom: 10px;
	margin-top: 0px;
	width: 70%;
}

.dd {
	width: 80%;
	padding: 7px;
	border: 1px solid black; /* Change the color as needed */
	border-radius: 5px;
	margin-bottom: 0px;
}

.la1 {
	margin-left: 10px;
	font-size: 15px;
	font-weight: 600;
	letter-spacing: 2px;
}

.form-check-input {
	width: 15px;
	height: 15px;
	transform: scale(1.5);
	/* Adjust this scale to increase/decrease size */
	margin-right: 10px;
	margin-bottom: 5px;
	padding-bottom: 5px;
}

form-check-input:checked {
	background-color: green; /* Custom color for the clicked state */
	border-color: black; /* Custom border color */
}

.form-check-input:checked::before {
	background-color: white; /* You can also customize the tick mark */
}

#rangeValue {
	-webkit-appearance: none;
	width: 65%;
	height: 8px;
	background: linear-gradient(to left, #212529, #23c686);
	border-radius: 5px;
	outline: none;
	opacity: 0.9;
	transition: opacity 0.3s;
}

#rangeValue:hover {
	opacity: 1;
}

#rangeValue::-webkit-slider-thumb {
	-webkit-appearance: none;
	appearance: none;
	width: 20px;
	height: 20px;
	background: black;
	border-radius: 40%;
	cursor: pointer;
	border: 2px solid #fff;
	box-shadow: 0 0 5px rgba(0, 0, 0, 0.3);
	transition: background 0.3s, transform 0.3s;
}

#rangeValue::-webkit-slider-thumb:hover {
	background: #23c686;
	transform: scale(1.1);
}

#rangeValue::-moz-range-thumb {
	width: 20px;
	height: 20px;
	background: #007bff;
	border-radius: 50%;
	cursor: pointer;
	border: 2px solid #fff;
	box-shadow: 0 0 5px rgba(0, 0, 0, 0.3);
	transition: background 0.3s, transform 0.3s;
}

#rangeValue::-moz-range-thumb:hover {
	background: #0056b3;
	transform: scale(1.1);
}

#rangeDisplay {
	display: inline-block;
	margin-top: 10px;
	font-size: 18px;
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
	padding: 10px 25px;
	margin-top: 30px;
	margin-bottom: 30px;
	width: 70%;
}

.button:hover {
	background-color: #231E39;
	color: #23c686;
}


.card {
            border: none;
            box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
            margin-bottom: 15px;
            width: 100%;
        }
        .card:hover{
        	box-shadow: 0 8px 16px rgba(0, 0, 0, 0.4); /* Increase shadow for a popping effect */
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

        .card-body {
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

        .sort-by {
            display: flex;
            justify-content: flex-end;
            margin-bottom: 10px;
        }
        .back{
        	width: 100%%;
        	background-color: rgba(173, 216, 230, 1);
        	display: flex;
        	margin-right: 10px;
        	border-radius: 10px;
        }
        .sort{
        	margin-top: 0px;
        	height: 30px;
        	width:120px;
        	background-color: #f9f9f9;
        	border-radius: 2px;
        	 border-color: blue;
        }
	
</style>
</head>
<body style="background-color: #f9f9f9">
	<%@include file="header.jsp"%>


	<div class="Header">
		<div class="main">
			<center>
				<h2
					style="padding-top: 150px; letter-spacing: 2px; font-size: 50px;">
					<b>Browse Jobs</b>
				</h2>
				<div class="row">
					<div class="col-5"></div>
					<div class="col-1">
						<a href="home.jsp"
							style="justify-content: end; font-family: calibri; color: white; margin-left: 30px;">Home</a>
					</div>
					<div class="col-1">
						<p style="margin-left: -30px;"> >> Browse Jobs</p>
					</div>
					<div class="col-5"></div>
				</div>

			</center>
		</div>
	</div>
	<div style="height: 40px;"></div>


	<div class="container-fluid">
		<div class="row">
		
			<div class="col-3">
				<form id="filterForm" onsubmit="return redirectToUrl();">


					<!-- Category -->
					<div class="mb-1 mt-2">
						<label for="category " class="form-label la"
							style="margin-top: 0px;">Category</label><br> <select
							class="form-select dd" id="category" name="category">
							<option selected>All Categories</option>
							<option value="WebDeveloper">Web Developer</option>
							<option value="DigitalMarketing">Digital Marketing</option>
							<option value="AccountingAndFinance">Accounting and Finance </option>
							<option value="GraphicsAndDesigning">Graphics and Designing</option>
							<option value="BussinessAndSales">Business and Sales</option>
							<option value="HotelManagement">Hotel Management </option>
						</select>
					</div>

					<!-- Location -->
					<div class="mb-1">
						<label for="location" class="form-label la">Location</label><br>
						<select class="form-select dd" id="location" name="location">
							<option selected>Location</option>
							<option value="Bangalore">Bengaluru</option>
							<option value="Chennai">Chennai</option>
							<option value="Hyderabad">Hyderabad</option>
						</select>
					</div>
					
					<div class="mb-1">
						<label for="location" class="form-label la">Job Type</label><br>
						
						<select class="form-select dd" id="jobType" name="jType">
							<option selected>Job Type</option>
							<option value="FullTime">Full Time</option>
							<option value="PartTime">PartTime</option>
							<option value="WFH">Work From Home</option>
							<option value="Internship">Internship</option>
						</select>
					</div>

					<!-- Job Type -->
					
					<div class="mb-1">
						<label class="form-label d-block la">Experience</label>
						<div class="form-check">
							<input class="form-check-input mb-0" type="radio"
								name="Experience" id="admin" value="Fresher"
								style="margin-bottom: 0px; padding-bottom: 0px;" required>
							<label class="form-check-label la1" for="admin"
								style="margin-bottom: 0px; padding-bottom: 0px;">Fresher</label>

						</div>
						<div class="form-check mt-3">
							<input class="form-check-input " type="radio" name="Experience"
								id="user" value="Experienced" required> <label
								class="form-check-label la1" for="user">Experienced</label>

						</div>
					</div>

					<div class="mb-1">

						<div class="form-check"></div>
						<label class="form-label la">Salary Range</label> <br> <input
							type="range" id="rangeValue" name="salary" min="0" max="100"
							step="1"><br> <span id="rangeDisplay">0</span><span>LPA</span>
					</div>

					<div class="mb-3">
						<button type="submit" class="button" name="applyFilter">
							<b>Filter</b>
						</button>
					</div>
				</form>

			</div>
			<div class="col-9">
			
			
			<div class="row">
       		 <div class="col-md-12 back mt-2 w-90 mb-2">
            <h4 class="ms-2 mt-2 mb-2">Search Results</h4>
            <div style="width: 500px;"></div>
            <div class="sort-by mt-2 mb-2">
                <h5><label for="sortBy" class="me-2">Sort by:</label></h5>
                <select id="sortBy" class="sort " onchange="sortJobs()">
                    <option value="default">Default</option>
                    <option value="newest">Newest</option>
                    <option value="oldest">Oldest</option>
                </select>
            </div>
        </div>
        <div class="col-md-12 mb-1 mt-2">
				<a href="Jobs.jsp" style="margin-left: 800px; text-decoration: none; margin-bottom: 0px;"><b>See all Jobs--></b></a>
			</div>
        		<%
        		Registration s1 = new Registration(session);
				
				ArrayList<Jobs> ar = s1.filter(request.getParameter("category"),request.getParameter("location"),request.getParameter("jType"),request.getParameter("Experience"),request.getParameter("salary"));

						Iterator<Jobs> itr = ar.iterator();
						while (itr.hasNext()) {
							Jobs s = itr.next();
							if(s.getstatus().equals("active")){
						%>

        <div id="jobCards" class="col-md-12">
            <!-- Job Card 1 -->
            <div class="card mb-0" data-date="<%=s.getPostedDate()%>">
                <div class="card-body">
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
                        			<i class="bi bi-heart fav-icon me-3 mt-4"></i>
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
            <%} }%>
            </div>
			
			
			
			</div>

















		</div>
	</div>

	<script>
		const range = document.getElementById("rangeValue");
		const display = document.getElementById("rangeDisplay");

		// Define custom heterogeneous steps
		const steps = Array.from({ length: 100 }, (_, i) => i + 1);

		// Helper function to find the closest step in the array
		function getClosestStep(value) {
			return steps.reduce(function(prev, curr) {
				return (Math.abs(curr - value) < Math.abs(prev - value) ? curr
						: prev);
			});
		}

		// Update the display and snap to closest heterogeneous step
		range.addEventListener("input", function() {
			const closestStep = getClosestStep(range.value);
			display.textContent = closestStep;
			range.value = closestStep; // Snap the slider to the closest step
		});
	</script>
	<script>
    function sortJobs() {
        const jobCards = document.querySelectorAll('.card');
        const sortBy = document.getElementById('sortBy').value;
        const jobCardsArray = Array.from(jobCards);

        if (sortBy === 'newest') {
            jobCardsArray.sort((a, b) => new Date(b.dataset.date) - new Date(a.dataset.date));
        } else if (sortBy === 'oldest') {
            jobCardsArray.sort((a, b) => new Date(a.dataset.date) - new Date(b.dataset.date));
        }

        // Clear the job card container and re-append sorted cards
        const jobContainer = document.getElementById('jobCards');
        jobContainer.innerHTML = '';
        jobCardsArray.forEach(card => jobContainer.appendChild(card));
    }
</script>
<script>
function updateRangeDisplay(value) {
    document.getElementById('rangeDisplay').textContent = value;
}

function redirectToUrl() {
    // Get the selected values
    var category = document.getElementById('category').value;
    var location = document.getElementById('location').value;
    var jobType = document.getElementById('jobType').value;
    var experience = document.querySelector('input[name="Experience"]:checked') ? document.querySelector('input[name="Experience"]:checked').value : '';
    var salary = document.getElementById('rangeValue').value;

    // Construct the URL with dynamic parameters
    var url = 'JobsFliter.jsp?category=' + encodeURIComponent(category) +
              '&location=' + encodeURIComponent(location) +
              '&jType=' + encodeURIComponent(jobType) +
              '&Experience=' + encodeURIComponent(experience) +
              '&salary=' + encodeURIComponent(salary);

    // Redirect to the constructed URL
    window.location.href = url;

    // Prevent the form from submitting the traditional way
    return false;
}
</script>




	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap-icons/font/bootstrap-icons.js"></script>
	
</body>
<footer><%@include file="footer.jsp"%></footer>
</html>
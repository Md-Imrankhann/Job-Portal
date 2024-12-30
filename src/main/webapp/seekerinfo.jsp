<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="Model.Seeker"%>
<%@page import="Model.Registration"%>
<%@page import="java.util.*"%>

<%@ page import="Model.*"%>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Document</title>

<style>
@import
	url('https://fonts.googleapis.com/css2?family=Nunito:ital,wght@0,200..1000;1,200..1000&display=swap')
	;

:root {
	--main-color: #23c686;
	--secondary-color: #fbfcf6;
	--lighter-color: #e0e0e7;
	--light-color: #b0b0c0;
	--dark-color: #1d3853;
	--font-smaller: 14px;
	--font-bigger: 20px;
}

* {
	margin: 0;
	padding: 0;
}

*, ::before, ::after {
	box-sizing: border-box;
}

html {
	scroll-behavior: smooth;
}

body {
	font-family: 'Nunito', sans-serif;
	font-size: 16px;
	font-weight: 400;
	line-height: 1.8;
	color: var(--dark-color);
}

a {
	text-decoration: none;
	color: inherit;
}

ul {
	list-style: none;
}

h1, h2, h3 {
	font-weight: 700;
	line-height: 1.25;
	margin: 0 0 0.5em
}

img {
	max-width: 100%;
	vertical-align: middle;
}

.container {
	max-width: 1100px;
	margin: 0 auto;
	padding: 0 2em;
}

.form-box {
	display: flex;
	flex-direction: column;
	margin-top: 5em;
	border: 8px solid var(--lighter-color);
	border-radius: 15px;
	background-color: #faf9ff;
}
/* progress*/
.form-box .progress {
	position: relative;
	padding: 1em;
}

/* Progress steps*/
.progress ul.progress-steps {
	display: flex;
	flex-direction: row;
	align-items: center;
	justify-content: center;
	gap: 2em;
}

.progress ul.progress-steps li {
	position: relative;
	display: flex;
	align-items: flex-start;
	margin-bottom: 2em;
}

.progress ul.progress-steps li>span {
	position: relative;
	width: 40px;
	height: 40px;
	font-size: var(--font-smaller);
	display: flex;
	align-items: center;
	justify-content: center;
	margin-right: 1em;
	border-radius: 50%;
	background-color: var(--lighter-color);
	z-index: 1;
}

.progress ul.progress-steps li.active>span {
	color: white;
	background-color: var(--main-color);
	border: 4px solid var(--secondary-color);
	z-index: 1;
}

.progress ul.progress-steps li p span {
	font-size: var(--font-smaller);
	color: var(--light-color);
	display: none;
}

.progress ul li p {
	position: absolute;
	top: -2em;
	font-size: 12px;
}
/*Form*/
.form-box form {
	width: 100%;
	padding: 3em 1em;
	background-color: white;
	border-radius: 30px 30px 15px 15px;
}
/* Form background images */
form>div {
	max-width: 400px;
	margin: 0 auto;
}

form>div p {
	color: var(--light-color);
	margin-bottom: 2em;
}

form>div>div:not(.checkbox) {
	display: flex;
	flex-direction: column;
	margin-bottom: 2em;
}

form :where(input, select) {
	height: 40px;
	padding: 0 1em;
	border-radius: 7px;
	outline-color: var(--secondary-color);
	border: 1px solid var(--lighter-color);
	background-color: transparent;
}

form label {
	font-size: var(--font-smaller);
	margin-bottom: 0.5em;
	font-weight: 600;
}

form .grouping {
	display: flex;
}

form .grouping input {
	max-width: 70px;
	text-align: center;
	margin-right: 1em;
}

form .checkbox input {
	height: auto;
}

form>div:not(.btn-group) {
	display: none;
	-webkit-animation: fadeIn .6s cubic-bezier(0.39, 0.575, 0.565, 1) both;
	animation: fadeIn .6s cubic-bezier(0.39, 0.575, 0.565, 1) both;
}

@
keyframes fadeIn { 0%{
	opacity: 0;
	-webkit-transform: translateY(10%);
	transform: translateY(10%);
}

100
%
{
opacity
:
1;
-webkit-transform
:
translateY(
0
);
transform
:
translateY(
0
);
}
}
form>div.active {
	display: block;
}

form>div .bg-svg {
	width: 60px;
	height: 50px;
}

/* Button */
.btn-group {
	display: flex;
	flex-wrap: wrap;
	gap: 1em;
	margin-top: 2em;
}

.btn-group [class*="btn-"] {
	background-color: var(--main-color);
	color: white;
	padding: 1em 2.5em;
	border: 4px solid var(--secondary-color);
	border-radius: 30px;
	cursor: pointer;
	-webkit-transition: background-color .3s, border-color .3s ease-out;
	transition: background-color .3s, border-color .3s ease-out;
}

.btn-group [class*="btn-"]:disabled {
	background-color: var(--light-color);
	border-color: var(--lighter-color);
	cursor: text;
}

.btn-group [class*="btn-"]:hover:not(:disabled) {
	background-color: var(--dark-color);
	border-color: var(--light-color);
}

.btn-group .btn-submit, .form-three.active ~ .btn-group .btn-next {
	display: none;
}

.form-three.active ~ .btn-group .btn-submit {
	display: block;
}

.form-three.active ~ .btn-group {
	justify-content: space-between;
}

::placeholder {
	color: var(--light-color);
}

@media screen and (min-width:768px) {
	.form-box {
		flex-direction: row;
	}
	.form-box .progress {
		flex: 1 0 35%;
		min-width: 300px;
		padding: 3em;
	}
	.logo {
		margin: -48px -48px 48px;
	}
	.progress ul.progress-steps {
		flex-direction: column;
		gap: 0;
	}
	.progress ul.progress-steps li:not(:last-child)::before {
		content: '';
		position: absolute;
		left: 20px;
		top: 30px;
		width: 2px;
		height: 65px;
		background-color: var(--lighter-color);
	}
	.form-box form {
		padding: 3em;
		border-radius: 0 15px 15px 15px;
	}
	.progress ul li p {
		position: relative;
		top: auto;
		font-size: inherit;
	}
	.progress ul.progress-steps li p span {
		display: block;
	}
}

.suggestions div {
	padding: 10px;
	cursor: pointer;
}

.suggestions div:hover {
	background-color: #f0f0f0;
}

#skill-input {
	width: 100%;
	padding: 10px;
	font-size: 16px;
}

#skill-list {
	padding: 10px;
}

.skill-item {
	display: inline-block;
	background-color: #f0f0f0;
	padding: 5px 10px;
	border-radius: 5px;
	margin: 5px;
	position: relative;
}

.remove-button {
	position: absolute;
	top: 5px;
	right: 2px;
	font-size: 16px;
	cursor: pointer;
	color: #ff0000;
}

.remove-button:hover {
	color: #0000ff;
}

.skill-item:hover {
	background-color: #e0e0e0;
}

.remove-button:hover {
	color: #ff0000;
}

.header {
	height: 50px;
	position: fixed;
	top: 0;
	left: 0;
	width: 100%;
	z-index: 1000;
	text-align: Right;
}

.mx-background-top-linear {
	background: -webkit-linear-gradient(45deg, #54d400 48%, #1b1e21 48%);
	background: -webkit-linear-gradient(left, #54d400 48%, #1b1e21 48%);
	background: linear-gradient(45deg, #23c686 48%, #1b1e21 48%);
}

.head {
	color: grey;
	text-decoration: none;
	margin-right: 50px;
	padding-top: 10px;
	font-size: 30px;
}

.head:hover {
	color: white;
	text-decoration: none;
	transform: scale(1.3);
}
</style>
</head>
<body>
	<div class="container-fluid header mx-background-top-linear">
		<div class="row">
			<div class="col-12">
				<a class="head " href="home.jsp"><b>Home</b> </a>
			</div>
		</div>
	</div>
	<%
	if (session.getAttribute("name") != null) {
		Registration r = new Registration(session);
		Seeker s = r.getSeekerInfo();
	%>
	<div id="page" class="site">
		<div class="container">
			<div class="form-box">
				<div class="progress">
					
					<ul class="progress-steps">
						<li class="step active"><span>1</span>
							<p>Personal</p></li>
						<li class="step"><span>2</span>
							<p>Education</p></li>
						<li class="step"><span>3</span>
							<p>Professional</p></li>
					</ul>
				</div>
				<form action="register" method="POST" style="padding-top: 0px;">
					<div class="form-one form-step active" >
						<div class="bg-svg"></div>
						<h2>Personal Information</h2>
						<p>Enter your personal information</p>
						<div>
							<label>Profile Photo url</label> 
							
								
							<input type="text" id="imageURL" placeholder="Enter image URL" onchange="displaySelectedImage(this.value, 'myImage')" name="url" value="<%=s.getPhoto()%>">
						</div>
						<div>
							<label>Name</label> <input type="text" placeholder="Name"
								name="name" value="<%=s.getName()%>">
						</div>
						<div>
							<label>Phone number</label> <input type="tel"
								placeholder="0000000000" name="phone"
								value="<%=s.getPhone()%>">
						</div>
						<div>
							<label>Email</label> <input type="email" placeholder="Email"
								name="email" value="<%=s.getEmail()%>">
						</div>
						<div class="birth">
							<label>Date of birth</label> <input type="date" name="dob"
								value="<%=s.getName()%>">
						</div>

						<div>
							<label class="dropdown-label" for="gender">Gender:</label> <select
								id="gender" name="gender" value="<%=s.getGender()%>">
								<option value="" disabled selected>Select your gender</option>
								<!-- Placeholder option -->
								<option value="male">Male</option>
								<option value="female">Female</option>
							</select>
						</div>
						<div>
							<label>Current Location</label> <input type="text"
								placeholder="Street address" name="address"
								value="<%=s.getAddress()%>">
						</div>
					</div>

					<div class="form-two form-step">

						<h2>Education information</h2>
						<p>Enter your information</p>
						<div>
							<label for="highest-qualification">Highest Qualification</label>
							<input type="text" id="highest-qualification"
								placeholder="Type to search..." name="qualification"
								value="<%=s.getQualification()%>"
								oninput="fetchSuggestions(this.value)">
							<div id="suggestions" class="suggestions" style="display: none;"></div>
						</div>
						<div>
							<label>Specialization</label> <input type="text"
								placeholder="Specialization" name="specialization"
								value="<%=s.getSpecialization()%>">
						</div>
						<div>
							<label for="tenth-percentage">10th Percentage</label> <input
								type="number" id="tenth-percentage"
								placeholder="Enter your 10th percentage" min="0" max="100"
								name="ten" value="<%=s.getTenth()%>">
						</div>
						<div>
							<label for="twelfth-percentage">12th Percentage</label> <input
								type="number" id="twelfth-percentage"
								placeholder="Enter your 12th percentage" min="0" max="100"
								name="twelve" value="<%=s.getTwelfth()%>">
						</div>
					</div>
					<div class="form-three form-step">
						<div class="bg-svg"></div>
						<h2>Professional</h2>
						<div>
							<label>Experience</label>
							<div style="display: flex; align-items: center;">
								<input type="radio" name="experience" value="fresher"
									id="fresher" onchange="toggleExperienceInput()"> <label
									for="fresher" style="margin-left: 5px;">Fresher</label> <input
									type="radio" name="experience" value="experienced"
									id="experienced" style="margin-left: 20px;"
									onchange="toggleExperienceInput()"> <label
									for="experienced" style="margin-left: 5px;">Experienced</label>
							</div>
							<%String p="0";
							p=s.getPeriod();%>
							<!-- New input field for experienced users -->
							<div id="experience-details"
								style="display: none; margin-top: 10px;">
								<label for="experience-input">Please specify your
									experience:</label> <input type="number" id="experience-input"
									placeholder="0.0" name="period" value="<%=p%>">
							</div>
						</div>
						<div>
							<label>Skills</label> <input type="text" id="skill-input"
								placeholder="Enter a skill and press Enter" name="skills"
								value="<%=s.getSkills()%>">
							<div id="skill-list"></div>
						</div>
					</div>
					<div class="btn-group">
						<button type="button" class="btn-prev" disable>Back</button>
						<button type="button" class="btn-next">Next</button>
						<button type="submit" class="btn-submit" name="update">Submit</button>
					</div>
				</form>
				<%
				}
				%>
			</div>
		</div>
	</div>
<script>
    function displaySelectedImage(url, elementId) {
        const selectedImage = document.getElementById(elementId);
    
        // Set the image source to the provided URL
        if (url) {
            selectedImage.src = url;
        }
    }
    </script>
	<script src="seeker.js"></script>
</body>
</html>
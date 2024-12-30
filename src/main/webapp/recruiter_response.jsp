<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    	<%@page import="Model.*"%>
<%@page import="Model.Registration"%>
<%@page import="java.util.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Applications</title>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/5.3.0/css/bootstrap.min.css">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css">	
<style type="text/css">
* {
	margin: 0px;
	padding: 0px;
}
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
.cad {
  height: 200px; /* Fixed height */
  overflow-y: auto; /* Enable scrolling */
  border: 1px solid #ddd;
}
.search{
margin-left: 170px;
border-radius: 10px;
}




.lab {
    display: flex;
    
    margin-left: -40px;
   
}

.date-container span {
    font-size: 14px;
    color: #999;
    text-align: center;
    width: 100px;
}
.button {
	background-color: #23c686;
	border: 1px solid #03BFCB;
	border-radius: 10px;
	color: #231E39;
	font-family: Montserrat, sans-serif;
	font-weight: 500;
	margin-top:25px;
	
	padding: 7px 20px;
}
.button:hover{
background-color: #231E39;
color: #23c686;
}
.buttonr {
	background-color: red;
	border: 1px solid #03BFCB;
	border-radius: 10px;
	color: #231E39;
	font-family: Montserrat, sans-serif;
	font-weight: 500;
	margin-top:25px;
	margin-left:10px;
	padding: 7px 20px;
}
.buttonr:hover{
background-color: #231E39;
color: #23c686;
}
/* Basic input styling */
#search {
    border: 2px solid transparent;
    padding: 10px;
    border-radius: 10px;
    width: 70%;
    outline: none;
    background-color: #fff;
    position: relative;
    z-index: 1;
}

/* Background with border gradient effect */
#search {
    background: linear-gradient(white, white) padding-box, /* To fill the input area */
                linear-gradient(to right,#212529, #23c686,#212529) border-box; /* Gradient border */
    transition: border 0.4s, background-position 0.4s ease-in-out;
}

/* Focus state to trigger the border animation */
#search:focus {
    background-position: 100% 0;
    border-color: transparent; /* Border still transparent as the gradient handles it */
    background-size: 300% 100%; /* To animate from left to right */
}
.job-card {
            border: none;
            box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
            
        }
        .job-card:hover{
        	box-shadow: 0 8px 16px rgba(0, 0, 0, 0.5); /* Increase shadow for a popping effect */
   transform:scale(1.01);
  
        }
        .detail{
        border-left: 1px solid grey;
        margin-top: 7px;
        margin-bottom: 7px;
        }
        .job-card{
        
        }
</style>
</head>
<body style="background-color: #f9f9f9">
	<%@include file="header_admin.jsp"%>
	<div style="height: 100px;"></div>
	
	<div class="container-fluid mt-4 mb-4">
		<div class="row">			
			<div class="col-12">
				<div class="card" style="background-color: white; height: auto; box-shadow: 0px 10px 15px -10px rgba(0, 0, 0, 0.5),0px -5px 15px -5px rgba(0, 0, 0, 0.5); /* Top shadow */margin-left: 30px; margin-right: 30px; border-radius: 10px;" >
					
						<input class="form-control mt-3 search" id="search" type="text" placeholder="Search Application..." style="width:70%;">
					
					<div class="row  ml-3 mr-3 mb-3 mt-3" id="container">
						<div class="col-12">
							<div class="card cad p-1" style="background-color: #f9f9f9; height: 500px; border-radius: 10px;">
								<div style="height: 15px;"></div>
								<%
										
						Registration s1 = new Registration(session);
						
						ArrayList<Applications> ap=s1.getRecruiterAppsResponseByJobID();
							
						Iterator<Applications> itr = ap.iterator();
						while (itr.hasNext()) {
							
							Applications a = itr.next();
							
							Seeker s=s1.getSeekerInfobyId(a.getUserId());
							
							
							
						%>
						<%if(a.getStatus().equals("responed")){ %>
											
											<div class="card ml-4 mr-4 mt-2 job-card" style="background-color: white;" id="card">
											<%}else { %>
												<div class="card ml-4 mr-4 mt-2 job-card" style="background-color: white; border: 2px solid orange;" id="card">
											<%} %>
											
								
								
									<div class="row ml-3 mt-1 mb-2">
									<div class="col-3 ">
											<div class="company-info">
												<span class=" d-block" style="font-size: 30px;"><%=s.getName() %></span>
												<span class=" mt-3  d-block"><i class="fas fa-envelope"></i> <%=s.getEmail() %></span>
                        						
                        					</div>
										</div>
										<div class="col-4 detail">
											<div class="row">
												<div class="col-6">
													<div class="company-info">
                        								
                            							<span class="mb-3 d-block"><i class="fas fa-tools"></i> <%=s.getSkills() %></span>
                            							<span class=" d-block"><i class="fas fa-briefcase"></i> <%=s.getExperience() %></span>
                            							
                            						</div>
												</div>
												<div class="col-6">
													<div class="company-info">
                        								<span class="mb-3 d-block"><i class="fas fa-graduation-cap"></i> <%=s.getQualification() %></span>
                            							<span class=" d-block"><i class="fas fa-user-shield"></i> <%=s.getSpecialization() %></span>
                            						</div>
												</div>
											</div>
										</div>
										<div class="col-3 detail">
											<span class=" mb-3 d-block"><i class="bi bi-calendar-check-fill"></i> <%=a.getApplied_date() %></span>
											<span class="d-block"><strong>Job Id:</strong> <%=a.getJobId() %></span>	
										</div>
										
							
										<div class="col-2">
											<%if(a.getStatus().equals("accepted")){ %>
										<a href="recruiter_email.jsp?applId=<%= a.getAppId() %>">
												<button class="button" type="submit" name="ResponseAppl"><b>Email</b></button>
												</a>
											
											<%}else{ %>
												
												<div class="d-block">
												<span style="color: green; font-size: 22px;" ><b style="margin-top: 20px; padding-top: 20px;">Responded</b></span>
												</div>
												<div class="d-block">
													<a href="recruiter_email.jsp?applId=<%= a.getAppId() %>">
												<button class="button mt-3 " type="submit" name="ResponseAppl" style="padding: 2px 40px;"><b>Email</b></button>
												</a>
												</div>
												
											<%} %>
											
										</div>
											
										
									</div>
								</div>
								<%} %>
							</div>
						</div>
					</div>
				</div>
			</div>	
		</div>
	</div>

</body>
<footer><%@include file="footer.jsp"%></footer>
<script>
$(document).ready(function(){
    $("#search").on("keyup", function() {
        var value = $(this).val().toLowerCase();
        $(".job-card").filter(function() {
            $(this).toggle($(this).text().toLowerCase().indexOf(value) > -1);
        });
    });
});
</script>


</html>
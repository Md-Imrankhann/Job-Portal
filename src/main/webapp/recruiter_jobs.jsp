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
	
	padding: 7px 15px;
}
.button:hover{
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
        .buttonr {
	background-color: red;
	border-radius: 10px;
	color: #231E39;
	font-family: Montserrat, sans-serif;
	font-weight: 500;
	padding: 7px 15px;
	border: none;
	margin-left: 30px;
	
}
.buttonr:hover{
background-color: darkred;

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
					
						<input class="form-control mt-3 search" id="search" type="text" placeholder="Search Jobs...." style="width:70%;">
					
					<div class="row  ml-3 mr-3 mb-3 mt-3" id="container">
						<div class="col-12">
							<div class="card cad p-1" style="background-color: #f9f9f9; height: 400px; border-radius: 10px;">
								<div style="height: 15px;"></div>
								<%
										
						Registration s1 = new Registration(session);
						ArrayList<Jobs> ap = s1.getJobById();
						
							
						Iterator<Jobs> itr = ap.iterator();
						while (itr.hasNext()) {
							
							Jobs j = itr.next();
							
							
							
							
							
						%>
								
								<%if(j.getstatus().equals("active")){ %>
							
							<div class="card ml-4 mr-4 mt-2 job-card" style="background-color: white;" id="card">
							<%}else{ %>
							<div class="card ml-4 mr-4 mt-2 job-card" style="background-color: white; border: 1px solid red;" id="card">
							<%} %>
									<div class="row">
										<div class="col-2">
											<img src="<%=j.getCompanyLogo() %>" alt="Logo" class="m-1 mt-3 ml-3" width="70%" height="70%">
										</div>
										<div class="col-4 mt-1 mb-1 pr-0 border-start">
											<h5><%= j.getJobTitle() %></h5>
                        					<h6><%= j.getCompanyName() %></h6>
                        					<div class="company-info">
                        						<span class="mr-4"><i class="bi bi-calendar-check-fill"></i> <%=j.getPostedDate() %></span>
                        						<%if(j.getstatus().equals("active")){ %>
													<span class="mr-4"><i class="bi bi-calendar-x-fill"></i> <%= j.getApplicationDeadline() %></span>
												<%}else{ %>
													<span class="mr-4 " style="color: red;"><i class="bi bi-calendar-x-fill"></i> <%= j.getApplicationDeadline() %></span>
												<%} %>
                            					
                            					
                            				</div>
										</div>
										<div class="col-3 detail">
										
											<div class="row">
												<div class="col-6 mt-1">
													<span><i class="bi bi-cash-stack"></i> <%= j.getSalary() %> LPA</span>
													
												</div>
												<div class="col-6 mt-1">
													<span><i class="bi bi-geo-alt-fill"></i> <%=j.getLocation() %></span>
												</div>
												<div class="col-6 mt-3 ">
													<span><i class="bi bi-people-fill"></i> <%=j.getVacancy()  %> Vacancy</span>
													
												</div>
												<div class="col-6 mt-3 ">
													<span><i class="bi bi-clock-fill"></i> <%=j.getJobType() %></span>
												</div>
											</div>
											
										</div>
										<div class="col-3 ">
											<div class="d-inline-block">
												<a href="recruiter_applications.jsp?Job_Id=<%=j.getJobId() %>">
												<button class="button" ><b>Application's</b></button></a>
											</div>
											<div class="d-inline-block">
												<form action="register" method="post">
													<input type="hidden" value="<%=j.getJobId() %>" name="JobID">												
													<button class="buttonr" type="submit" name="Deletejob"><b><i class="bi bi-trash"></i></b></button>
												</form>	
											</div>											
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
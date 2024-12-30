<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    	<%@page import="Model.*"%>
<%@page import="Model.Registration"%>
<%@page import="java.util.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Status</title>
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


.progress-container {
    display: flex;
    justify-content: space-between;
    align-items: center;
    width: 80%;
    position: relative;
    margin-top:20px;
    margin-left: -30px;
}

.progress {
    position: absolute;
    height: 50px;
    background-color: #4caf50;
    top: 0;
    left: 0;
    right: 0;
    z-index: 0;
}

.circle {
    width: 20px;
    height: 20px;
    background-color: orange;
    border-radius: 50%;
    display: flex;
    justify-content: center;
    align-items: center;
    z-index: 1;
    position: relative;
    font-size: 12px;
}

.completed {
    background-color: #4caf50;
    color: #fff;
}

.active {
    background-color: #4caf50;
    color: #fff;
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
	background-color: red;
	border: 1px solid #03BFCB;
	border-radius: 10px;
	color: #231E39;
	font-family: Montserrat, sans-serif;
	font-weight: 500;
	margin-top:25px;
	margin-left: -40px;
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
        
        .tablehead{

  font-size: 20px;
  font-weight: 600;
  background-image: linear-gradient(to left, #212529, #23c686);
  color: transparent;
  background-clip: text;
  -webkit-background-clip: text;
  align-content: center;
  
	
}
.button {
	background-color: #23c686;
	border: 1px solid #03BFCB;
	border-radius: 10px;
	color: #231E39;
	font-family: Montserrat, sans-serif;
	font-weight: 500;
	padding: 5px 45px;
	margin-top: 0;
	
	
}
.button:hover{
background-color: #231E39;
color: #23c686;
}
.buttonr {
	background-color: red;
	border-radius: 10px;
	color: #231E39;
	font-family: Montserrat, sans-serif;
	font-weight: 500;
	padding: 7px 15px;
	border: none;
	
}
.buttonr:hover{
background-color: darkred;

}
     
</style>
</head>
<body style="background-color:#f9f9f9; background-attachment: fixed;">
	<%@include file="header_admin.jsp"%>
	<div style= "height:100px;"></div>
	
	<div class="container-fluid mt-4 mb-4">
		<div class="row">			
			<div class="col-12">
				
				<div class="card" style="background-color: white;  auto; box-shadow: 0px 10px 15px -10px rgba(0, 0, 0, 0.5),0px -5px 15px -5px rgba(0, 0, 0, 0.5); /* Top shadow */margin-left: 30px; margin-right: 30px; border-radius: 10px;" >
						
						<div class="d-inline-block">
  						<a href="home_admin.jsp"><i class="fas fa-arrow-left d-inline ml-5" style="font-size: 25px;"></i></a> <!-- Back arrow icon -->
						<input class="form-control mt-3 search d-inline" id="search" type="text" placeholder="Search User's...." style="width:70%; margin-left: 9%;">
				</div>
					<div class="row  ml-3 mr-3 mb-3 mt-3">
						<div class="col-12">
							<div class=" cad p-0" style="background-color: #f9f9f9;opacity:1;z-index:1000; height: 350px; border-radius: 10px; position: fixed''">
								
								<div class=" headers card p-0 mx-4 mt-2" >
									<div  class=" mr-2 mt-1  pr-0" style="display: flex; ">
										<p class="tablehead ml-3">User ID</p>
										<p class="tablehead ml-5">Name</p>
										<p class="tablehead " style="margin-left: 120px;">Email</p>
										<p class="tablehead " style="margin-left: 150px;">Phone</p>
										<p class="tablehead " style="margin-left: 90px;" >Category</p>
									</div>
								</div>
								
								<!-- one user card start-->
								 <% if (session.getAttribute("id") != null  && session.getAttribute("id").equals("1")) {
                               					Registration reg = new Registration(session);
                               					ArrayList<user> mydata = reg.getUserDetails();
                               					Iterator<user> itr = mydata.iterator();
                              				 	while (itr.hasNext()) {
                                   					user s = itr.next();
                       			%>
								
									<!-- one user card end -->
									
									<!-- second user card start -->
									<div class="card ml-4 mr-4 mt-2 job-card" style="background-color: white;" id="card">
									<div class="row">
										<div class="col-12 mt-1 mb-1 pr-0">
                        					<div  class="row">
                        					<div class="col-1 ml-4"><p><b><%=s.getId() %></b></p></div>	
                        						<div class="col-2"><p><b><%=s.getName() %></b></p></div>
                        						<div class="col-2" style="margin-left: -20px;"><p><b><%=s.getEmail() %></b></p></div>
                        						<div class="col-2 ml-3"><p><b><%=s.getPhone() %></b></p></div>
                        						<div class="col-2"><p><b><%=s.getCategory() %></b></p></div>
                        						
                        						<div class="col-2">
                        						
                        						<%if(s.getCategory().equals("recruiter")){ %>
                        							<a href="admin_jobById.jsp?u_id=<%=s.getId() %>"><button type="button" class="button">Jobs Posted</button></a>
                        						<%}else{ %>
                        							<a href="admin_applById.jsp?u_id=<%=s.getId() %>"><button type="button" class="button">Applications</button></a>
                        						<%} %>
                        						</div>
                        						<form action="register" method="post">
													<input type="hidden" value="<%=s.getId() %>" name="UserID">
												<div class="col-1" style="margin-left: -30px;">
												<button type="submit" class="buttonr" name="delUser"><i class="bi bi-trash"></i></button></div>
                        					</form>
                        					</div>
                            			</div>
									</div>
									</div>
									<!-- second user card end -->
									
									
							<%}} %>
									
									
									
									
								<!--  third user card end -->	
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>	</div>
			
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
</body>
<footer><%@include file="footer.jsp"%></footer>
</html>
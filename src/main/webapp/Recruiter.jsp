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
<style type="text/css">
 .jc {
            border: none;
            box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
            margin-bottom: 0px;
            width: 100%;
            height: auto;
            padding: 0px;
            margin-left: 500px;
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
        }</style>
</head>
<body>
<%@include file="header.jsp"%>
<div class="container-fluid" >
	<div class="row">
		<div class="col-2 bg-primary" style="height: 500px; position: fixed;">
		
		</div>
		<div class="col-10" style="margin-left: 200px;">
				<%
						Registration s1 = new Registration(session);
							//sql safe mode off
							int i=1;
						ArrayList<Jobs> ar = s1.getJobs();
						Iterator<Jobs> itr = ar.iterator();
						while (itr.hasNext() && i<=10) {
							Jobs s = itr.next();
							i++;
						%>

        
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
                        			<a href="JobDetails.jsp?job_id=<%=s.getJobId()%>">
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
            
            <%} %>
		</div></div>

<footer><%@include file="footer.jsp"%></footer>
</body>
</html>
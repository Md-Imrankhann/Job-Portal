<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/5.3.0/css/bootstrap.min.css">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css">	
<style>
    .otp-input {
        width: 30px;
        height: 50px;
        text-align: center;
        margin: 0 5px;
        font-size: 1.5rem;
    }
    .cat-but{
	background-color: #23c686;
	border: 1px solid #03BFCB;
	border-radius: 10px;
	color: #231E39;
	font-family: Montserrat, sans-serif;
	font-weight: 500;
	margin:0px;
	margin-left:10%;
	height:30px;
	width:80%;
}
.cat-but:hover{
background-color: #231E39;
color: #23c686;
}

</style>
</head>
<body style="background-color: #f9f9f9">
	<%@include file="headerE.jsp"%>
	<div style="height: 160px;"></div>
	<div class="container-fluid mb-5">
		<div class="row">
			<div class="col-3"></div>
			<div class="col-6">
				<div class="card" style="border: none;  width: 350px; margin-left: 135px; border-radius: 20px;">
				 	<center><h4 class="mt-4" style="   background-image: linear-gradient(to left, #212529, #23c686);color: transparent;background-clip: text;">Email Verification</h4></center>
				 	<span class="mobile-text mx-3 mb-5">Enter the code we just send on your Email id <b class="text-danger"><%=request.getParameter("email") %></b></span>
					<form action="VerifyOtp" method="post">
        				<div id="otp" class="d-flex justify-content-between">
            				<input type="text" class="form-control otp-input ml-4" name="digit1" maxlength="1" pattern="[0-9]" required>
            				<input type="text" class="form-control otp-input" name="digit2" maxlength="1" pattern="[0-9]" required>
            				<input type="text" class="form-control otp-input" name="digit3" maxlength="1" pattern="[0-9]" required>
            				<input type="text" class="form-control otp-input" name="digit4" maxlength="1" pattern="[0-9]" required>
            				<input type="text" class="form-control otp-input" name="digit5" maxlength="1" pattern="[0-9]" required>
            				<input type="text" class="form-control otp-input mr-4" name="digit6" maxlength="1" pattern="[0-9]" required>
        				</div>
        				<%
		if (request.getAttribute("status") != null) {
		%>
		<div class="text-center mt-2"><span class="font-weight-bold text-danger"><%=request.getAttribute("status")%></span></div>
             
            <%} %>
        				
        				<div class="text-center mt-4"><span class="d-block mobile-text">Don't receive the code?</span><span class="font-weight-bold text-danger cursor"><a href="login.jsp?verify=f" class="text-danger cursor" style="text-decoration: none; ">Resend</a></span></div>
        				<div class="mt-4 mb-4">
        				<input type="hidden" value="<%= request.getParameter("email") %>" name="email">
            				<button type="submit" class="cat-but"><b>Verify OTP</b></button>
        				</div>
        			</form>
				</div>
			</div>
			<div class="col-3"></div>
		</div>
	</div>
	<div style="height: 50px;"></div>
	<footer><%@include file="footer.jsp"%></footer>

</body>
<script>
            // Automatically move focus to the next input
            const otpInputs = document.querySelectorAll('.otp-input');
        
            otpInputs.forEach((input, index) => {
                input.addEventListener('input', (event) => {
                    const value = event.target.value;
                    if (value && index < otpInputs.length - 1) {
                        otpInputs[index + 1].focus();
                    }
                });
        
                input.addEventListener('keydown', (event) => {
                    if (event.key === 'Backspace' && !input.value && index > 0) {
                        otpInputs[index - 1].focus();
                    }
                });
            });
        </script>
</html>
package Otp;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;

import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/VerifyOtp")
public class VerifyOtpServlet extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
      
        String digit1 = request.getParameter("digit1");
        String digit2 = request.getParameter("digit2");
        String digit3 = request.getParameter("digit3");
        String digit4 = request.getParameter("digit4");
        String digit5 = request.getParameter("digit5");
        String digit6 = request.getParameter("digit6");
        String email= request.getParameter("email");
        // Combine digits to form the full OTP
        String enteredOtp = digit1 + digit2 + digit3 + digit4 + digit5 + digit6;
        // Get the OTP generated and sent via email
        String generatedOtp = EmailOtpServlet.getGeneratedOtp();

        if (enteredOtp != null && enteredOtp.equals(generatedOtp)) {
        	 RequestDispatcher rd1 = request.getRequestDispatcher("login.jsp?verify=t&email="+email);
 			rd1.forward(request, response);
        } else {
        	request.setAttribute("status", "Invalid OTP");
        	 RequestDispatcher rd1 = request.getRequestDispatcher("EmailVerification.jsp");
  			rd1.forward(request, response);
        }
    }
}


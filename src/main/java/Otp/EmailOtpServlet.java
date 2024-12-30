package Otp;


import jakarta.mail.Authenticator;
import jakarta.mail.MessagingException;
import jakarta.mail.PasswordAuthentication;
import jakarta.mail.Session;
import jakarta.mail.Transport;
import jakarta.mail.internet.InternetAddress;
import jakarta.mail.internet.MimeMessage;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.mail.*;



import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.util.Properties;



@WebServlet("/EmailOtp")
public class EmailOtpServlet extends HttpServlet {

    private static String generatedOtp;

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String userEmail = request.getParameter("email");

        // Generate OTP
        generatedOtp = OTPGenerator.generateOTP(6);
       System.out.println("============================="+generatedOtp+"=====================");
        // Send OTP via email
        try {
            sendEmail(userEmail, generatedOtp);
            response.getWriter().println("OTP sent successfully to " + userEmail);
            RequestDispatcher rd1 = request.getRequestDispatcher("EmailVerification.jsp?email="+userEmail);
			rd1.forward(request, response);
        } catch (MessagingException e) {
            e.printStackTrace();
            response.getWriter().println("Failed to send OTP: " + e.getMessage());
        }
    }

    
    
    
    private void sendEmail(String recipientEmail, String otp) throws MessagingException {
        String fromEmail = "udgama4@gmail.com";
        String app_password = "ulmu agfe isru svot";

        Properties properties = new Properties();
        properties.put("mail.smtp.host", "smtp.gmail.com"); // Replace with your SMTP server
        properties.put("mail.smtp.port", "587");
        properties.put("mail.smtp.auth", "true");
        properties.put("mail.smtp.starttls.enable", "true");

        Session session = Session.getInstance(properties, new Authenticator() {
            @Override
            protected PasswordAuthentication getPasswordAuthentication() {
                return new PasswordAuthentication(fromEmail, app_password);
            }
        });

        Message message = new MimeMessage(session);
        message.setFrom(new InternetAddress(fromEmail));
        message.setRecipient(Message.RecipientType.TO, new InternetAddress(recipientEmail));
        message.setSubject("Your OTP Code");
        message.setText("Your OTP code is: " + otp);

        Transport.send(message);
    }

    public static String getGeneratedOtp() {
        return generatedOtp;
    }
}

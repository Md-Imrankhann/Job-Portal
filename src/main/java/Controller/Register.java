package Controller;

import java.io.IOException;
import java.io.InputStream;
import java.util.ArrayList;

import jakarta.servlet.ServletException;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import jakarta.servlet.http.Part;
import Model.Jobs;
import Model.Registration;

@WebServlet(name = "register", urlPatterns = { "/register" })

public class Register extends HttpServlet {

	protected void processRequest(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		response.setContentType("text/html;charset=UTF-8");
		// type of the response sent to the client or browser

		HttpSession session = request.getSession();
		Registration reg = new Registration(session);
		try {
			if (request.getParameter("signup") != null) {

				String name = request.getParameter("name");
				String phone = request.getParameter("phone");
				String email = request.getParameter("email");
				String pw = request.getParameter("pw");
				String cp = request.getParameter("cp");
				String cat = request.getParameter("category");
				

				if (pw.equals(cp)) {
					String status = reg.register(name, phone, email, pw ,cat);
					
					if (status.equals("existed")) {

						request.setAttribute("status", "Record Exists");
						RequestDispatcher rd1 = request.getRequestDispatcher("login.jsp");
						rd1.forward(request, response);

					} else if (status.equals("success")) {
						if(cat.equals("recruiter")) {
							
							reg.addRecruiter(name,phone,email,pw,cat);
						}
						if ((session.getAttribute("id").equals("1")) || (session.getAttribute("category").equals("recruiter"))) {
						request.setAttribute("status", "Successfully Registered and Logged in");
						RequestDispatcher rd1 = request.getRequestDispatcher("home_admin.jsp");
						rd1.forward(request, response);
						}else {
							request.setAttribute("status", "Successfully Registered and Logged in");
							RequestDispatcher rd1 = request.getRequestDispatcher("home.jsp");
							rd1.forward(request, response);
						}
					} else if (status.equals("failure")) {
						request.setAttribute("status", "Registration failed");
						RequestDispatcher rd1 = request.getRequestDispatcher("login.jsp");
						rd1.forward(request, response);

					}
				}
			}
			else if(request.getParameter("update") != null) {
		        String name = request.getParameter("name");
		        String phone = request.getParameter("phone");
		        String email = request.getParameter("email");
		        String dob = request.getParameter("dob");
		        String gender = request.getParameter("gender");
		        String address = request.getParameter("address");
		        String qualification = request.getParameter("qualification");
		        String specialization=request.getParameter("specialization");
		        String experience = request.getParameter("experience");
		        String period=request.getParameter("period");
		        String skills=request.getParameter("skills");
		        String ten=request.getParameter("ten");
		        String twelve=request.getParameter("twelve");
		         String photo=request.getParameter("url");
		        String status=reg.updateSeeker(name,phone,email,dob,gender,address,qualification,specialization,experience,period,skills,ten,twelve,photo);
		       
		        if(status=="success") {
		        	request.setAttribute("status", "Update successful");
					RequestDispatcher rd1 = request.getRequestDispatcher("home.jsp");
					rd1.forward(request, response);
		        }
		        else {
		        	request.setAttribute("status", "No Data Updated");
					RequestDispatcher rd1 = request.getRequestDispatcher("home.jsp");
					rd1.forward(request, response);
		        }
			}
			
			else if(request.getParameter("updateRecruiter") != null) {
		        String name = request.getParameter("name");
		        String phone = request.getParameter("phone");
		        String email = request.getParameter("email");
		        String cName = request.getParameter("cname");
		        String cLogo = request.getParameter("cLogo");
		        String Location = request.getParameter("Loc");
		        
		        
		        String status=reg.updatRecruiter(name,phone,email,cName,cLogo,Location);
		        if(status=="success") {
		        	request.setAttribute("status", "Update successful");
					RequestDispatcher rd1 = request.getRequestDispatcher("home_admin.jsp");
					rd1.forward(request, response);
		        }
		        else {
		        	request.setAttribute("status", "No Data Updated");
					RequestDispatcher rd1 = request.getRequestDispatcher("recruiter_edit.jsp");
					rd1.forward(request, response);
		        }
			}
			
			
			else if (request.getParameter("login") != null) {
				String email = request.getParameter("email");
				String pass = request.getParameter("pw");
				String status = reg.login(email, pass);
				if (status.equals("success")) {
					if (session.getAttribute("id").equals("1") || session.getAttribute("category").equals("recruiter")) {
					RequestDispatcher rd1 = request.getRequestDispatcher("home_admin.jsp");
					request.setAttribute("status", "Login successful");
					rd1.forward(request, response);
					}else {
						RequestDispatcher rd1 = request.getRequestDispatcher("home.jsp");
						rd1.forward(request, response);
						request.setAttribute("status", "Login successful");
					}
					
				} else if (status.equals("failure")) {
					request.setAttribute("status", "Login failed");
					RequestDispatcher rd1 = request.getRequestDispatcher("login.jsp");
					rd1.forward(request, response);
				}
			} else if (request.getParameter("logout") != null) {
				session.invalidate();
				RequestDispatcher rd1 = request.getRequestDispatcher("home.jsp");
				rd1.forward(request, response);

			}
			
			else if (request.getParameter("forgotPass") != null) {
				String mail = request.getParameter("email");
				String pw = request.getParameter("pw");
				String cp = request.getParameter("cp");
				if (pw.equals(cp)) {
					String status = reg.ForgotPassword(mail, pw);
					if (status.equals("success")) {
						request.setAttribute("status", "Password Reset Successfully");
						RequestDispatcher rd = request.getRequestDispatcher("login.jsp");
						rd.forward(request, response);
					} else if (status.equals("failure")) {
						request.setAttribute("status", "Password Reset Failed");
						RequestDispatcher rd = request.getRequestDispatcher("forgot.jsp");
						rd.forward(request, response);
					}
				} else {
					request.setAttribute("status", "Password mismatch");
					RequestDispatcher rd = request.getRequestDispatcher("forgot.jsp");
					rd.forward(request, response);
				}

			} 
			
			else if (request.getParameter("reset") != null) {
				String email = request.getParameter("email");
				String opw = request.getParameter("opw");
				String npw = request.getParameter("npw");
				String s = reg.getPassword(email, opw);
				if (opw.equals(npw)) {

					// System.out.println("Hi");
					if (s.equals("success") && (opw.equals(npw))) {
						// if (opw.equals(npw)) {
						request.setAttribute("status", "New Password is same as old Password");
						RequestDispatcher rd = request.getRequestDispatcher("forgot.jsp");
						rd.forward(request, response);
						// }
					}
				} else {
					if (s.equals("success")) {
						String status = reg.resetPassword(email, npw);
						if (status.equals("success"))
							request.setAttribute("status", "Password changed successfully");
						RequestDispatcher rd = request.getRequestDispatcher("login.jsp");
						rd.forward(request, response);
					} else {
						request.setAttribute("status", "Enter the old Password corectly");
						RequestDispatcher rd = request.getRequestDispatcher("forgot.jsp");
						rd.forward(request, response);
					}
				}

			}
			else if (request.getParameter("addJob") != null) {
				String jTitle = request.getParameter("jTitle");
				String jLocation = request.getParameter("jLocation");
				String jType = request.getParameter("jType");
				String Experience = request.getParameter("Experience");
				String qualification = request.getParameter("qualification");
				String percentage = request.getParameter("percentage");
				String experienceLevel = request.getParameter("experienceLevel");
				String salary = request.getParameter("salary");
				String skills = request.getParameter("skills");
				String cname = request.getParameter("cname");
				String clogo = request.getParameter("clogo");
				String endDate = request.getParameter("endDate");
				String jCategory = request.getParameter("jCategory");
				String cInfo = request.getParameter("cInfo");
				String vacancy = request.getParameter("vacancy");
				String jDescription = request.getParameter("jDescription");
				String id=request.getParameter("id");
				String status = reg.addJob(id,jTitle, jLocation, jType, Experience, qualification,percentage, experienceLevel, salary, skills, cname,clogo, endDate, jCategory, cInfo, vacancy,jDescription);
				if (status.equals("Submitted")) {
					request.setAttribute("status", "New Job Added");
					RequestDispatcher rd = request.getRequestDispatcher("addJob.jsp");
					rd.forward(request, response);
				} else if (status.equals("Already Added")) {
					request.setAttribute("status", "Already Added");
					RequestDispatcher rd = request.getRequestDispatcher("addJob.jsp");
					rd.forward(request, response);
				} else if (status.equals("Failed")) {
					request.setAttribute("status", "Failed To Add Job");
					RequestDispatcher rd = request.getRequestDispatcher("addJob.jsp");
					rd.forward(request, response);
				}
			}
			else if (request.getParameter("applyJob") != null) {
				 String uname = request.getParameter("uname");
			        String email = request.getParameter("email");
			        String phone = request.getParameter("phone");
			        String experience = request.getParameter("Experience");			       
			        String skills = request.getParameter("skills");
			        String jobId = request.getParameter("Job_id");
			        String userId = request.getParameter("user_id");
			        String status = reg.ApplyNow(uname,experience, email, 
			        		phone, skills,jobId,userId);
				if (status.equals("success")) {
					request.setAttribute("status", "Applied Successfully");
					RequestDispatcher rd = request.getRequestDispatcher("home.jsp");
					rd.forward(request, response);
				} else if (status.equals("existed")) {
					request.setAttribute("status", "Already Applied");
					RequestDispatcher rd = request.getRequestDispatcher("home.jsp");
					rd.forward(request, response);
				} else if (status.equals("failure")) {
					request.setAttribute("status", "Failed To Applied");
					RequestDispatcher rd = request.getRequestDispatcher("home.jsp");
					rd.forward(request, response);
				}
			}
			else if (request.getParameter("DeleteApp") != null) {
				String AppID = request.getParameter("AppID");
				String status = reg.delApplication(AppID);
				if (status.equals("success")) {
					request.setAttribute("status", "Application Deleted");
					RequestDispatcher rd = request.getRequestDispatcher("seeker_Status.jsp");
					rd.forward(request, response);
				} else if (status.equals("not available")) {
					request.setAttribute("status", "Failed to Delete Application");
					RequestDispatcher rd = request.getRequestDispatcher("seeker_Status.jsp");
					rd.forward(request, response);
				} else if (status.equals("failed")) {
					request.setAttribute("status", "Failed to Delete Application");
					RequestDispatcher rd = request.getRequestDispatcher("seeker_Status.jsp");
					rd.forward(request, response);
				}
			}	
			else if (request.getParameter("AdminDeleteApp") != null) {
				String AppID = request.getParameter("AppID");
				 String UID = request.getParameter("uID");
				String status = reg.delApplication(AppID);
				if (status.equals("success")) {
					request.setAttribute("status", "Application Deleted");
					RequestDispatcher rd = request.getRequestDispatcher("admin_applById.jsp?u_id="+UID);
					rd.forward(request, response);
				} else if (status.equals("failed")) {
					request.setAttribute("status", "Failed to Delete Application");
					RequestDispatcher rd = request.getRequestDispatcher("admin_applById.jsp?u_id="+UID);
					rd.forward(request, response);
				}
			}
			else if (request.getParameter("AdminAllDeleteApp") != null) {
				String AppID = request.getParameter("AppID");
				
				String status = reg.delApplication(AppID);
				if (status.equals("success")) {
					request.setAttribute("status", "Application Deleted");
					RequestDispatcher rd = request.getRequestDispatcher("admin_appl.jsp");
					rd.forward(request, response);
				} else if (status.equals("failed")) {
					request.setAttribute("status", "Failed to Delete Application");
					RequestDispatcher rd = request.getRequestDispatcher("admin_appl.jsp");
					rd.forward(request, response);
				}
			}
			else if (request.getParameter("Deletejob") != null) {
				String JobID = request.getParameter("JobID");
				String status = reg.delJob(JobID);
				if (status.equals("success")) {
					request.setAttribute("status", "Job Deleted");
					RequestDispatcher rd = request.getRequestDispatcher("recruiter_jobs.jsp");
					rd.forward(request, response);
				} else if (status.equals("not available")) {
					request.setAttribute("status", "Failed to Delete Job");
					RequestDispatcher rd = request.getRequestDispatcher("recruiter_jobs.jsp");
					rd.forward(request, response);
				} else if (status.equals("failed")) {
					request.setAttribute("status", "Failed to Delete Job");
					RequestDispatcher rd = request.getRequestDispatcher("recruiter_jobs.jsp");
					rd.forward(request, response);
				}
			}
			else if (request.getParameter("AdminDeletejob") != null) {
				String JobID = request.getParameter("JobID");
				 String UID = request.getParameter("uID");
				String status = reg.delJob(JobID);
				if (status.equals("success")) {
					request.setAttribute("status", "Job Deleted");
					RequestDispatcher rd = request.getRequestDispatcher("admin_jobById.jsp?u_id="+UID);
					rd.forward(request, response);
				} else if (status.equals("not available")) {
					request.setAttribute("status", "Job Not Deleted");
					RequestDispatcher rd = request.getRequestDispatcher("admin_jobById.jsp?u_id="+UID);
					rd.forward(request, response);
				} else if (status.equals("failed")) {
					request.setAttribute("status", "Failed to Delete Job");
					RequestDispatcher rd = request.getRequestDispatcher("admin_jobById.jsp?u_id="+UID);
					rd.forward(request, response);
				}
			}
			else if (request.getParameter("AdminAllDeletejob") != null) {
				String JobID = request.getParameter("JobID");
				 
				String status = reg.delJob(JobID);
				if (status.equals("success")) {
					request.setAttribute("status", "Job Deleted");
					RequestDispatcher rd = request.getRequestDispatcher("admin_jobs.jsp");
					rd.forward(request, response);
				} else if (status.equals("not available")) {
					request.setAttribute("status", "Failed to Delete Job");
					RequestDispatcher rd = request.getRequestDispatcher("admin_jobs.jsp");
					rd.forward(request, response);
				} else if (status.equals("failed")) {
					request.setAttribute("status", "Failed to Delete Job");
					RequestDispatcher rd = request.getRequestDispatcher("admin_jobs.jsp");
					rd.forward(request, response);
				}
			}
			else if (request.getParameter("delUser") != null) {
				String UserID = request.getParameter("UserID");
				String status = reg.delUser(UserID);
				if (status.equals("success")) {
					request.setAttribute("status", "Job Deleted");
					RequestDispatcher rd = request.getRequestDispatcher("admin_user.jsp");
					rd.forward(request, response);
				} else if (status.equals("not available")) {
					request.setAttribute("status", "Failed to Delete Job");
					RequestDispatcher rd = request.getRequestDispatcher("admin_user.jsp");
					rd.forward(request, response);
				} else if (status.equals("failed")) {
					request.setAttribute("status", "Failed to Delete Job");
					RequestDispatcher rd = request.getRequestDispatcher("admin_user.jsp");
					rd.forward(request, response);
				}
			}
			else if (request.getParameter("acceptAppl") != null) {
				String AppID = request.getParameter("AppID");
				 String jobID = request.getParameter("JobID");
				String status = reg.acceptApp(AppID);
				if (status.equals("success")) {
					request.setAttribute("status", "Application Accepted");
					RequestDispatcher rd = request.getRequestDispatcher("recruiter_applications.jsp?Job_Id="+jobID);
					rd.forward(request, response);
				}  else if (status.equals("failed")) {
					request.setAttribute("status", "Failed to Accept Application");
					RequestDispatcher rd = request.getRequestDispatcher("recruiter_applications.jsp?Job_Id="+jobID);
					rd.forward(request, response);
				}
			}
			else if (request.getParameter("CancelAppl") != null) {
				String AppID = request.getParameter("AppID");
				 String jobID = request.getParameter("JobID");
				String status = reg.cancelApp(AppID);
				if (status.equals("success")) {
					request.setAttribute("status", "Application Cancelled");
					RequestDispatcher rd = request.getRequestDispatcher("recruiter_applications.jsp?Job_Id="+jobID);
					rd.forward(request, response);
				}  else if (status.equals("failed")) {
					request.setAttribute("status", "Failed to Cancel Application");
					RequestDispatcher rd = request.getRequestDispatcher("recruiter_applications.jsp?Job_Id="+jobID);
					rd.forward(request, response);
				}
			}
//			else if (request.getParameter("ResponseAppl") != null) {
//				String AppID = request.getParameter("AppID");
//				String status = reg.ResponseApp(AppID);
//				if (status.equals("success")) {
//					request.setAttribute("status", "Application Responded");
//					RequestDispatcher rd = request.getRequestDispatcher("recruiter_response.jsp");
//					rd.forward(request, response);
//				}  else if (status.equals("failed")) {
//					request.setAttribute("status", "Failed to Responed Application");
//					RequestDispatcher rd = request.getRequestDispatcher("recruiter_response.jsp");
//					rd.forward(request, response);
//				}
//			}
			
			
			
			
			
			
			
			else if (request.getParameter("Otp") != null) {
				
			}
			
				
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		processRequest(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		processRequest(request, response);
	}

	public String getServletInfo() {
		return "Short description";
	}
}

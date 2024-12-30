package Model;

import java.sql.*;


import java.util.ArrayList;

import jakarta.servlet.http.HttpSession;

import Model.*;

public class Registration {

	private Connection con;
	HttpSession se;

	public Registration(HttpSession session) {
		try {
			Class.forName("com.mysql.cj.jdbc.Driver"); // Load the drivers
			con = DriverManager.getConnection("jdbc:mysql://localhost:3306/jobportal", "root", "tiger");

			// Connection with database
			se = session;
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	public String register(String name, String phone, String email, String pin, String cat) {
		PreparedStatement ps1 = null;
		PreparedStatement ps2 = null;
		String status = "";
		try {
			// Check if the user already exists
			Statement st = con.createStatement();
			ResultSet rs = st.executeQuery("SELECT * FROM users WHERE phone='" + phone + "' OR email='" + email + "';");
			boolean exists = rs.next();

			if (exists) {
				status = "existed";
			} else {
				// Insert into users table
				ps1 = con.prepareStatement(
						"INSERT INTO users (name, phone, email, pin, category, date) VALUES (?, ?, ?, ?, ?, NOW())",
						Statement.RETURN_GENERATED_KEYS);
				ps1.setString(1, name);
				ps1.setString(2, phone);
				ps1.setString(3, email);
				ps1.setString(4, pin);
				ps1.setString(5, cat);
				int result1 = ps1.executeUpdate();

				// Check if user insertion was successful
				if (result1 > 0) {
					// Get the generated user ID
					ResultSet generatedKeys = ps1.getGeneratedKeys();
					int id = 0;
					if (generatedKeys.next()) {
						id = generatedKeys.getInt(1); // Get the generated user ID
					}

					// Insert into seeker table using the generated user ID
					ps2 = con.prepareStatement("INSERT INTO seeker (id, name, phone, email) VALUES (?, ?, ?, ?);");
					ps2.setInt(1, id); // Set the foreign key reference to the generated user ID
					ps2.setString(2, name);
					ps2.setString(3, phone);
					ps2.setString(4, email);
					int result2 = ps2.executeUpdate();
					se.setAttribute("name", name);
					se.setAttribute("email", email);
					se.setAttribute("id", id);
					se.setAttribute("category", cat);
					
					if (result2 > 0) {
						status = "success";

					} else {
						status = "failure";
					}
					rs = st.executeQuery("SELECT seeker_id FROM seeker WHERE id=" + id + ";");

					// Check if the result exists and move the cursor to the first row
					exists = rs.next();
					if (exists) {
						String seeker_id = rs.getString("seeker_id");
						se.setAttribute("seeker_id", seeker_id);
					}
					
				}
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return status;
	}
	
	
	
	public void addRecruiter(String name,String phone,String email,String pw,String cat) {
		String id="0";
		try {
			Statement st = con.createStatement();
			PreparedStatement ps1 = null;
			ResultSet rs;
			rs = st.executeQuery("SELECT id FROM users WHERE email='" + email + "' AND pin='" + pw + "' AND name='" + name + "' AND phone='"+phone+"' AND category='"+ cat +"';");
			boolean exists = rs.next();
			if (exists) {
				 id = rs.getString("id");
				 System.out.println(id);
			}
			ps1 = con.prepareStatement("INSERT INTO recruiter (r_id,user_id,name,email,phone) VALUES (0,?, ?, ?, ?)");
			ps1.setString(1, id); // Set the foreign key reference to the generated user ID
			ps1.setString(2, name);
			ps1.setString(3, email);
			ps1.setString(4, phone);
			
			ps1.executeUpdate();
		}
		catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	
	
	public String login(String email, String pin) {
		String status = "";
		try {
			Statement st = con.createStatement();
			ResultSet rs = st.executeQuery("SELECT * FROM users WHERE email='" + email + "' AND pin='" + pin + "';");
			boolean exists = rs.next();

			if (exists) {
				String id = rs.getString("id");
				String name = rs.getString("name");
				String cat = rs.getString("category");
				se.setAttribute("name", name);
				se.setAttribute("email", email);
				se.setAttribute("id", id);
				se.setAttribute("category", cat);
				// Now execute the query for seeker_id
				rs = st.executeQuery("SELECT seeker_id FROM seeker WHERE id=" + id + ";");

				// Check if the result exists and move the cursor to the first row
				exists = rs.next();
				if (exists) {
					String seeker_id = rs.getString("seeker_id");
					se.setAttribute("seeker_id", seeker_id);
				}
				

				status = "success";
			} else {
				status = "failure";
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return status;
	}

	public String ForgotPassword(String mail, String pw) {
		String status = "";
		try {
			Statement st = con.createStatement();

			int rspw = st.executeUpdate("update users set pin='" + pw + "' where email='" + mail + "';");
			if (rspw > 0) {
				status = "success";
			} else {
				status = "failure";
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return status;
	}

	public String getPassword(String email, String oldPass) {
		// TODO Auto-generated method stub
		String status = "";
		PreparedStatement ps = null;
		ResultSet rs = null;
		String query = "select * from users where email=? and pin=?";
		try {
			ps = con.prepareStatement(query);
			ps.setString(1, email);
			ps.setString(2, oldPass);
			rs = ps.executeQuery();
			if (rs.next()) {
				// se.setAttribute("pwd", rs.getString(5));
				status = "success";
			} else {
				status = "failed";
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		// System.out.println(status);
		return status;
	}

	public String resetPassword(String email, String pwd) {
		// TODO Auto-generated method stub
		String status = "";
		PreparedStatement ps = null;

		try {
			ps = con.prepareStatement("update users set pin =  ? where  email =  ?");
			ps.setString(1, pwd);
			ps.setString(2, email);
			int rc = ps.executeUpdate();
			if (rc > 0) {
				status = "success";
			} else {
				status = "failed";
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return status;
	}

	public String updateSeeker(String name, String phone, String email, String dob, String gender, String address,
			String qualification, String specialization, String experience, String period, String skills, String ten,
			String twelve, String photo) {
		String status = "";
		PreparedStatement stmt;

		
		String sql = "UPDATE seeker SET name = ?, phone = ?, email = ?, dob = ?, gender = ?, "
				+ "address = ?, qualification = ?, specialization = ?, experience = ?, "
				+ "period = ?, skills = ?, tenth = ?, twelfth = ?,picture= ? WHERE seeker_id = '"+se.getAttribute("seeker_id")+"';";

		try {
			stmt = (PreparedStatement) con.prepareStatement(sql);
			// Set the parameters in the prepared statement
			stmt.setString(1, name); // Name
			stmt.setString(2, phone); // Phone
			stmt.setString(3, email); // Email
			stmt.setString(4, dob); // Date of Birth
			stmt.setString(5, gender); // Gender (e.g., "male", "female")
			stmt.setString(6, address); // Address
			stmt.setString(7, qualification); // Qualification
			stmt.setString(8, specialization); // Specialization
			stmt.setString(9, experience); // Experience (e.g., "experienced", "fresher")
			stmt.setString(10, period); // Period of experience
			stmt.setString(11, skills); // Skills (could be a comma-separated string)
			stmt.setString(12, ten); // 10th grade score (as string, convert to decimal if needed)
			stmt.setString(13, twelve); // 12th grade score (as string, convert to decimal if needed)
			stmt.setString(14, photo);// seeker_id (the identifier to update)
			System.out.println(se.getAttribute("seeker_id"));
			// Execute the update
			int rowsUpdated = stmt.executeUpdate();

			// Optionally check if the update was successful
			if (rowsUpdated > 0) {
				status = "success";

			}

		} catch (SQLException e) {
			e.printStackTrace();
		}

		return status;
	}

	public Seeker getSeekerInfo() {
		Seeker s = new Seeker();

		PreparedStatement ps = null;
		ResultSet rs = null;
		String query = "select *,DATE_FORMAT(dob, '%d-%m-%Y') as Dob from seeker where id=" + se.getAttribute("id") + ";";
		try {
			ps = con.prepareStatement(query);
			rs = ps.executeQuery();
			if (rs.next()) {
				s.setName(rs.getString("name"));
				s.setPhone(rs.getString("phone"));
				s.setEmail(rs.getString("email"));
				s.setDob(rs.getString("Dob"));
				s.setGender(rs.getString("gender"));
				s.setAddress(rs.getString("address"));
				s.setQualification(rs.getString("qualification"));
				s.setSpecialization(rs.getString("specialization"));
				s.setExperience(rs.getString("experience"));
				s.setPeriod(rs.getString("period"));
				s.setSkills(rs.getString("skills"));
				s.setTenth(rs.getString("tenth"));
				s.setTwelfth(rs.getString("twelfth"));
				s.setPhoto(rs.getString("picture"));
			}

		} catch (SQLException e) {
			e.printStackTrace();
		}
		return s;
	}
	
	public Seeker getSeekerInfobyId(String uId) {
		Seeker s = new Seeker();

		PreparedStatement ps = null;
		ResultSet rs = null;
		String query = "select * from seeker where id=" + uId + ";";
		try {
			ps = con.prepareStatement(query);
			rs = ps.executeQuery();
			if (rs.next()) {
				s.setName(rs.getString("name"));
				s.setPhone(rs.getString("phone"));
				s.setEmail(rs.getString("email"));
				s.setDob(rs.getString("dob"));
				s.setGender(rs.getString("gender"));
				s.setAddress(rs.getString("address"));
				s.setQualification(rs.getString("qualification"));
				s.setSpecialization(rs.getString("specialization"));
				s.setExperience(rs.getString("experience"));
				s.setPeriod(rs.getString("period"));
				s.setSkills(rs.getString("skills"));
				s.setTenth(rs.getString("tenth"));
				s.setTwelfth(rs.getString("twelfth"));
			}

		} catch (SQLException e) {
			e.printStackTrace();
		}
		return s;
	}
	
	

	public String addJob(String id,String jTitle, String jLocation, String jType, String experience, String qualification,
			String percentage, String experienceLevel, String salary, String skills, String cname, String clogo,
			String endDate, String jCategory, String cInfo, String vacancy, String jDescription) {

		PreparedStatement ps;
		String status = "";
		String aid=id;
		try {
			ps = (PreparedStatement) con
					.prepareStatement("insert into jobs values (0,'"+aid+"',?,?,?,?,?,?,?,?,now(),?,?,?,?,?,?,?,'active')");
			ps.setString(1, jTitle);
			ps.setString(2, cname);
			ps.setString(3, clogo);
			ps.setString(4, jLocation);
			ps.setString(5, jType);
			ps.setString(6, salary);
			ps.setString(7, experience);
			ps.setString(8, skills);
			ps.setString(9, endDate);
			ps.setString(10, jDescription);
			ps.setString(11, jCategory);
			ps.setString(12, qualification);
			ps.setString(13, cInfo);
			ps.setString(14, vacancy);
			ps.setString(15, percentage);

			int a = ps.executeUpdate();
			if (a > 0) {
				status = "Submitted";

			} else
				status = "Failed";
		} catch (Exception e) {
			e.printStackTrace();
		}
		return status;
	}

	public ArrayList<Jobs> getJobs() {
		ArrayList<Jobs> al = new ArrayList<Jobs>();
		try {
			ResultSet rs = null;
			Statement st = null;
			st = con.createStatement();
			String qry = " SELECT * FROM jobs;";
			rs = st.executeQuery(qry);
			while (rs.next()) {
				Jobs d = new Jobs(); // 1..r---db 2.. pass the data or value to Dproduct class set method
				d.setJobId(rs.getString("job_id"));
				d.setJobTitle(rs.getString("job_title"));
				d.setCompanyName(rs.getString("company_name"));
				d.setCompanyLogo(rs.getString("company_logo"));
				d.setLocation(rs.getString("j_location"));
				d.setJobType(rs.getString("job_type"));
				d.setSalary(rs.getString("salary"));
				d.setExperienceLevel(rs.getString("experience_level"));
				d.setSkills(rs.getString("skills"));
				d.setPostedDate(rs.getString("posted_date"));
				d.setApplicationDeadline(rs.getString("application_deadline"));
				d.setJobDescription(rs.getString("job_description"));
				d.setJobCategory(rs.getString("job_category"));
				d.setRequiredQualifications(rs.getString("required_qualifications"));
				d.setContactInformation(rs.getString("contact_information"));
				d.setVacancy(rs.getString("vacancy"));
				d.setPercentage(rs.getString("percentage"));
				d.setStatus(rs.getString("status"));
				al.add(d);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return al;
	}

	public ArrayList<Jobs> filter(String category, String location, String jobType, String jobExperience,
			String jobsalary) {
		ArrayList<Jobs> al = new ArrayList<Jobs>();
		try {
			ResultSet rs = null;
			Statement st = null;
			st = con.createStatement();
			String qry = " SELECT * FROM jobs where job_category='" + category + "' and j_location='" + location
					+ "' and job_type='" + jobType + "' and experience_level='" + jobExperience
					+ "' and salary BETWEEN 0 AND " + jobsalary + ";";
			rs = st.executeQuery(qry);
			while (rs.next()) {

				Jobs d = new Jobs(); // 1..r---db 2.. pass the data or value to Dproduct class set method
				d.setJobId(rs.getString("job_id"));
				d.setJobTitle(rs.getString("job_title"));
				d.setCompanyName(rs.getString("company_name"));
				d.setCompanyLogo(rs.getString("company_logo"));
				d.setLocation(rs.getString("j_location"));
				d.setJobType(rs.getString("job_type"));
				d.setSalary(rs.getString("salary"));
				d.setExperienceLevel(rs.getString("experience_level"));
				d.setSkills(rs.getString("skills"));
				d.setPostedDate(rs.getString("posted_date"));
				d.setApplicationDeadline(rs.getString("application_deadline"));
				d.setJobDescription(rs.getString("job_description"));
				d.setJobCategory(rs.getString("job_category"));
				d.setRequiredQualifications(rs.getString("required_qualifications"));
				d.setContactInformation(rs.getString("contact_information"));
				d.setVacancy(rs.getString("vacancy"));
				d.setPercentage(rs.getString("percentage"));
				d.setStatus(rs.getString("status"));
				al.add(d);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return al;
	}

	public ArrayList<Jobs> getJobCat(String category) {
		ArrayList<Jobs> al = new ArrayList<Jobs>();
		try {
			Statement st = null;
			ResultSet rs = null;
			st = con.createStatement();
			String qry = " select * from jobs where job_category='" + category + "';";
			rs = st.executeQuery(qry);
			while (rs.next()) {
				Jobs d = new Jobs();
				d.setJobId(rs.getString("job_id"));
				d.setJobTitle(rs.getString("job_title"));
				d.setCompanyName(rs.getString("company_name"));
				d.setCompanyLogo(rs.getString("company_logo"));
				d.setLocation(rs.getString("j_location"));
				d.setJobType(rs.getString("job_type"));
				d.setSalary(rs.getString("salary"));
				d.setExperienceLevel(rs.getString("experience_level"));
				d.setSkills(rs.getString("skills"));
				d.setPostedDate(rs.getString("posted_date"));
				d.setApplicationDeadline(rs.getString("application_deadline"));
				d.setJobDescription(rs.getString("job_description"));
				d.setJobCategory(rs.getString("job_category"));
				d.setRequiredQualifications(rs.getString("required_qualifications"));
				d.setContactInformation(rs.getString("contact_information"));
				d.setVacancy(rs.getString("vacancy"));
				d.setPercentage(rs.getString("percentage"));
				d.setStatus(rs.getString("status"));
				al.add(d);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return al;
	}

	public ArrayList<Jobs> getJobLoc(String location) {
		ArrayList<Jobs> al = new ArrayList<Jobs>();
		try {
			Statement st = null;
			ResultSet rs = null;
			st = con.createStatement();
			String qry = " select * from jobs where j_location='" + location + "';";
			rs = st.executeQuery(qry);
			while (rs.next()) {
				Jobs d = new Jobs();
				d.setJobId(rs.getString("job_id"));
				d.setJobTitle(rs.getString("job_title"));
				d.setCompanyName(rs.getString("company_name"));
				d.setCompanyLogo(rs.getString("company_logo"));
				d.setLocation(rs.getString("j_location"));
				d.setJobType(rs.getString("job_type"));
				d.setSalary(rs.getString("salary"));
				d.setExperienceLevel(rs.getString("experience_level"));
				d.setSkills(rs.getString("skills"));
				d.setPostedDate(rs.getString("posted_date"));
				d.setApplicationDeadline(rs.getString("application_deadline"));
				d.setJobDescription(rs.getString("job_description"));
				d.setJobCategory(rs.getString("job_category"));
				d.setRequiredQualifications(rs.getString("required_qualifications"));
				d.setContactInformation(rs.getString("contact_information"));
				d.setVacancy(rs.getString("vacancy"));
				d.setPercentage(rs.getString("percentage"));
				d.setStatus(rs.getString("status"));
				al.add(d);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return al;
	}

	public Jobs getJobById(String Job_id) {
		Statement st = null;
		ResultSet rs = null;
		Jobs d = null;
		try {
			st = con.createStatement();
			rs = st.executeQuery(
					"select *,date_format(application_deadline,'%d %b, %Y') as date1,date_format(posted_date,'%d %b, %Y') as date2 from jobs where job_id= '"
							+ Job_id + "'");
			boolean b = rs.next();
			if (b == true) {
				d = new Jobs();
				d.setJobId(rs.getString("job_id"));
				d.setJobTitle(rs.getString("job_title"));
				d.setCompanyName(rs.getString("company_name"));
				d.setCompanyLogo(rs.getString("company_logo"));
				d.setLocation(rs.getString("j_location"));
				d.setJobType(rs.getString("job_type"));
				d.setSalary(rs.getString("salary"));
				d.setExperienceLevel(rs.getString("experience_level"));
				d.setSkills(rs.getString("skills"));
				d.setPostedDate(rs.getString("date2"));
				d.setApplicationDeadline(rs.getString("date1"));
				d.setJobDescription(rs.getString("job_description"));
				d.setJobCategory(rs.getString("job_category"));
				d.setRequiredQualifications(rs.getString("required_qualifications"));
				d.setContactInformation(rs.getString("contact_information"));
				d.setVacancy(rs.getString("vacancy"));
				d.setPercentage(rs.getString("percentage"));
				d.setStatus(rs.getString("status"));
			} else {
				d = null;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}

		return d;
	}
	
	public ArrayList<Jobs> getJobById() {
		Statement st = null;
		ResultSet rs = null;
		ArrayList<Jobs> a=new ArrayList<Jobs>();
		
		try {
			st = con.createStatement();
			rs = st.executeQuery(
					"select *,date_format(application_deadline,'%d %b, %Y') as date1,date_format(posted_date,'%d %b, %Y') as date2 from jobs where user_id= '"
							+ se.getAttribute("id") + "'");
			
			 while (rs.next()) {
				Jobs d  = new Jobs();
				d.setJobId(rs.getString("job_id"));
				d.setJobTitle(rs.getString("job_title"));
				d.setCompanyName(rs.getString("company_name"));
				d.setCompanyLogo(rs.getString("company_logo"));
				d.setLocation(rs.getString("j_location"));
				d.setJobType(rs.getString("job_type"));
				d.setSalary(rs.getString("salary"));
				d.setExperienceLevel(rs.getString("experience_level"));
				d.setSkills(rs.getString("skills"));
				d.setPostedDate(rs.getString("date2"));
				d.setApplicationDeadline(rs.getString("date1"));
				d.setJobDescription(rs.getString("job_description"));
				d.setJobCategory(rs.getString("job_category"));
				d.setRequiredQualifications(rs.getString("required_qualifications"));
				d.setContactInformation(rs.getString("contact_information"));
				d.setVacancy(rs.getString("vacancy"));
				d.setPercentage(rs.getString("percentage"));
				d.setStatus(rs.getString("status"));
				a.add(d);
			 }
		} catch (Exception e) {
			e.printStackTrace();
		}

		return a;
	}
	public ArrayList<Jobs> getAdminJobById(String uid) {
		Statement st = null;
		ResultSet rs = null;
		ArrayList<Jobs> a=new ArrayList<Jobs>();
		
		try {
			st = con.createStatement();
			rs = st.executeQuery(
					"select *,date_format(application_deadline,'%d %b, %Y') as date1,date_format(posted_date,'%d %b, %Y') as date2 from jobs where user_id= '"
							+ uid+ "'");
			
			 while (rs.next()) {
				Jobs d  = new Jobs();
				d.setJobId(rs.getString("job_id"));
				d.setJobTitle(rs.getString("job_title"));
				d.setCompanyName(rs.getString("company_name"));
				d.setCompanyLogo(rs.getString("company_logo"));
				d.setLocation(rs.getString("j_location"));
				d.setJobType(rs.getString("job_type"));
				d.setSalary(rs.getString("salary"));
				d.setExperienceLevel(rs.getString("experience_level"));
				d.setSkills(rs.getString("skills"));
				d.setPostedDate(rs.getString("date2"));
				d.setApplicationDeadline(rs.getString("date1"));
				d.setJobDescription(rs.getString("job_description"));
				d.setJobCategory(rs.getString("job_category"));
				d.setRequiredQualifications(rs.getString("required_qualifications"));
				d.setContactInformation(rs.getString("contact_information"));
				d.setVacancy(rs.getString("vacancy"));
				d.setPercentage(rs.getString("percentage"));
				d.setStatus(rs.getString("status"));
				a.add(d);
			 }
		} catch (Exception e) {
			e.printStackTrace();
		}

		return a;
	}
	
	public ArrayList<Jobs> getAdminAllJob() {
		Statement st = null;
		ResultSet rs = null;
		ArrayList<Jobs> a=new ArrayList<Jobs>();
		
		try {
			st = con.createStatement();
			rs = st.executeQuery(
					"select *,date_format(application_deadline,'%d %b, %Y') as date1,date_format(posted_date,'%d %b, %Y') as date2 from jobs ");
			
			 while (rs.next()) {
				Jobs d  = new Jobs();
				d.setJobId(rs.getString("job_id"));
				d.setJobTitle(rs.getString("job_title"));
				d.setCompanyName(rs.getString("company_name"));
				d.setCompanyLogo(rs.getString("company_logo"));
				d.setLocation(rs.getString("j_location"));
				d.setJobType(rs.getString("job_type"));
				d.setSalary(rs.getString("salary"));
				d.setExperienceLevel(rs.getString("experience_level"));
				d.setSkills(rs.getString("skills"));
				d.setPostedDate(rs.getString("date2"));
				d.setApplicationDeadline(rs.getString("date1"));
				d.setJobDescription(rs.getString("job_description"));
				d.setJobCategory(rs.getString("job_category"));
				d.setRequiredQualifications(rs.getString("required_qualifications"));
				d.setContactInformation(rs.getString("contact_information"));
				d.setVacancy(rs.getString("vacancy"));
				d.setPercentage(rs.getString("percentage"));
				d.setStatus(rs.getString("status"));
				a.add(d);
			 }
		} catch (Exception e) {
			e.printStackTrace();
		}

		return a;
	}

	public User_seeker getSeekerbyId(String Jobuser_id) {
		Statement st = null;
		ResultSet rs = null;
		User_seeker seeker = new User_seeker();
		try {
			st = con.createStatement();
			rs = st.executeQuery(
					"select *,date_format(dob,'%d %b, %Y') as date2 from job_seeker_details where user_id= '"
							+ Jobuser_id + "'");
			boolean b = rs.next();
			if (b == true) {

				seeker.setSeekerId(rs.getString("seeker_id"));
				seeker.setUserId(rs.getString("user_id"));
				seeker.setGender(rs.getString("gender"));
				seeker.setDob(rs.getString("date2")); // Or use Date conversion if needed
				seeker.setAddress(rs.getString("address"));
				seeker.setHighestDegree(rs.getString("highest_degree"));
				seeker.setSpecialization(rs.getString("specialization"));
				seeker.setCollegeName(rs.getString("college_name"));
				seeker.setNumberOfBacklogs(rs.getString("number_of_backlogs"));
				seeker.setCgpa(rs.getString("cgpa"));
				seeker.setGrade10Percentage(rs.getString("grade_10_percentage"));
				seeker.setGrade12Percentage(rs.getString("grade_12_percentage"));
				seeker.setExperienceYears(rs.getString("experience_years"));
				seeker.setSkills(rs.getString("skills"));
				seeker.setCertifications(rs.getString("certifications"));
			} else {
				seeker = null;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}

		return seeker;
	}

	public user getUserrbyId() {
		Statement st = null;
		ResultSet rs = null;
		user obj = new user();
		try {
			st = con.createStatement();
			rs = st.executeQuery(
					"select *,date_format(date,'%d %b, %Y') as date2 from users where id= '" + se.getAttribute("id") + "'");
			boolean b = rs.next();
			if (b == true) {

				obj.setId(rs.getString("id"));
				obj.setName(rs.getString("name"));
				obj.setEmail(rs.getString("email"));
				obj.setPhone(rs.getString("phone"));
				obj.setCategory(rs.getString("category"));
				obj.setDate(rs.getString("date"));
				obj.setPin(rs.getString("pin"));
			} else {
				obj = null;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}

		return obj;
	}

	public String ApplyNow(String uname, String experience, String email, String phone, String skills, String jobId,
			String userId) {

		String status = "";
		ResultSet rs = null;
		PreparedStatement ps = null;
		try {
			Statement st = con.createStatement();
			rs = st.executeQuery("select * from Applications where job_id=" + jobId + " and user_id=" + userId + ";");
			boolean b = rs.next();
			if (b == true) {
				status = "existed";
			} else {
				ps = (PreparedStatement) con
						.prepareStatement("insert into Applications values (0,?,?,?,?,?,?,now(),?,'pending')");
				ps.setString(1, jobId);
				ps.setString(2, userId);
				ps.setString(3, uname);
				ps.setString(4, email);
				ps.setString(5, phone);
				ps.setString(6, experience);
				ps.setString(7, skills);

				int a = ps.executeUpdate();
				if (a > 0) {
					status = "success";

				} else {
					status = "failure";
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return status;
	}

	public int getProfiles() {
		Statement st = null;
		ResultSet rs = null;
		int hProfiles = 0;
		try {
			st = con.createStatement();
			rs = st.executeQuery("SELECT COUNT(*) AS total_rows FROM users");
			boolean b = rs.next();
			if (b == true) {

				hProfiles = rs.getInt("total_rows");
			} else {
				hProfiles = 0;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}

		return hProfiles;
	}

	public int getHomeJobs() {
		Statement st = null;
		ResultSet rs = null;
		int hjobs = 0;
		try {
			st = con.createStatement();
			rs = st.executeQuery("SELECT COUNT(*) AS total_rows FROM jobs");
			boolean b = rs.next();
			if (b == true) {

				hjobs = rs.getInt("total_rows");
			} else {
				hjobs = 0;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}

		return hjobs;
	}

	public int getHomeApp() {
		Statement st = null;
		ResultSet rs = null;
		int hApp = 0;
		try {
			st = con.createStatement();
			rs = st.executeQuery("SELECT COUNT(*) AS total_rows FROM applications");
			boolean b = rs.next();
			if (b == true) {

				hApp = rs.getInt("total_rows");
			} else {
				hApp = 0;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}

		return hApp;
	}
	public int getjobblr() {
		Statement st = null;
		ResultSet rs = null;
		int hApp = 0;
		try {
			st = con.createStatement();
			rs = st.executeQuery("SELECT COUNT(*) AS row_count FROM jobs WHERE j_location='Bangalore';");
			boolean b = rs.next();
			if (b == true) {

				hApp = rs.getInt("row_count");
			} else {
				hApp = 0;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}

		return hApp;
	}
	public int getjobchn() {
		Statement st = null;
		ResultSet rs = null;
		int hApp = 0;
		try {
			st = con.createStatement();
			rs = st.executeQuery("SELECT COUNT(*) AS row_count FROM jobs WHERE j_location='Chennai';");
			boolean b = rs.next();
			if (b == true) {

				hApp = rs.getInt("row_count");
			} else {
				hApp = 0;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}

		return hApp;
	}
	public int getjobhdb() {
		Statement st = null;
		ResultSet rs = null;
		int hApp = 0;
		try {
			st = con.createStatement();
			rs = st.executeQuery("SELECT COUNT(*) AS row_count FROM jobs WHERE j_location='Hyderabad';");
			boolean b = rs.next();
			if (b == true) {

				hApp = rs.getInt("row_count");
			} else {
				hApp = 0;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}

		return hApp;
	}
	public int getUserApp() {
		Statement st = null;
		ResultSet rs = null;
		int hApp = 0;
		try {
			st = con.createStatement();
			rs = st.executeQuery("SELECT COUNT(*) AS total_rows FROM applications where user_id='"+se.getAttribute("id")+"';");
			boolean b = rs.next();
			if (b == true) {

				hApp = rs.getInt("total_rows");
			} else {
				hApp = 0;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}

		return hApp;
	}
	public int getUserResp() {
		Statement st = null;
		ResultSet rs = null;
		int hApp = 0;
		try {
			st = con.createStatement();
			rs = st.executeQuery("SELECT COUNT(*) AS total_rows FROM applications where (status='responed') and (user_id='"+se.getAttribute("id")+"');");
			boolean b = rs.next();
			if (b == true) {

				hApp = rs.getInt("total_rows");
			} else {
				hApp = 0;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}

		return hApp;
	}
	
	public int getLastWeekUser() {
		Statement st = null;
		ResultSet rs = null;
		int hApp = 0;
		try {
			st = con.createStatement();
			rs = st.executeQuery("SELECT COUNT(*) AS row_count FROM users WHERE date >= DATE_SUB(CURDATE(), INTERVAL 7 DAY);");
			boolean b = rs.next();
			if (b == true) {

				hApp = rs.getInt("row_count");
			} else {
				hApp = 0;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}

		return hApp;
	}
	
	public int getLastWeekJobs() {
		Statement st = null;
		ResultSet rs = null;
		int hApp = 0;
		try {
			st = con.createStatement();
			rs = st.executeQuery("SELECT COUNT(*) AS row_count FROM jobs WHERE posted_date >= DATE_SUB(CURDATE(), INTERVAL 7 DAY);");
			boolean b = rs.next();
			if (b == true) {

				hApp = rs.getInt("row_count");
			} else {
				hApp = 0;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}

		return hApp;
	}
	
	public int getLastWeekApp() {
		Statement st = null;
		ResultSet rs = null;
		int hApp = 0;
		try {
			st = con.createStatement();
			rs = st.executeQuery("SELECT COUNT(*) AS row_count FROM applications WHERE appliedDate >= DATE_SUB(CURDATE(), INTERVAL 7 DAY);");
			boolean b = rs.next();
			if (b == true) {

				hApp = rs.getInt("row_count");
			} else {
				hApp = 0;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}

		return hApp;
	}
	
	public int getLastMonthuser() {
		Statement st = null;
		ResultSet rs = null;
		int hApp = 0;
		try {
			st = con.createStatement();
			rs = st.executeQuery("SELECT COUNT(*) AS row_count FROM users WHERE date >= DATE_SUB(CURDATE(), INTERVAL 1 MONTH);");
			boolean b = rs.next();
			if (b == true) {

				hApp = rs.getInt("row_count");
			} else {
				hApp = 0;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}

		return hApp;
	}
	
	public int getLastMonthjob() {
		Statement st = null;
		ResultSet rs = null;
		int hApp = 0;
		try {
			st = con.createStatement();
			rs = st.executeQuery("SELECT COUNT(*) AS row_count FROM jobs WHERE posted_date >= DATE_SUB(CURDATE(), INTERVAL 1 MONTH);");
			boolean b = rs.next();
			if (b == true) {

				hApp = rs.getInt("row_count");
			} else {
				hApp = 0;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}

		return hApp;
	}
	
	public int getLastMonthapp() {
		Statement st = null;
		ResultSet rs = null;
		int hApp = 0;
		try {
			st = con.createStatement();
			rs = st.executeQuery("SELECT COUNT(*) AS row_count FROM applications WHERE appliedDate >= DATE_SUB(CURDATE(), INTERVAL 1 MONTH);");
			boolean b = rs.next();
			if (b == true) {

				hApp = rs.getInt("row_count");
			} else {
				hApp = 0;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}

		return hApp;
	}

	public ArrayList<Applications> getApplications() {
		System.out.println("1");
		ArrayList<Applications> al = new ArrayList<Applications>();
		System.out.println("2");
		try {
			ResultSet rs = null;
			Statement st = null;
			st = con.createStatement();
			System.out.println("id="+se.getAttribute("id"));
			String qry = " SELECT *,date_format(appliedDate,'%d %b, %Y') as date1 FROM applications where user_id='" + se.getAttribute("id") + "'";
			rs = st.executeQuery(qry);
			
			while (rs.next()) {
				Applications d = new Applications(); // 1..r---db 2.. pass the data or value to Dproduct class set
				System.out.println("5");						// method
				d.setAppId(rs.getString("Application_id")); // Assuming column name is "id"
				d.setJobId(rs.getString("job_id")); // Assuming column name is "name"
				d.setUserId(rs.getString("user_id")); // Assuming column name is "email"
				d.setName(rs.getString("name")); // Assuming column name is "phone"
				d.setEmail(rs.getString("email")); // Assuming column name is "category"
				d.setPhone(rs.getString("phone")); // Assuming column name is "date"
				d.setApplied_date(rs.getString("date1")); // Assuming column name is "date" // Assuming column name is
															// "pin"
				d.setStatus(rs.getString("status"));
				al.add(d);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return al;
	}
	public ArrayList<Applications> getAdminAppByID(String uid) {
		
		ArrayList<Applications> al = new ArrayList<Applications>();
		
		try {
			ResultSet rs = null;
			Statement st = null;
			st = con.createStatement();
			System.out.println("id="+se.getAttribute("id"));
			String qry = " SELECT *,date_format(appliedDate,'%d %b, %Y') as date1 FROM applications where user_id='" + uid + "'";
			rs = st.executeQuery(qry);
			
			while (rs.next()) {
				Applications d = new Applications(); // 1..r---db 2.. pass the data or value to Dproduct class set
				System.out.println("5");						// method
				d.setAppId(rs.getString("Application_id")); // Assuming column name is "id"
				d.setJobId(rs.getString("job_id")); // Assuming column name is "name"
				d.setUserId(rs.getString("user_id")); // Assuming column name is "email"
				d.setName(rs.getString("name")); // Assuming column name is "phone"
				d.setEmail(rs.getString("email")); // Assuming column name is "category"
				d.setPhone(rs.getString("phone")); // Assuming column name is "date"
				d.setApplied_date(rs.getString("date1")); // Assuming column name is "date" // Assuming column name is
															// "pin"
				d.setStatus(rs.getString("status"));
				al.add(d);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return al;
	}

public ArrayList<Applications> getAdminAllApp() {
		
		ArrayList<Applications> al = new ArrayList<Applications>();
		
		try {
			ResultSet rs = null;
			Statement st = null;
			st = con.createStatement();
			System.out.println("id="+se.getAttribute("id"));
			String qry = " SELECT *,date_format(appliedDate,'%d %b, %Y') as date1 FROM applications ";
			rs = st.executeQuery(qry);
			
			while (rs.next()) {
				Applications d = new Applications(); // 1..r---db 2.. pass the data or value to Dproduct class set
				System.out.println("5");						// method
				d.setAppId(rs.getString("Application_id")); // Assuming column name is "id"
				d.setJobId(rs.getString("job_id")); // Assuming column name is "name"
				d.setUserId(rs.getString("user_id")); // Assuming column name is "email"
				d.setName(rs.getString("name")); // Assuming column name is "phone"
				d.setEmail(rs.getString("email")); // Assuming column name is "category"
				d.setPhone(rs.getString("phone")); // Assuming column name is "date"
				d.setApplied_date(rs.getString("date1")); // Assuming column name is "date" // Assuming column name is
															// "pin"
				d.setStatus(rs.getString("status"));
				al.add(d);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return al;
	}
	
	public ArrayList<Applications> getRecruiterAppsByJobID(String JobId) {
		System.out.println("1");
		ArrayList<Applications> al = new ArrayList<Applications>();
		System.out.println("2");
		try {
			ResultSet rs = null;
			Statement st = null;
			st = con.createStatement();
			
			String qry = " SELECT *,date_format(appliedDate,'%d %b, %Y') as date1 FROM applications where job_id='"+JobId+"' and status !='responed';";
			rs = st.executeQuery(qry);
			
			while (rs.next()) {
				Applications d = new Applications(); // 1..r---db 2.. pass the data or value to Dproduct class set
				System.out.println("5");						// method
				d.setAppId(rs.getString("Application_id")); // Assuming column name is "id"
				d.setJobId(rs.getString("job_id")); // Assuming column name is "name"
				d.setUserId(rs.getString("user_id")); // Assuming column name is "email"
				d.setName(rs.getString("name")); // Assuming column name is "phone"
				d.setEmail(rs.getString("email")); // Assuming column name is "category"
				d.setPhone(rs.getString("phone")); // Assuming column name is "date"
				d.setApplied_date(rs.getString("date1")); // Assuming column name is "date" // Assuming column name is
															// "pin"
				d.setStatus(rs.getString("status"));
				al.add(d);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return al;
	}
	
	public Applications getAppById(String aId) {
		
		
		Applications d = new Applications();
		try {
			ResultSet rs = null;
			Statement st = null;
			st = con.createStatement();
			
			String qry = " SELECT *,date_format(appliedDate,'%d %b, %Y') as date1 FROM applications where Application_id='"+aId+"';";
			rs = st.executeQuery(qry);
			
			while (rs.next()) {
				 // 1..r---db 2.. pass the data or value to Dproduct class set
										// method
				d.setAppId(rs.getString("Application_id")); // Assuming column name is "id"
				d.setJobId(rs.getString("job_id")); // Assuming column name is "name"
				d.setUserId(rs.getString("user_id")); // Assuming column name is "email"
				d.setName(rs.getString("name")); // Assuming column name is "phone"
				d.setEmail(rs.getString("email")); // Assuming column name is "category"
				d.setPhone(rs.getString("phone")); // Assuming column name is "date"
				d.setApplied_date(rs.getString("date1")); // Assuming column name is "date" // Assuming column name is
															// "pin"
				d.setStatus(rs.getString("status"));
				
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return d;
	}
	
	public ArrayList<Applications> getRecruiterAppsResponseByJobID() {
		System.out.println("1");
		ArrayList<Applications> al = new ArrayList<Applications>();
		System.out.println("2");
		try {
			ResultSet rs = null;
			Statement st = null;
			st = con.createStatement();
			
			String qry = " select *,date_format(appliedDate,'%d %b, %Y') as date1  from applications where (job_id in(SELECT job_id FROM jobs where user_id='"+se.getAttribute("id") +"')) and (status in('responed','accepted'));";
			rs = st.executeQuery(qry);
			
			while (rs.next()) {
				Applications d = new Applications(); // 1..r---db 2.. pass the data or value to Dproduct class set
									
				d.setAppId(rs.getString("Application_id")); // Assuming column name is "id"
				d.setJobId(rs.getString("job_id")); // Assuming column name is "name"
				d.setUserId(rs.getString("user_id")); // Assuming column name is "email"
				d.setName(rs.getString("name")); // Assuming column name is "phone"
				d.setEmail(rs.getString("email")); // Assuming column name is "category"
				d.setPhone(rs.getString("phone")); // Assuming column name is "date"
				d.setApplied_date(rs.getString("date1")); // Assuming column name is "date" // Assuming column name is
															// "pin"
				d.setStatus(rs.getString("status"));
				al.add(d);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return al;
	}

	public String delApplication(String AppID) {
		int count = 0;
		Statement st = null;
		String status = "";
		try {
			st = con.createStatement();
			count = st.executeUpdate("delete from applications where Application_id=" + AppID);
			if (count > 0) {
				status = "success";
			} else {
				status = "failed";
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return status;
	}
	
	public String delJob(String JobID) {
		int count = 0;
		Statement st = null;
		Statement st1 = null;
		String status = "";
		try {
			st = con.createStatement();
			count = st.executeUpdate("delete from jobs where job_id=" + JobID);
			if (count > 0) {
				status = "success";
				getOutSafeMode();
				st1 = con.createStatement();
				
				count = st1.executeUpdate("delete from applications where job_id=" + JobID);
				getInSafeMode();
			} else {
				status = "failed";
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return status;
	}
	public void getOutSafeMode() {
		int status = 0;
		try {
			Statement st = null;
			st = con.createStatement();
			String qry = "SET SQL_SAFE_UPDATES = 0; ";
			status = st.executeUpdate(qry);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
	}
	public String delJobsAfterDL() {
		int count = 0;
		String status="";
		Statement st = null;
		try {
			st = con.createStatement();
			count = st.executeUpdate("UPDATE jobs SET status = 'expired' WHERE application_deadline < CURDATE();");
			if (count > 0) {
				status = "success";
			} else {
				status = "failed";
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return status;
		
	}
	
	public void getInSafeMode() {
		int status = 0;
		try {
			Statement st = null;
			st = con.createStatement();
			String qry = "SET SQL_SAFE_UPDATES = 1; ";
			status = st.executeUpdate(qry);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
	}
	public String delUser(String Uid) {
		int count = 0;
		Statement st = null;
		Statement st1 = null;
		String status = "";
		forign_In();
		try {
			st = con.createStatement();
			count = st.executeUpdate("delete from users where id=" + Uid);
			st1 = con.createStatement();
			int count1 = st.executeUpdate("delete from seeker where id=" + Uid);
			if (count > 0) {
				status = "success";
			} else {
				status = "failed";
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		forign_Out();
		return status;
	}
	
	public void forign_In() {
		int count = 0;
		Statement st = null;
		String status = "";
		try {
			st = con.createStatement();
			count = st.executeUpdate("SET FOREIGN_KEY_CHECKS=0;");
			if (count > 0) {
				status = "success";
			} else {
				status = "failed";
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		
	}
	public void forign_Out() {
		int count = 0;
		Statement st = null;
		String status = "";
		try {
			st = con.createStatement();
			count = st.executeUpdate("SET FOREIGN_KEY_CHECKS=1;");
			if (count > 0) {
				status = "success";
			} else {
				status = "failed";
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		
	}
	
	public ArrayList<user> getUserDetails() {
		Statement st;
		ResultSet rs;
		ArrayList<user> al = new ArrayList<user>();
		try {
			st = con.createStatement();
			String qry = "select *," + "date_format(date,'%b %d, %Y') as date1" + " from users where id not in(1);";
			rs = st.executeQuery(qry);
			while (rs.next()) {
				user p = new user();
				p.setId(rs.getString("id"));
				p.setName(rs.getString("name"));
				p.setEmail(rs.getString("email"));
				p.setDate(rs.getString("date1"));
				p.setCategory(rs.getString("category"));
				p.setPhone(rs.getString("phone"));
				al.add(p);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return al;
	}
	public int getNoOfJobsById() {
		Statement st = null;
		ResultSet rs = null;
		int hProfiles = 0;
		try {
			st = con.createStatement();
			rs = st.executeQuery("SELECT COUNT(*) AS total_rows FROM jobs where user_id='"+se.getAttribute("id")+"';");
			boolean b = rs.next();
			if (b == true) {

				hProfiles = rs.getInt("total_rows");
			} else {
				hProfiles = 0;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}

		return hProfiles;
	}
	
	public int getNoOfAppById() {
		Statement st = null;
		ResultSet rs = null;
		int hProfiles = 0;
		try {
			st = con.createStatement();
			rs = st.executeQuery("select count(*) as total_rows from applications where (job_id in(SELECT job_id FROM jobs where user_id='"+se.getAttribute("id") +"')) and (status!='responed');");
			boolean b = rs.next();
			if (b == true) {

				hProfiles = rs.getInt("total_rows");
			} else {
				hProfiles = 0;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}

		return hProfiles;
	}
	
	public int getNoOfResponseById() {
		Statement st = null;
		ResultSet rs = null;
		int hProfiles = 0;
		try {
			st = con.createStatement();
			rs = st.executeQuery("select count(*) as total_rows from applications where (job_id in(SELECT job_id FROM jobs where user_id='"+se.getAttribute("id") +"')) and (status='responed');");
			boolean b = rs.next();
			if (b == true) {

				hProfiles = rs.getInt("total_rows");
			} else {
				hProfiles = 0;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}

		return hProfiles;
	}
	public Recruiter getRecruiterbyId() {
		Statement st = null;
		ResultSet rs = null;
		Recruiter obj = new Recruiter();
		try {
			st = con.createStatement();
			rs = st.executeQuery(
					"select * from recruiter where user_id= '" + se.getAttribute("id") + "'");
			boolean b = rs.next();
			if (b == true) {

				obj.setRId(rs.getString("r_id"));
				obj.setName(rs.getString("name"));
				obj.setEmail(rs.getString("email"));
				obj.setPhone(rs.getString("phone"));
				obj.setUid(rs.getString("user_id"));
				obj.setCname(rs.getString("company_name"));
				obj.setClogo(rs.getString("company_logo"));
				obj.setClocation(rs.getString("company_location"));
			} else {
				obj = null;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}

		return obj;
	}

	public String updatRecruiter(String name, String phone, String email, String cName, String cLogo, String location) {
		int count = 0;
		int count1 = 0;
		Statement st = null;
		Statement st1=null;
		String status = "";
		try {
			st = con.createStatement();
			st1=con.createStatement();
			count = st.executeUpdate("UPDATE recruiter SET name='"+ name +"',  email = '"+ email+"', phone = '"+ phone+"',company_name='"+cName+"',company_logo='"+ cLogo+"',company_location='"+location+"' WHERE user_id ='"+ se.getAttribute("id")+"' ;");
			count1 = st1.executeUpdate("UPDATE users SET name='"+ name +"',  email = '"+ email+"', phone = '"+ phone+"' WHERE id ='"+ se.getAttribute("id")+"' ;");
			if (count > 0) {
				status = "success";
				se.setAttribute("name", name);
				se.setAttribute("email", email);	
			} else {
				status = "failed";
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return status;
	}

	public String acceptApp(String appID) {
		// TODO Auto-generated method stub
		int count = 0;
		Statement st = null;
		String status = "";
		try {
			st = con.createStatement();
			count = st.executeUpdate("UPDATE applications SET status='accepted' WHERE status='pending' and Application_id ='"+appID+"' ;");
			if (count > 0) {
				status = "success";
			} else {
				status = "failed";
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return status;
	}
	public String cancelApp(String appID) {
		// TODO Auto-generated method stub
		int count = 0;
		Statement st = null;
		String status = "";
		try {
			st = con.createStatement();
			count = st.executeUpdate("UPDATE applications SET status='cancelled' WHERE status='pending' and Application_id ='"+appID+"' ;");
			if (count > 0) {
				status = "success";
			} else {
				status = "failed";
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return status;
	}
	public String ResponseApp(String appID) {
		// TODO Auto-generated method stub
		int count = 0;
		Statement st = null;
		String status = "";
		try {
			st = con.createStatement();
			count = st.executeUpdate("UPDATE applications SET status='responed' WHERE status='accepted' and Application_id ='"+appID+"' ;");
			if (count > 0) {
				status = "success";
			} else {
				status = "failed";
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return status;
	}

}

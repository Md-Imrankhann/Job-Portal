package Model;

public class Jobs {
	 private String jobId;  // job_id INT AUTO_INCREMENT PRIMARY KEY
	    private String jobTitle;  // job_title VARCHAR(100) NOT NULL
	    private String companyName;  // company_name VARCHAR(100) NOT NULL
	    private String companyLogo;  // company_logo VARCHAR(255)
	    private String location;  // j_location VARCHAR(100) NOT NULL
	    private String jobType;  // job_type VARCHAR(100) NOT NULL
	    private String salary;  // salary VARCHAR(100) NOT NULL
	    private String experienceLevel;  // experience_level VARCHAR(100) NOT NULL
	    private String skills;  // skills VARCHAR(100)
	    private String postedDate;  // posted_date DATE NOT NULL
	    private String applicationDeadline;  // application_deadline DATE
	    private String jobDescription;  // job_description TEXT NOT NULL
	    private String jobCategory;  // job_category VARCHAR(100)
	    private String requiredQualifications;  // required_qualifications TEXT
	    private String contactInformation;  // contact_information VARCHAR(100)
	    private String vacancy;
	    private String status;
	    
	    // vacancy INT DEFAULT 1
	    public String getJobId() {
			return jobId;
		}
		public void setJobId(String jobId) {
			this.jobId = jobId;
		}
		public String getJobTitle() {
			return jobTitle;
		}
		public void setJobTitle(String jobTitle) {
			this.jobTitle = jobTitle;
		}
		public String getCompanyName() {
			return companyName;
		}
		public void setCompanyName(String companyName) {
			this.companyName = companyName;
		}
		public String getCompanyLogo() {
			return companyLogo;
		}
		public void setCompanyLogo(String companyLogo) {
			this.companyLogo = companyLogo;
		}
		public String getLocation() {
			return location;
		}
		public void setLocation(String location) {
			this.location = location;
		}
		public String getJobType() {
			return jobType;
		}
		public void setJobType(String jobType) {
			this.jobType = jobType;
		}
		public String getSalary() {
			return salary;
		}
		public void setSalary(String salary) {
			this.salary = salary;
		}
		public String getExperienceLevel() {
			return experienceLevel;
		}
		public void setExperienceLevel(String experienceLevel) {
			this.experienceLevel = experienceLevel;
		}
		public String getSkills() {
			return skills;
		}
		public void setSkills(String skills) {
			this.skills = skills;
		}
		public String getPostedDate() {
			return postedDate;
		}
		public void setPostedDate(String postedDate) {
			this.postedDate = postedDate;
		}
		public String getApplicationDeadline() {
			return applicationDeadline;
		}
		public void setApplicationDeadline(String applicationDeadline) {
			this.applicationDeadline = applicationDeadline;
		}
		public String getJobDescription() {
			return jobDescription;
		}
		public void setJobDescription(String jobDescription) {
			this.jobDescription = jobDescription;
		}
		public String getJobCategory() {
			return jobCategory;
		}
		public void setJobCategory(String jobCategory) {
			this.jobCategory = jobCategory;
		}
		public String getRequiredQualifications() {
			return requiredQualifications;
		}
		public void setRequiredQualifications(String requiredQualifications) {
			this.requiredQualifications = requiredQualifications;
		}
		public String getContactInformation() {
			return contactInformation;
		}
		public void setContactInformation(String contactInformation) {
			this.contactInformation = contactInformation;
		}
		public String getVacancy() {
			return vacancy;
		}
		public void setVacancy(String vacancy) {
			this.vacancy = vacancy;
		}
		public String getPercentage() {
			return percentage;
		}
		public void setPercentage(String percentage) {
			this.percentage = percentage;
		}
		private String percentage;
		public String getstatus() {
			return status;
		}
		public void setStatus(String status) {
			this.status = status;
		}
}

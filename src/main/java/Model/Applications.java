package Model;

public class Applications {
	 private String AppId;  
	 private String jobId;  
	 private String userId;  
	 private String name;  
	 private String email;  
	 private String phone;  
	 private String status; 
	 private String applied_date;
	public String getAppId() {
		return AppId;
	}
	public void setAppId(String appId) {
		AppId = appId;
	}
	public String getJobId() {
		return jobId;
	}
	public void setJobId(String jobId) {
		this.jobId = jobId;
	}
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	public String getApplied_date() {
		return applied_date;
	}
	public void setApplied_date(String applied_date) {
		this.applied_date = applied_date;
	} 
}

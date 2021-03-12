package health;

public class HealthVo {
	private String name;
	private String email;
	private String tel;
	private String gender;
	private String lecture;
	private String date;
	//private String reservation;

	public HealthVo() {
		this("", "", "", "", "", "");
	}
	 public HealthVo(String name) {
		   this(name,"","","","","");
	   }

	public HealthVo(String name, String email, String tel, String gender, String lecture, String date ) 
	{
		this.name = name;
		this.email = email;
		this.tel = tel;
		this.gender = gender;
		this.lecture = lecture;
		this.date = date;
	//	this.reservation = reservation;
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

	public String getTel() {
		return tel;
	}

	public void setTel(String tel) {
		this.tel = tel;
	}

	public String getGender() {
		return gender;
	}

	public void setGender(String gender) {
		this.gender = gender;
	}


	public String getLecture() {
		return lecture;
	}

	public void setLecture(String lecture) {
		this.lecture = lecture;
	}
	
	public String getDate() {
		return date;
	}

	public void setDate(String date) {
		this.date = date;
	}


//	public String getReservation() {
//		return reservation;
//	}
//
//	public void setReservation(String reservation) {
//		this.reservation = reservation;
//	}

	

}

package user;

public class User {
	private String ID;
	private String PW;
	private String name;
	private String email;
	private String tel;
	private String gender;
	private String lecture;
	private String date;

	public User() {
		this("", "", "", "", "", "", "", "");
	}

	public User(String ID, String PW, String name, String email, String tel, String gender, String lecture,
			String date) {
		this.ID = ID;
		this.PW = PW;
		this.name = name;
		this.email = email;
		this.tel = tel;
		this.gender = gender;
		this.lecture = lecture;
		this.date = date;
	}

	public String getID() {
		return ID;
	}

	public void setID(String iD) {
		ID = iD;
	}

	public String getPW() {
		return PW;
	}

	public void setPW(String pW) {
		PW = pW;
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

}

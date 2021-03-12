package user;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import org.h2.tools.Server;

public class UserDAO {
	private String ID;
	private String PW;
	private Connection conn;
	private ResultSet rs;
	private String name;
	private String email;
	private String tel;
	private String gender;
	private String lecture;
	private String date;

	public UserDAO() {
		try {
			Server server = Server.createTcpServer(null).start();
			String url = "jdbc:h2:tcp://localhost/~/test";
			String user = "sa";
			String password = "1";
			Class.forName("org.h2.Driver");
			conn = DriverManager.getConnection(url, user, password);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}  
	/* 
	* -2: 아이디없음 
	* * -1: 서버오류 
	* * 0: 비밀번호 틀림 
	* * 1: 성공
	*/

	public int login(String ID, String PW) {
		try {

			PreparedStatement pstmt = conn.prepareStatement("SELECT PW FROM USER WHERE ID = ?");
			pstmt.setString(1, ID);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				return rs.getString(1).equals(PW) ? 1 : 0;
			} else {
				return -2;
			}
		} catch (Exception e) {
			e.printStackTrace();
			return -1;
		}
	} // 중복여부 확인 public boolean

	public boolean ID_Check(String ID) {
		try {
			PreparedStatement pstmt = conn.prepareStatement("SELECT * FROM USER WHERE ID = ?");
			pstmt.setString(1, ID);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				return false;
			} else {
				return true;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return false;
	}
//
//	// 회원가입 /* * -1: 서버오류 * 0: 이미 존재하는 아이디 * 1: 성공 */ public int join(UserDAO
	public int join(UserDAO userDAO) {
		if (!ID_Check(userDAO.getID()))
			return 0;
		try {
			PreparedStatement pstmt = conn.prepareStatement("INSERT INTO USER(ID,PW) VALUES(?,?)");
			pstmt.setString(1, userDAO.getID());
			pstmt.setString(2, userDAO.getPW());
			return pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
			return -1;
		}
	} // 유저 데이터 가져오기 public UserDAO
	public int join(User user) {

		String SQL = "INSERT INTO USER(ID, PW, NAME, EMAIL, TEL, GENDER) VALUES(?,?,?,?,?,?)";
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1, user.getID());
			pstmt.setString(2, user.getPW());
			pstmt.setString(3, user.getName());
			pstmt.setString(4, user.getEmail());
			pstmt.setString(5, user.getTel());
			pstmt.setString(6, user.getGender());
//			pstmt.setString(7, user.getLecture());
//			pstmt.setString(8, user.getDate());
			return pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return -1; // DB 오류
	}

	public UserDAO getUser(String ID) {
		try {
			PreparedStatement pst = conn.prepareStatement("SELECT * FROM USER WHERE ID = ?");
			pst.setString(1, ID);
			rs = pst.executeQuery();
			if (rs.next()) {
				UserDAO userDAO = new UserDAO();
				userDAO.setID(rs.getString(1));
				userDAO.setPW(rs.getString(2));
				return userDAO;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}

	public String getID() {
		return ID;
	}

	public void setID(String ID) {
		this.ID = ID;
	}

	public String getPW() {
		return PW;
	}

	public void setPW(String PW) {
		this.PW = PW;
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

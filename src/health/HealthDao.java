package health;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import health.HealthVo;

import health.dbcp.JdbcUtil;

public class HealthDao {
	private static Connection conn = null;
	private static Statement stmt = null;
	private static PreparedStatement pstmt = null;
	private static ResultSet rs = null;


	static String SELECT_ALL = "SELECT * FROM HEALTH";
	static String INSERT = "INSERT INTO HEALTH VALUES(?,?,?,?,?,?)";
	static String INSERT2 = "INSERT INTO HEALTH(NAME, EMAIL, TEL, GENDER , LECTURE) VALUES(?,?,?,?,?)";
	static String SELECT = "SELECT * FROM HEALTH WHERE NAME=?";
	static String SELECT_NO = "SELECT NO FROM HEALTH";
	static String DELETE = "DELETE FROM HEALTH WHERE name=?";
	static String MODIFY = "UPDATE HEALTH SET EMAIL=?, TEL=?, GENDER=?, LECTURE=?, DATE=? WHERE NAME=?";

	public static void insert(HealthVo vo) {
		System.out.println(vo.getName());
		System.out.println(vo.getEmail());
		System.out.println(vo.getTel());
		System.out.println(vo.getGender());
		System.out.println(vo.getLecture());
		System.out.println(vo.getDate());

		conn = JdbcUtil.getConnection();

		try {
			pstmt = conn.prepareStatement(INSERT);
			// pstmt = conn.prepareStatement(INSERT2);
			pstmt.setString(1, vo.getName());
			pstmt.setString(2, vo.getEmail());
			pstmt.setString(3, vo.getTel());
			pstmt.setString(4, vo.getGender());
			pstmt.setString(5, vo.getLecture());
			pstmt.setString(6, vo.getDate());

			int cnt = pstmt.executeUpdate();
			if (cnt > 0) {
				System.out.println("저장 완료!");
				conn.commit();
			} else {
				System.out.println("저장 실패!");
				conn.rollback();
			}
		} catch (SQLException e) {
			System.out.println("저장 실패!");
			try {
				conn.rollback();
			} catch (SQLException e1) {
				e1.printStackTrace();
			}
			e.printStackTrace();
		} finally {
			JdbcUtil.close(conn, pstmt, rs);
			JdbcUtil.close(stmt);
		}
	}

	public static List<HealthVo> selectAll() {
		List<HealthVo> list = new ArrayList<HealthVo>();
		conn = JdbcUtil.getConnection();
		try {
			stmt = conn.createStatement();
			rs = stmt.executeQuery(SELECT_ALL);
			while (rs.next()) {
				HealthVo health = new HealthVo();
				health.setName(rs.getString(1));
				health.setEmail(rs.getString(2));
				health.setTel(rs.getString(3));
				health.setGender(rs.getString(4));
				health.setLecture(rs.getString(5));
				health.setDate(rs.getString(6));
				list.add(health);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			JdbcUtil.close(conn, pstmt, rs);

		}
		return list;

	}

	public static void delete(HealthVo vo) {

		conn = JdbcUtil.getConnection();
		try {
			pstmt = conn.prepareCall(DELETE);
			pstmt.setString(1, vo.getName());
			int cnt = pstmt.executeUpdate();
			if (cnt > 0) {
				System.out.println("삭제 완료!");
				conn.commit();
			} else {
				System.out.println("삭제 실패!");
				conn.rollback();
			}
		} catch (SQLException e) {
			try {
				conn.rollback();
			} catch (SQLException e1) {
				e1.printStackTrace();
			}
			e.printStackTrace();
		} finally {
			JdbcUtil.close(conn, pstmt, rs);
		}
	}

//public int delMemberlist(String tel){
//    int result = 0;
//    try{//실행
//       
//    	pstmt = conn.prepareStatement("delete from HEALTH where tel = ?");
//        //?개수만큼 값 지정
//		pstmt.setString(1, tel.trim());
//        result = pstmt.executeUpdate(); //쿼리실행으로 삭제된 레코드 수 반환       
//           
//    }catch(Exception e){           
//        System.out.println(e+"=> delMemberlist fail");         
//    }finally{          
//		JdbcUtil.close(conn, pstmt, rs);
//    }      
//   
//    return result;
//    }  

	public static void modify(HealthVo vo) {
		conn = JdbcUtil.getConnection();
		try {
			pstmt = conn.prepareStatement(MODIFY);
			pstmt.setString(1, vo.getEmail());
			pstmt.setString(2, vo.getTel());
			pstmt.setString(3, vo.getGender());
			pstmt.setString(4, vo.getLecture());
			pstmt.setString(5, vo.getDate());
			pstmt.setString(6, vo.getName());

			int cnt = pstmt.executeUpdate();
			if (cnt > 0) {
				System.out.println("수정 완료!");
				conn.commit();
			} else {
				System.out.println("수정 실패!");
				conn.rollback();
			}
		} catch (SQLException e) {
			e.printStackTrace();
			try {
				System.out.println("수정 실패!");
				conn.rollback();
			} catch (SQLException e1) {
				e1.printStackTrace();
			}
		} finally {
			JdbcUtil.close(conn, pstmt, rs);
		}
	}

	public static HealthVo selectOne(HealthVo vo) {
		HealthVo health = null;

		conn = JdbcUtil.getConnection();
		try {
			pstmt = conn.prepareStatement(SELECT);
			pstmt.setString(1, vo.getName());
			rs = pstmt.executeQuery();
			if (rs.next()) {
				health = new HealthVo();
				health.setName(rs.getString(1));
				health.setEmail(rs.getString(2));
				health.setTel(rs.getString(3));
				health.setGender(rs.getString(4));
				health.setLecture(rs.getString(5));
				health.setDate(rs.getString(6));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			JdbcUtil.close(conn, pstmt, rs);
		}
		return health;
	}


}

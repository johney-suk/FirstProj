package bbs;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;

import org.h2.tools.Server;

public class BbsDAO {
	private Connection conn;
	private ResultSet rs;

	public BbsDAO() {
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

	public String getDate() {

		String SQL = "SELECT NOW()";
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				return rs.getString(1);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return ""; // 데이터베이스 오류
	}

	// bbsID 게시글 번호

//	public int getNext() {
//		String SQL = "SELECT bbsID FROM BBS ORDER BY bbsID DESC";
//
//		try {
//			PreparedStatement pstmt = conn.prepareStatement(SQL);
//			rs = pstmt.executeQuery();
//			if (rs.next()) {
//				return rs.getInt(1) + 1;
//			}
//			return 1;// 첫 번째 게시물 1
//
//		} catch (Exception e) {
//			e.printStackTrace();
//		}
//		return -1; // DB 오류
//	}

	public int write(String bbsTitle, String userID, String bbsContent) {

		String SQL = "INSERT INTO BBS VALUES(?, ?, ?, ?, ?, ?)";
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			pstmt.setInt(1, getNext());
			pstmt.setString(2, bbsTitle);
			pstmt.setString(3, userID);
			pstmt.setString(4, getDate());
			pstmt.setString(5, bbsContent);
			pstmt.setInt(6, 1);

			return pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return -1; // DB 오류
	}

	public ArrayList<Bbs> getList(int pageNumber) {
		String SQL = "SELECT * FROM BBS WHERE bbsID < ? AND bbsAvailable = 1 ORDER BY bbsID DESC LIMIT 10";
		ArrayList<Bbs> list = new ArrayList<Bbs>();
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			pstmt.setInt(1, getNext() - (pageNumber - 1) * 10);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				Bbs bbs = new Bbs();
				bbs.setBbsID(rs.getInt(1));
				bbs.setBbsTitle(rs.getString(2));
				bbs.setUserID(rs.getString(3));
				bbs.setBbsDate(rs.getString(4));
				bbs.setBbsContent(rs.getString(5));
				bbs.setBbsAvailable(rs.getInt(6));
				list.add(bbs);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}

	public boolean nextPage(int pageNumber) {
		String SQL = "SELECT * FROM BBS WHERE bbsID < ? AND bbsAvailable = 1 ORDER BY bbsID DESC LIMIT 10";
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			pstmt.setInt(1, getNext() - (pageNumber - 1) * 10);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				return true;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return false;
	}

	public Bbs getBbs(int bbsID) {
		String SQL = "SELECT * FROM BBS WHERE bbsID = ?";
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			pstmt.setInt(1, bbsID);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				Bbs bbs = new Bbs();
				bbs.setBbsID(rs.getInt(1));
				bbs.setBbsTitle(rs.getString(2));
				bbs.setUserID(rs.getString(3));
				bbs.setBbsDate(rs.getString(4));
				bbs.setBbsContent(rs.getString(5));
				bbs.setBbsAvailable(rs.getInt(6));
				return bbs;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}

	public ArrayList<Bbs> getSearchedList(int pageNumber, String searchWord) {


		String SQL = "SELECT * FROM BBS Where bbstitle like'%"+ searchWord + "%'";

		ArrayList<Bbs> list = new ArrayList<Bbs>();
		try {

			System.out.println("sql statement : " + SQL);
			Statement stmt = conn.createStatement();
			rs = stmt.executeQuery(SQL);

			while (rs.next()) {
				Bbs bbs = new Bbs();
				bbs.setBbsID(rs.getInt(1));
				bbs.setBbsTitle(rs.getString(2));
				bbs.setUserID(rs.getString(3));
				bbs.setBbsDate(rs.getString(4));
				bbs.setBbsContent(rs.getString(5));
				bbs.setBbsAvailable(rs.getInt(6));
				list.add(bbs);
			}
		} catch (Exception e) {
			System.out.println("Exception:search");
			e.printStackTrace();
		}
		System.out.println(" resultset_return list:search");
		return list;
	}

	public int getNext() {
		String SQL = "select NUM from (select row_number() over (order by bbsDate desc) NUM, A.* from bbs A where bbsavailable=1 order by NUM desc)";
		try {
			Statement stmt = conn.createStatement();
			rs = stmt.executeQuery(SQL);
			if(rs.next()) {
				return rs.getInt(1)+1;
			}
			return 1;
		} catch (Exception e) {
			e.printStackTrace();
		}
		return -1;
	}
//public boolean searchedNextPage(int pageNumber,String searchWord) {
//		
//		try {
//			if(getSearchedNext(searchWord)>(pageNumber)*10) {
//				return true;
//			} else {
//				return false;
//			}
//		}catch(Exception e) {
//			e.printStackTrace();
//		}
//		return false;
//	}
//public int getSearchedNext(String searchWord) {
//	String SQL = "select NUM from (select row_number() over (order by bbsDate desc) NUM, A.* from bbs A where bbsavailable=1 and bbsTitle like '%"+searchWord+"%' order by NUM desc)";
//	try {
//		System.out.println("query for searched NEXT : "+SQL);
//		Statement stmt = conn.createStatement();
//		rs = stmt.executeQuery(SQL);
//		if(rs.next()) {
//			return rs.getInt(1)+1;
//		}
//		return 1;
//	} catch (Exception e) {
//		e.printStackTrace();
//	}
//	return -1;
//}
//	
}

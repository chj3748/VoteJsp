package pack.vote;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.LinkedHashMap;

import pack.vote.VoteDTO;

public class VoteDAO {
	private Connection conn;
	private PreparedStatement psmt;
	private ResultSet rs;
	private int cnt;
	private VoteDTO vote = null;

	private void getConnection() throws Exception {
		String driver = "com.mysql.cj.jdbc.Driver";
		String db_url = "jdbc:mysql://13.209.88.99:3306/jsp";
		String db_id = "aws";
		String db_pw = "1234";
		try {
			Class.forName(driver);
			conn = DriverManager.getConnection(db_url, db_id, db_pw);
			System.out.println("vote db connected");
		} catch (ClassNotFoundException | SQLException e) {
//			e.printStackTrace();
			throw new Exception("vote db connect 실패임 ㅇㅇ");
		}

	}

	private void close() throws Exception {
		try {
			if (rs != null) {
				rs.close();
			}
			if (psmt != null) {
				psmt.close();
			}
			if (conn != null) {
				conn.close();
			}
			System.out.println("vote connection close");
		} catch (SQLException e) {
//			e.printStackTrace();
			throw new Exception("vote db close 실패임 ㅇㅇ");
		}

	}

	public void toVote(VoteDTO dto) throws Exception {
		try {
			getConnection();
			String sql = "insert into vote_result (voter, candidate) values(?,?);";
			psmt = conn.prepareStatement(sql);
			System.out.println("insert 실행");
			
			psmt.setString(1, dto.getVoter());
			psmt.setString(2, dto.getCandidate());
			
			cnt = psmt.executeUpdate();
		} catch (SQLException e) {
//			e.printStackTrace();
			throw new Exception("투표 실패임 ㅇㅇ");
		} finally {
			close();
		}

	}

	public VoteDTO findVoter(VoteDTO dto) throws Exception {
		getConnection();
		try {
			String sql = "select * from vote_result where voter=?";
			psmt = conn.prepareStatement(sql);
			psmt.setString(1, dto.getVoter());

			rs = psmt.executeQuery();
			if (rs.next()) {
				int id = rs.getInt(1);
				String voter = rs.getString(2);
				String candidate = rs.getString(3);
				
				vote = new VoteDTO(id, voter, candidate);
			}
		} catch (SQLException e) {
//			e.printStackTrace();
			throw new Exception("투표자 확인 실패임 ㅇㅇ");
		} finally {
			close();
		}
		return vote;
	}
	
	public LinkedHashMap<String, Integer> voteCnt() throws Exception {
		LinkedHashMap<String, Integer> result = new LinkedHashMap<>();
		getConnection();
		try {
			String sql = "select count(*) as cnt, candidate from vote_result group by candidate order by cnt;";
			psmt = conn.prepareStatement(sql);

			rs = psmt.executeQuery();
			if (rs.next()) {
				int cnt = rs.getInt(1);
				String candidate = rs.getString(2);
				
				result.put(candidate, cnt);
			}
		} catch (SQLException e) {
//			e.printStackTrace();
			throw new Exception("투표 결과 조회 실패임 ㅇㅇ");
		} finally {
			close();
		}
		return result;
	}
	
}

package pack.user;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class UserDAO {
	private Connection conn;
	private PreparedStatement psmt;
	private ResultSet rs;
	private int cnt;
	private UserDTO user = null;

	private void getConnection() throws Exception {
		String driver = "com.mysql.cj.jdbc.Driver";
		String db_url = "jdbc:mysql://13.209.88.99:3306/jsp";
		String db_id = "aws";
		String db_pw = "1234";
		try {
			Class.forName(driver);
			conn = DriverManager.getConnection(db_url, db_id, db_pw);
			System.out.println("db connected");
		} catch (ClassNotFoundException | SQLException e) {
//			e.printStackTrace();
			throw new Exception("db connect 실패임 ㅇㅇ");
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
			System.out.println("connection close");
		} catch (SQLException e) {
//			e.printStackTrace();
			throw new Exception("db close 실패임 ㅇㅇ");
		}

	}

	public void join(UserDTO dto) throws Exception {
		try {
			getConnection();
			String sql = "insert into vote_user values(?,?,?,?,?);";
			psmt = conn.prepareStatement(sql);
			System.out.println("join db 시작");
			
			psmt.setString(1, dto.getId());
			psmt.setString(2, dto.getPwd());
			psmt.setString(3, dto.getName());
			psmt.setInt(4, dto.getAge());
			psmt.setString(5, dto.getGender());
			
			cnt = psmt.executeUpdate();
		} catch (SQLException e) {
//			e.printStackTrace();
			throw new Exception("join 실패임 ㅇㅇ");
		} finally {
			close();
		}

	}

	public UserDTO login(UserDTO dto) throws Exception {
		getConnection();
		try {
			String sql = "select * from vote_user where id=? and password=?";
			psmt = conn.prepareStatement(sql);
			psmt.setString(1, dto.getId());
			psmt.setString(2, dto.getPwd());

			rs = psmt.executeQuery();
			if (rs.next()) {
				String id = rs.getString(1);
				String pwd = rs.getString(2);
				String name = rs.getString(3);
				int age = rs.getInt(4);
				String gender = rs.getString(5);
				
				
				user = new UserDTO(id, pwd, name, age, gender);
			}
		} catch (SQLException e) {
//			e.printStackTrace();
			throw new Exception("login 실패임 ㅇㅇ");
		} finally {
			close();
		}
		return user;
	}
	
	public UserDTO findUser(UserDTO dto) throws Exception {
		getConnection();
		try {
			String sql = "select * from vote_user where id=?";
			psmt = conn.prepareStatement(sql);
			psmt.setString(1, dto.getId());

			rs = psmt.executeQuery();
			if (rs.next()) {
				String id = rs.getString(1);
				String pwd = rs.getString(2);
				String name = rs.getString(3);
				int age = rs.getInt(4);
				String gender = rs.getString(5);
				
				user = new UserDTO(id, pwd, name, age, gender);
			}
		} catch (SQLException e) {
//			e.printStackTrace();
			throw new Exception("find user 실패임 ㅇㅇ");
		} finally {
			close();
		}
		return user;
	}
	
	public int adminOpen() throws Exception {
		getConnection();
		try {
			String sql = "update vote_user set age=0 where id='admin';";
			psmt = conn.prepareStatement(sql);

			cnt = psmt.executeUpdate();
		} catch (SQLException e) {
//			e.printStackTrace();
			throw new Exception("투표시작 실패임 ㅇㅇ");
		} finally {
			close();
		}
		return cnt;
	}
	
	public int adminClose() throws Exception {
		getConnection();
		try {
			String sql = "update vote_user set age=1 where id='admin';";
			psmt = conn.prepareStatement(sql);

			cnt = psmt.executeUpdate();
		} catch (SQLException e) {
//			e.printStackTrace();
			throw new Exception("투표 종료 실패임 ㅇㅇ");
		} finally {
			close();
		}
		return cnt;
	}
	
}

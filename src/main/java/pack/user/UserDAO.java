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
			throw new Exception("db connect 叔鳶績 しし");
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
			throw new Exception("db close 叔鳶績 しし");
		}

	}

	public void join(UserDTO dto) throws Exception {
		try {
			getConnection();
			String sql = "insert into vote_user values(?,?,?,?,?);";
			psmt = conn.prepareStatement(sql);
			System.out.println("insert 叔楳");
			
			psmt.setString(1, dto.getId());
			psmt.setString(2, dto.getPwd());
			psmt.setString(3, dto.getName());
			psmt.setString(4, dto.getAge());
			psmt.setString(5, dto.getGender());
			
			cnt = psmt.executeUpdate();
		} catch (SQLException e) {
//			e.printStackTrace();
			throw new Exception("噺据亜脊 叔鳶績 しし");
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
				String age = rs.getString(4);
				String gender = rs.getString(5);
				
				
				user = new UserDTO(id, pwd, name, age, gender);
			}
		} catch (SQLException e) {
//			e.printStackTrace();
			throw new Exception("稽益昔 叔鳶績 しし");
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
				String age = rs.getString(4);
				String gender = rs.getString(5);
				
				user = new UserDTO(id, pwd, name, age, gender);
			}
		} catch (SQLException e) {
//			e.printStackTrace();
			throw new Exception("政煽 達奄 叔鳶績 しし");
		} finally {
			close();
		}
		return user;
	}
	
}

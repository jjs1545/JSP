package douzone.login.db;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import douzone.util.ConnectionFactory;
import douzone.util.JDBCClose;

public class LoginDAO {
	public LoginVO login(LoginVO loginVO) {
		Connection con = null;
		PreparedStatement pstmt = null;
		LoginVO userVO = null;
		//세션 등록할 객체
		//null이라면 없는 것, null이 아니라면 로그인 상태
		
		try {
			con = new ConnectionFactory().getConnection();
			StringBuilder sql = new StringBuilder();
			sql.append(" SELECT id, password, name ");
			sql.append(" FROM member ");
			sql.append(" where id = ? ");
			sql.append(" AND password = ? ");
			
			pstmt = con.prepareStatement(sql.toString());
			pstmt.setString(1, loginVO.getId());
			pstmt.setString(2, loginVO.getPassword());
			
			ResultSet rs = pstmt.executeQuery();
			
			if(rs.next()) {
				userVO = new LoginVO();
				userVO.setId(rs.getString("id"));
				userVO.setPassword(rs.getString("password"));
				userVO.setName(rs.getString("name"));
			}			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			JDBCClose.close(con, pstmt);
		}
		
		return userVO;
	}
}








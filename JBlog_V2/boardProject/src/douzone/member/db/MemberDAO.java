package douzone.member.db;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import douzone.util.ConnectionFactory;
import douzone.util.JDBCClose;

public class MemberDAO {
	private MemberVO member = new MemberVO();
	
	public List<MemberVO> selectAllMember() {
		Connection con = null;
		PreparedStatement pstmt = null;
		List<MemberVO> list = new ArrayList<>();
		
		try {
			con = new ConnectionFactory().getConnection();
			StringBuilder sql = new StringBuilder();
			sql.append(" SELECT id, name, password, ");
			sql.append(" tel1, tel2, tel3, ");
			sql.append(" type");
			sql.append(" FROM member ");
			
			pstmt = con.prepareStatement(sql.toString());
			
			ResultSet rs = pstmt.executeQuery();
			while(rs.next()) {
				MemberVO member = new MemberVO();
				member.setId(rs.getString("id"));
				member.setName(rs.getString("name"));
				member.setPassword(rs.getString("password"));
				member.setTel1(rs.getString("tel1"));
				member.setTel2(rs.getString("tel2"));
				member.setTel3(rs.getString("tel3"));
				member.setType(rs.getString("type"));
				list.add(member);
			}			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			JDBCClose.close(con, pstmt);
		}
		System.out.println("list:"+list.size());
		return list;
	}
	
	public MemberVO selectIdMember(String id) {
		Connection con = null;
		PreparedStatement pstmt = null;
		MemberVO member = null;
		
		try {
			con = new ConnectionFactory().getConnection();
			StringBuilder sql = new StringBuilder();
			sql.append(" SELECT * 		");
			sql.append("   FROM member 	");
			sql.append("  WHERE id=?	");
			
			pstmt = con.prepareStatement(sql.toString());
			pstmt.setString(1, id);
			ResultSet rs = pstmt.executeQuery();
		
			while(rs.next()) {
				member = new MemberVO();
				member.setId(rs.getString("id"));
				member.setName(rs.getString("name"));
				member.setPassword(rs.getString("password"));
				member.setEmail_id(rs.getString("email_id"));
				member.setEmail_domain(rs.getString("email_domain"));
				member.setTel1(rs.getString("tel1"));
				member.setTel2(rs.getString("tel2"));
				member.setTel3(rs.getString("tel3"));
				member.setType(rs.getString("type"));
				member.setBasic_addr(rs.getString("basic_addr"));
			}			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			JDBCClose.close(con, pstmt);
		}
		return member;
	}
	
	public MemberVO InsertMember(MemberVO vo) {
		Connection con = null;
		PreparedStatement pstmt = null;
		MemberVO member = new MemberVO();
		
		try {
			con = new ConnectionFactory().getConnection();
			StringBuilder sql = new StringBuilder();
			sql.append(" INSERT INTO member( ");
			sql.append(" id, name, password, email_id, email_domain, ");
			sql.append(" tel1, tel2, tel3, basic_addr)");
			sql.append(" VALUES(?, ?, ?, ?, ?, ?, ?, ?, ? ) ");
			
			pstmt = con.prepareStatement(sql.toString());
	
			
			pstmt.setString(1, vo.getId());
			pstmt.setString(2, vo.getName());
			pstmt.setString(3, vo.getPassword());
			pstmt.setString(4, vo.getEmail_id());
			pstmt.setString(5, vo.getEmail_domain());
			pstmt.setString(6, vo.getTel1());
			pstmt.setString(7, vo.getTel2());
			pstmt.setString(8, vo.getTel3());
			pstmt.setString(9, vo.getBasic_addr());
			pstmt.executeUpdate();			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			JDBCClose.close(con, pstmt);
		}
		return member;
	}
	
	public MemberVO UpdateMember(MemberVO vo) {
		Connection con = null;
		PreparedStatement pstmt = null;
		MemberVO member = new MemberVO();
		
		try {
			con = new ConnectionFactory().getConnection();
			StringBuilder sql = new StringBuilder();
			sql.append(" UPDATE member ");
			sql.append(" 	SET password=?, ");
			sql.append(" 		tel1=?,tel2=?,tel3=?,");
			sql.append(" 		email_id=?,email_domain=?,");
			sql.append(" 		basic_addr=?");
			sql.append("  WHERE id=? ");
			
			pstmt = con.prepareStatement(sql.toString());
	
			
			pstmt.setString(1, vo.getPassword());
			pstmt.setString(2, vo.getTel1());
			pstmt.setString(3, vo.getTel2());
			pstmt.setString(4, vo.getTel3());
			pstmt.setString(5, vo.getEmail_id());
			pstmt.setString(6, vo.getEmail_domain());
			pstmt.setString(7, vo.getBasic_addr());
			pstmt.setString(8, vo.getId());
			
			pstmt.executeUpdate();			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			JDBCClose.close(con, pstmt);
		}
		return member;
	}
	
	
	public MemberVO DeleteMember(String id) {
		Connection con = null;
		PreparedStatement pstmt = null;
		MemberVO member = new MemberVO();
		
		try {
			con = new ConnectionFactory().getConnection();
			StringBuilder sql = new StringBuilder();
			sql.append(" Delete ");
			sql.append(" FROM member ");
			sql.append(" WHERE id=? ");
			
			pstmt = con.prepareStatement(sql.toString());
	
			pstmt.setString(1, id);
			pstmt.executeUpdate();			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			JDBCClose.close(con, pstmt);
		}
		return member;
	}
	
	 /**
     * 아이디 중복체크를 한다.
     * @param id 아이디
     * @return x : 아이디 중복여부 확인값
     */
    public boolean duplicateIdCheck(String id)
    {
        Connection con = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        boolean x= false;
        
        try {
            // 쿼리
        	con = new ConnectionFactory().getConnection();
            StringBuffer query = new StringBuffer();
            query.append("SELECT ID FROM member WHERE ID=?");
                        
            pstmt = con.prepareStatement(query.toString());
            pstmt.setString(1, id);
            rs = pstmt.executeQuery();
            
            if(rs.next()) x= true; //해당 아이디 존재
            
        }catch (Exception e) {
			e.printStackTrace();
		} finally {
			JDBCClose.close(con, pstmt);
		}
		return x;
    } // end duplicateIdCheck()


	
}












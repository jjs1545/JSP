package douzone.board.db;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import douzone.util.ConnectionFactory;
import douzone.util.JDBCClose;

public class BoardDAO {
	private BoardVO board = new BoardVO();
	
	public List<BoardVO> selectAllBoard() {
		Connection con = null;
		PreparedStatement pstmt = null;
		List<BoardVO> list = new ArrayList<>();
		
		try {
			con = new ConnectionFactory().getConnection();
			StringBuilder sql = new StringBuilder();
			sql.append(" SELECT * 			");
			sql.append("   FROM board 		");
			sql.append("  ORDER BY no DESC	");
			
			pstmt = con.prepareStatement(sql.toString());
			
			ResultSet rs = pstmt.executeQuery();
			
			while(rs.next()) {
				BoardVO board = new BoardVO();
				int no = rs.getInt("no");
				String title = rs.getString("title");
				String writer = rs.getString("writer");
				//String content = rs.getString("content");
				int viewCnt = rs.getInt("viewCnt");
				
				board.setNo(no);
				board.setTitle(title);
				board.setWriter(writer);
				//board.setContent(content);
				board.setViewCnt(viewCnt);
				
				list.add(board);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			JDBCClose.close(con, pstmt);
		}
		
		return list;
	}
	
	public BoardVO selectDetailBoard(int n) {
		Connection con = null;
		PreparedStatement pstmt = null;
		BoardVO board = new BoardVO();
		
		try {
			con = new ConnectionFactory().getConnection();
			StringBuilder sql = new StringBuilder();
			sql.append(" SELECT * 			");
			sql.append("   FROM board 		");
			sql.append("  WHERE no=? 		");
			sql.append("  ORDER BY no DESC	");
			
			pstmt = con.prepareStatement(sql.toString());
			pstmt.setInt(1, n);
			ResultSet rs = pstmt.executeQuery();
			
			
			while(rs.next()) {
				int no = rs.getInt("no");
				String title = rs.getString("title");
				String writer = rs.getString("writer");
				String content = rs.getString("content");
				int viewCnt = rs.getInt("viewCnt");
				
				board.setNo(no);
				board.setTitle(title);
				board.setWriter(writer);
				board.setContent(content);
				board.setViewCnt(viewCnt);
		
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			JDBCClose.close(con, pstmt);
		}
		System.out.println("board:"+board.getNo());
		return board;
	}
	
	public BoardVO insertBoard(BoardVO vo) {
		Connection con = null;
		PreparedStatement pstmt = null;
		BoardVO board = new BoardVO();
		
		
		try {
			con = new ConnectionFactory().getConnection();
			StringBuilder sql = new StringBuilder();
			sql.append("INSERT INTO board ( ");
			sql.append("title, writer, content )");
			sql.append("VALUES(?, ?, ?)");
			
			pstmt = con.prepareStatement(sql.toString());
			pstmt.setString(1, vo.getTitle());
			pstmt.setString(2, vo.getWriter());
			pstmt.setString(3, vo.getContent());
			pstmt.executeUpdate();
			
			JDBCClose.close(con, pstmt);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return board;
	}
	
	public BoardVO UpdateBoard(BoardVO vo) {
		Connection con = null;
		PreparedStatement pstmt = null;
		BoardVO uBoard = new BoardVO();
		
		try {
			con = new ConnectionFactory().getConnection();
			StringBuilder sql = new StringBuilder();
			sql.append(" UPDATE board 		");
			sql.append("   	SET content = ? , title = ? 	");
			sql.append("  WHERE no = ?		");
			
			pstmt = con.prepareStatement(sql.toString());
			pstmt.setString(1, vo.getContent());
			pstmt.setString(2, vo.getTitle());
			pstmt.setInt(3, vo.getNo());
			pstmt.executeUpdate();
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			JDBCClose.close(con, pstmt);
		}
				
		return uBoard;
	}
	
	public BoardVO UpdateViewCnt(BoardVO vo, int cnt) {
		Connection con = null;
		PreparedStatement pstmt = null;
		BoardVO uBoard = new BoardVO();
		cnt++;
		System.out.println("cnt2:"+cnt);
		try {
			con = new ConnectionFactory().getConnection();
			StringBuilder sql = new StringBuilder();
			sql.append(" UPDATE board 		");
			sql.append("   	SET viewCnt=?	");
			sql.append("  WHERE no = ?		");
			
			pstmt = con.prepareStatement(sql.toString());
			pstmt.setInt(1, cnt);
			pstmt.setInt(2, vo.getNo());
			pstmt.executeUpdate();
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			JDBCClose.close(con, pstmt);
		}
				
		return uBoard;
	}
	
	public BoardVO DeleteBoard(BoardVO vo) {
		Connection con = null;
		PreparedStatement pstmt = null;
		BoardVO dBoard = new BoardVO();
		
		try {
			con = new ConnectionFactory().getConnection();
			StringBuilder sql = new StringBuilder();
			sql.append(" DELETE  		");
			sql.append("   FROM board 	");
			sql.append("  WHERE no = ?	");
			
			pstmt = con.prepareStatement(sql.toString());
			pstmt.setInt(1, vo.getNo());
			pstmt.executeUpdate();
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			JDBCClose.close(con, pstmt);
		}
				
		return dBoard;
	}
	
	public List<BoardVO> searchBoard(String Theme, String search) {
		Connection con = null;
		PreparedStatement pstmt = null;
		BoardVO board = null;
		List<BoardVO> list = new ArrayList<>();
		System.out.println("Theme2 :"+Theme);
		System.out.println("search2:"+search);
		try {
			board= new BoardVO();
			con = new ConnectionFactory().getConnection();
			StringBuilder sql = new StringBuilder();

			if(Theme.equals("id")) {
				sql.append(" SELECT * 			");
				sql.append("   FROM board 		");
				sql.append("  WHERE writer LIKE ?	");
				pstmt = con.prepareStatement(sql.toString());
				pstmt.setString(1, "%"+search+"%");
			}else if(Theme.equals("title")) {
				sql.append(" SELECT * 			");
				sql.append("   FROM board 		");
				sql.append("  WHERE title LIke ?	");
				pstmt = con.prepareStatement(sql.toString());
				pstmt.setString(1, "%"+search+"%");
			}else if(Theme.equals("content")) {
				sql.append(" SELECT * 			");
				sql.append("   FROM board 		");
				sql.append("  WHERE content LIKE ?	");
				pstmt = con.prepareStatement(sql.toString());
				pstmt.setString(1, "%"+search+"%");
			}
			
			ResultSet rs = pstmt.executeQuery();
			
			
			while(rs.next()) {
				board = new BoardVO();
				int no = rs.getInt("no");
				String title = rs.getString("title");
				String writer = rs.getString("writer");
				String content = rs.getString("content");
				int viewCnt = rs.getInt("viewCnt");
				
				board.setNo(no);
				board.setTitle(title);
				board.setWriter(writer);
				board.setContent(content);
				board.setViewCnt(viewCnt);
		
				list.add(board);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			JDBCClose.close(con, pstmt);
		}
		System.out.println("board:"+board.getNo());
		return list;
	}
}

package board;

import java.util.LinkedList;
import java.util.List;
import java.util.Map;

import common.JDBCConnect;
import jakarta.servlet.ServletContext;

public class BoardDAO extends JDBCConnect{
	
	public BoardDAO(ServletContext application) {
		super(application);
	}
	
	public int selectCount(Map<String, Object> map) {
		int totalCount = 0;
		
		String query = "SELECT COUNT(*) FROM board";
		if(map.get(" searchWord") != null) {
			query += "WHERE " + map.get("searchField") + " "
					+ "LIKE '%" + map.get("searchWord") + "%'";
		}
		
		try {
			stmt = conn.createStatement();
			rs = stmt.executeQuery(query);
			rs.next();
			
			totalCount = rs.getInt(1);
			
		} catch (Exception e) {
			System.out.println("게시물 수를 구하는 중 예외 발생");
			e.printStackTrace();
		}
		
		return totalCount;
	}
	
	public List<BoardDTO> selectList(Map<String, Object> map){
		List<BoardDTO> boardList = new LinkedList<>();
		
		String query = "SELECT * FROM board";
		if(map.get("searchWord") != null) {
			query += " WHERE " + map.get("searchField") + " "
					+ "LIKE '%" + map.get("searchWord") + "%'";
		} query+= " ORDER BY num DESC"; 
		
		
		try {
			stmt = conn.createStatement();
			rs = stmt.executeQuery(query);
			
			while (rs.next()) {
				BoardDTO boardDto = new BoardDTO();
				
				boardDto.setNum(rs.getString(1));
				boardDto.setTitle(rs.getString(2));
				boardDto.setContent(rs.getString(3));
				boardDto.setId(rs.getString(4));
				boardDto.setPostdate(rs.getDate(5));
				boardDto.setVisitcount(rs.getString(6));
				
				boardList.add(boardDto);
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return boardList;
	}
	
	public List<BoardDTO> selectPagingList(Map<String, Object> map){
		List<BoardDTO> boardList = new LinkedList<>();
		
		
		String query = ""
				+ "select * from "
				+ "	(select board.*, row_number() over(order by num desc) as rownum"
				+ "		from board ";
		
		if(map.get("searchWord") != null) {
			query += "where " + map.get("searchField")
					+ " like '%" + map.get("searchWord") + "%' ";
		}
		query += ") B "
				+ "where rownum between ? and ?";

		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, map.get("start").toString());
			pstmt.setString(2, map.get("end").toString());
			rs = pstmt.executeQuery();
			
			
			while(rs.next()) {
				BoardDTO dto = new BoardDTO();
				dto.setNum(rs.getString(1));
				dto.setTitle(rs.getString(2));
				dto.setContent(rs.getString(3));
				dto.setId(rs.getString(4));
				dto.setPostdate(rs.getDate(5));
				dto.setVisitcount(rs.getString(6));
				
				boardList.add(dto);
			}
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("pageing list select error");
		}
		
		return boardList;
	}
	
	public int insertWrite(BoardDTO dto) {
		
		int result = 0;
		
		try {
			String query = ""
					+ "insert into board(title, content, id, visitCount) "
					+ "values (?, ?, ?, 0)";
			
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, dto.getTitle());
			pstmt.setString(2, dto.getContent());
			pstmt.setString(3, dto.getId());
			result = pstmt.executeUpdate();
		} catch (Exception e) {
			System.out.println("게시물 입력 중 예외발생");
			e.printStackTrace();
		}
		
		return result;
	}
	
	public BoardDTO selectView(String num) {
		BoardDTO dto = new BoardDTO();
		
		String query = ""
				+ "select B.*, M.name from members M inner join board B "
				+ "on M.id = B.id "
				+ "where B.num = ?";
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, num);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				dto.setNum(rs.getString(1));
				dto.setTitle(rs.getString(2));
				dto.setContent(rs.getString(3));
				dto.setId(rs.getString(4));
				dto.setPostdate(rs.getDate(5));
				dto.setVisitcount(rs.getString(6));
				dto.setName(rs.getString(7));
			}
		}catch(Exception e) {
			System.out.println("view error");
			e.printStackTrace();
		}
		
		return dto;
	}
	
	public void updateVisitCount(String num) {
		
		String query = ""
				+ "update board "
				+ "set visitCount = visitCount + 1 "
				+ "where num = ?";
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, num);
			pstmt.executeUpdate();
		} catch (Exception e) {
			System.out.println("visitCount error");
			e.printStackTrace();
		}
	}
	
	public int updateEdit(BoardDTO dto) {
		int result = 0;
		
		String query = ""
				+ "update board "
				+ "set title=?, content=? "
				+ "where num=?";
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, dto.getTitle());
			pstmt.setString(2, dto.getContent());
			pstmt.setString(3, dto.getNum());
			result = pstmt.executeUpdate();
			
		}catch(Exception e) {
			e.printStackTrace();
			System.out.println("board update error");
		}
		
		return result;
	}
	
	public int deletePost(BoardDTO dto) {
		int result = 0;
		
		String query = ""
				+ "DELETE FROM board WHERE num = ?";
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, dto.getNum());
			result = pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("board delete error");
		}
		
		return result;
	}
}

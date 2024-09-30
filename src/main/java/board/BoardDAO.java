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
	
}

package model2.mvcboard;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import common.JDBCConnect;
import jakarta.servlet.ServletContext;

public class MVCBoardDAO extends JDBCConnect{
	
	
	public MVCBoardDAO(ServletContext application) {
		super(application);
	}
	
	public MVCBoardDTO selectView(String idx) {
		MVCBoardDTO dto = new MVCBoardDTO();
		
		String query = ""
				+ "select * from mvcboard where idx=?";
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, idx);
			rs = pstmt.executeQuery();
			rs.next();
			
			dto.setIdx(rs.getInt(1));
			dto.setName(rs.getString(2));
			dto.setTitle(rs.getString(3));
			dto.setContent(rs.getString(4));
			dto.setPostdate(rs.getDate(5));
			dto.setOfile(rs.getString(6));
			dto.setSfile(rs.getString(7));
			dto.setDowncount(rs.getInt(8));
			dto.setPass(rs.getString(9));
			dto.setVisitcount(rs.getInt(10));
			
		} catch (Exception e) {
			System.out.println("MVCBoardDAO.selectView() sql exception");
			e.printStackTrace();
		}
		return dto;
	}
	
	public int updateVisitCount(String idx) {
		int result = 0;
		
		String query = ""
				+ "update mvcboard "
				+ "set visitcount = visitcount+1 "
				+ "where idx=? ";
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, idx);
			result = pstmt.executeUpdate();
		} catch (Exception e) {
			System.out.println("MVCBoardDAO.updateVisitCount() : sql exception");
			e.printStackTrace();
		}
		
		return result;
	}
	
	public int selectCount(Map<String, Object> map) {
		int count = 0;
		
		String query = ""
				+ "select count(*) from mvcboard ";
		if(map.get("searchWord") != null) {
			query += "where " + map.get("searchField") + " "
					+ "like '%"+ map.get("searchWord") +"%'";
		}
		
		try {
			pstmt = conn.prepareStatement(query);
			rs = pstmt.executeQuery();
			rs.next();
			count = rs.getInt(1);
		} catch (Exception e) {
			System.out.println("MVCBoardDAO.selectCount() method exception");
			e.printStackTrace();
		}
		
		return count;
	}
	
	public List<MVCBoardDTO> selectListPage(Map<String, Object> map){
		List<MVCBoardDTO> pageList = new ArrayList<>();
		
		String ifState = "";
		if(map.get("searchField") != null) {
			ifState = "where " +map.get("searchField") + " "
					+ "like '%" + map.get("searchWord") + "%'"; 
		}
		
		String query = ""
				+ "select * "
				+ "from (select *, row_number() over(order by idx desc) as cntRow "
				+ 		"from mvcboard "+ ifState +") as t "
				+ "where cntRow between ? and ?";
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, map.get("start").toString());
			pstmt.setString(2, map.get("end").toString());
			rs = pstmt.executeQuery();
			
			while (rs.next()) {
				MVCBoardDTO dto = new MVCBoardDTO();
				dto.setIdx(rs.getInt(1));
				dto.setName(rs.getString(2));
				dto.setTitle(rs.getString(3));
				dto.setContent(rs.getString(4));
				dto.setPostdate(rs.getDate(5));
				dto.setOfile(rs.getString(6));
				dto.setSfile(rs.getString(7));
				dto.setDowncount(rs.getInt(8));
				dto.setPass(rs.getString(9));
				dto.setVisitcount(rs.getInt(10));
				
				pageList.add(dto);
			}
		} catch (Exception e) {
			System.out.println("MVCBoardDAO.selectListPage() sql exception");
			e.printStackTrace();
		}
		return pageList;
	}
	
	public int writeBoard(MVCBoardDTO dto) {
		int result = 0;
		
		String query = ""
				+ "insert into mvcboard(name, title, content, ofile, sfile, pass) "
				+ "values(?, ?, ?, ?, ?, ?)";
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, dto.getName());
			pstmt.setString(2, dto.getTitle());
			pstmt.setString(3, dto.getContent());
			pstmt.setString(4, dto.getOfile());
			pstmt.setString(5, dto.getSfile());
			pstmt.setString(6, dto.getPass());
			
			result = pstmt.executeUpdate();
		} catch (Exception e) {
			System.out.println("MVCBoard.writeBoard() method sql exception");
			e.printStackTrace();
		}
		
		return result;
	}
}

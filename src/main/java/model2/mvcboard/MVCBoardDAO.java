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
	
	// 게시글 데이터를 받아 DB에 저장되어 있던 내용을 갱신합니다(파일 업로드 지원).
    public int updatePost(MVCBoardDTO dto) {
        int result = 0;
        try {
            // 쿼리문 템플릿 준비
            String query = "UPDATE mvcboard"
                         + " SET title=?, name=?, content=?, ofile=?, sfile=? "
                         + " WHERE idx=? and pass=?";

            // 쿼리문 준비
            
            pstmt = conn.prepareStatement(query);
            pstmt.setString(1, dto.getTitle());
            pstmt.setString(2, dto.getName());
            pstmt.setString(3, dto.getContent());
            pstmt.setString(4, dto.getOfile());
            pstmt.setString(5, dto.getSfile());
            pstmt.setInt(6, dto.getIdx());
            pstmt.setString(7, dto.getPass());

            // 쿼리문 실행
            result = pstmt.executeUpdate();
        }
        catch (Exception e) {
            System.out.println("게시물 수정 중 예외 발생");
            e.printStackTrace();
        }
        return result;
    }
	
	public boolean confirmPassword(String pass, String idx) {
		boolean isCorr = true;
		
		String query = ""
				+ "select count(*) from mvcboard "
				+ "where idx=? and pass=?";
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, idx);
			pstmt.setString(2, pass);
			rs = pstmt.executeQuery();
			rs.next();
			
			if(rs.getInt(1) == 0) {
				isCorr = false;
			}
			
		} catch (Exception e) {
			isCorr = false;
			System.out.println("confirm() sql Excpetion");
			e.printStackTrace();
		}
		
		return isCorr;
	}
	
	
	public int deleteBoard(String idx) {
		int result = 0;
		
		String query = ""
				+ "delete from mvcboard "
				+ "where idx=?";
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, idx);
			result = pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return result;
	}
	
	public int boardDownloadOfCount(String idx) {
		int result = 0;
		
		String query = ""
				+ "update mvcboard "
				+ "set downcount = downcount+1 "
				+ "where idx=?";
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, idx);
			
			result = pstmt.executeUpdate();
		} catch (Exception e) {
			System.out.println("MVCBoardDAO.boardDownloadOfCount() sql exception");
			e.printStackTrace();
		}
		return result;
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

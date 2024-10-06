package fileupload;

import java.util.LinkedList;
import java.util.List;

import common.JDBCConnect;
import jakarta.servlet.ServletContext;

public class MyFileDAO extends JDBCConnect {

	public MyFileDAO(ServletContext application) {
		super(application);
	}
	
	public int insertFile(MyFileDTO dto) {
		int applyResult = 0;
		
		String query = ""
				+ "insert into myfile(title, cate, ofile, sfile)"
				+ "values(?, ?, ?, ?)";
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, dto.getTitle());
			pstmt.setString(2, dto.getCate());
			pstmt.setString(3, dto.getOfile());
			pstmt.setString(4, dto.getSfile());
			applyResult = pstmt.executeUpdate();
			
		} catch (Exception e) {
			System.out.println("MyFileDAO.insertFile error");
			e.printStackTrace();
		}
		
		return applyResult;
	}
	
	
	public List<MyFileDTO> myFileList(){
		List<MyFileDTO> fileList = new LinkedList<>();
		
		String query = ""
				+ "select * from myfile "
				+ "order by idx DESC";
		
		try {
			pstmt = conn.prepareStatement(query);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				MyFileDTO dto = new MyFileDTO();
				dto.setIdx(rs.getString(1));
				dto.setTitle(rs.getString(2));
				dto.setCate(rs.getString(3));
				dto.setOfile(rs.getString(4));
				dto.setSfile(rs.getString(5));
				dto.setPostdate(rs.getString(6));
				fileList.add(dto);
			}
		} catch (Exception e) {
			System.out.println("MyFileDAO.myFileList() error");
			e.printStackTrace();
		}
		
		return fileList;
	}
	
}

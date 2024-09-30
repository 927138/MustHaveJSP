package membership;

import common.JDBCConnect;
import jakarta.servlet.ServletContext;

public class MemberDAO extends JDBCConnect {

	public MemberDAO(ServletContext application) {
		super(application);
	}
	
	public MemberDTO getMemberDTO(String uid, String upass) {
		MemberDTO dto = new MemberDTO();
		String query = "SELECT * FROM members WHERE id=? AND pass=?";
		
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, uid);
			pstmt.setString(2, upass);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				dto.setId(rs.getNString("id"));
				dto.setPass(rs.getString("pass"));
				dto.setName(rs.getString("name"));
				dto.setRegidate(rs.getString("regidate"));
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return dto;
	}

}

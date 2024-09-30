package member;

import common.JDBCConnect;
import jakarta.servlet.ServletContext;

public class MemberDAO extends JDBCConnect{
	
	public MemberDAO(ServletContext application) {
		super(application);
	}

}

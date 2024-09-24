package board;

import common.JDBCConnect;
import jakarta.servlet.ServletContext;

public class BoardDAO extends JDBCConnect{
	
	public BoardDAO(ServletContext application) {
		super(application);
	}
	
}

package model2.mvcboard;

import java.io.IOException;
import java.util.Arrays;
import java.util.List;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

public class ViewController extends HttpServlet{

	private static final long serialVersionUID = 1L;
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String idx = req.getParameter("idx");
		MVCBoardDAO dao = new MVCBoardDAO(getServletContext());
		dao.updateVisitCount(idx);
		MVCBoardDTO dto = dao.selectView(idx);
		dao.close();
		
		dto.setContent(dto.getContent().replaceAll("\r\n", "<br/>"));
		
		String ext = null, fileName=dto.getSfile();
		List<String> extList = Arrays.asList(new String[] {"png", "jpg", "gif"});
		if(fileName != null) {
			int index = fileName.lastIndexOf('.');
			ext = fileName.substring(index+1);
		}
		
		boolean isImage = extList.contains(ext);
		req.setAttribute("dto", dto);
		req.setAttribute("isImage", isImage);
		req.getRequestDispatcher("/mvcboard/View.jsp").forward(req, resp);
		
	}
}

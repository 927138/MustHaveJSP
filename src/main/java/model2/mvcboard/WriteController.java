package model2.mvcboard;

import java.io.IOException;

import fileupload.FileUtils;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import utils.JSFunction;


@MultipartConfig(
		maxFileSize = 1024 * 1024 * 1,
		maxRequestSize = 1024 * 1024 * 10
	)
public class WriteController extends HttpServlet{
	
	private static final long serialVersionUID = 1L;

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.getRequestDispatcher("/mvcboard/Write.jsp").forward(req, resp);
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String saveDirectory = this.getServletContext().getRealPath("Uploads");
		
		// TODO : JSFunction 기능 구현 후 originalFileName 
		String originalFileName = "";
		try {
			originalFileName = FileUtils.uploadFile(req, saveDirectory);
		} catch (Exception e) {
			System.out.println("writeController() : fileUpload error");
			e.printStackTrace();
			JSFunction.alertLocation(resp, "file upload error", "../mvcboard/write.do");
			return;
		}
		
		MVCBoardDTO dto = new MVCBoardDTO();
		dto.setName(req.getParameter("name"));
		dto.setTitle(req.getParameter("title"));
		dto.setContent(req.getParameter("content"));
		dto.setPass(req.getParameter("pass"));
		
		if(!originalFileName.equals("")) {
			String saveFileName = FileUtils.renameFile(saveDirectory, originalFileName);
			dto.setOfile(originalFileName);
			dto.setSfile(saveFileName);
		}

		MVCBoardDAO dao = new MVCBoardDAO(getServletContext());
		int result = dao.writeBoard(dto);
		dao.close();
		
		if(result > 0) {
			resp.sendRedirect("../mvcboard/list.do");
		}else {
			JSFunction.alertLocation(resp, "board write fail", "../mvcboard/write.do");
		}
	}
}

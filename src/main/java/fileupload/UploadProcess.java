package fileupload;

import java.io.IOException;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;


@WebServlet("/fileUpload/UploadProcess.do")
@MultipartConfig(
		maxFileSize = 1024 * 1024 * 1,
		maxRequestSize = 1024 * 1024 * 10)
public class UploadProcess extends HttpServlet{

	private static final long serialVersionUID = 1L;
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		try {
			String saveDirectory = getServletContext().getRealPath("/Uploads");
			String originalFileName = FileUtils.uploadFile(req, saveDirectory);
			String savedFileName = FileUtils.renameFile(saveDirectory, originalFileName);
			
			insertMyFile(req, originalFileName, savedFileName);
			resp.sendRedirect("./FileList.jsp");
		} catch (Exception e) {
			e.printStackTrace();
			req.setAttribute("errorMessage", "file upload error");
			req.getRequestDispatcher("FileUploadMain.jsp").forward(req, resp);
		}
	}
	
	private void insertMyFile(HttpServletRequest req, String oFileName, String sFileName) {
		String title = req.getParameter("title");
		String[] cateArr = req.getParameterValues("cate");
		StringBuffer cateBuf = new StringBuffer();
		
		if(cateArr == null) {
			cateBuf.append("선택한 카테고리 없음");
		}else {
			for(String c : cateArr) {
				cateBuf.append(c).append(", ");
			}
		}
		
		MyFileDTO dto = new MyFileDTO();
		dto.setTitle(title);
		dto.setCate(cateBuf.toString());
		dto.setOfile(oFileName);
		dto.setSfile(sFileName);
		
		MyFileDAO dao = new MyFileDAO(this.getServletContext());
		dao.insertFile(dto);
		dao.close();
		
	}
}

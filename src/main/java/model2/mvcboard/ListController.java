package model2.mvcboard;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import utils.BoardPage;

public class ListController extends HttpServlet{

	private static final long serialVersionUID = 1L;
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		MVCBoardDAO mvcBoardDao = new MVCBoardDAO(getServletContext());
		
		Map<String, Object> map = new HashMap<>();
		String field = req.getParameter("searchField");
		String word = req.getParameter("searchWord");
		if(word != null) {
			map.put("searchField", field);
			map.put("searchWord", word);
		}
		
		// 페이징 처리를 위한 web.xml에 정의 되어 있는 페이지 크기, 블록 크기를 받아옴.
		int totalCount = mvcBoardDao.selectCount(map);
		int pageSize = Integer.parseInt(getServletContext().getInitParameter("POSTS_PER_PAGE"));
		int blockSize = Integer.parseInt(getServletContext().getInitParameter("POSTS_PER_BLOCK"));
		
		// 페이지위치가 정해지지 않은 상태라면 default 1
		int pageNum = 1;
		String pageTemp = req.getParameter("pageNum");
		if(pageTemp != null && !pageTemp.equals("")) {
			pageNum = Integer.parseInt(pageTemp);
		}
		
		int start = (pageNum - 1) * pageSize + 1;
		int end = pageNum * pageSize;
		map.put("start", start);
		map.put("end", end);
		
		List<MVCBoardDTO> pageList = mvcBoardDao.selectListPage(map);
		mvcBoardDao.close();
		
		String pagingImg = BoardPage.pagingStr(totalCount, pageSize, end, pageNum, "../mvcboard/list.do");
		map.put("pagingImg", pagingImg);
		map.put("totalCount", totalCount);
		map.put("pageSize", pageSize);
		map.put("pageNum", pageNum);
		
		req.setAttribute("map", map);
		req.setAttribute("boardLists", pageList);
		req.getRequestDispatcher("/mvcboard/List.jsp").forward(req, resp);
	}
}

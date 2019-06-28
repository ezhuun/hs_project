package spring.controller.hs;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import spring.mapper.hs.D_dayMapperInter;
import spring.model.d_day.D_dayDTO;
import spring.model.member.MemberDTO;
import spring.utility.hs.Utility;

@Controller
public class D_dayContoller {
	
	@Autowired
	private D_dayMapperInter inter;
	
	@GetMapping("/d_day/create")
	public String create() {
		
		return "/d_day/create";
	}
	
	@PostMapping("/d_day/create")
	public String create(D_dayDTO dto, Model model, RedirectAttributes redi) {

		System.out.println(dto);
		int flag = inter.create(dto);
		if (flag==1) {
			redi.addFlashAttribute("msg", "D-day 생성이 완료 되었습니다.");
			return "redirect:/d_day/list";
		} else {
			model.addAttribute("flag", flag);
			return "error/error";
		}
	}
	
	@GetMapping("/d_day/read")
	public String read(int d_num, Model model) {

		D_dayDTO dto = inter.read(d_num);

		model.addAttribute("dto", dto);
		
		return "/d_day/read";
	}
	
	@GetMapping("/d_day/update")
	public String update(int d_num, Model model) {

		model.addAttribute("dto", inter.read(d_num));
		
		return "/d_day/update";
	}
	
	@PostMapping("/d_day/update")
	public String update(D_dayDTO dto, Model model, RedirectAttributes redi) {

		int flag = inter.update(dto);

		if (flag==1) {
			redi.addFlashAttribute("msg", "게시물 수정 완료 했습니다.");
			return "redirect:/d_day/list";
		} else {
			model.addAttribute("flag", flag);
			return "error/error";
		}
	}
	
	@GetMapping("/d_day/delete")
	public String delete(Model model, int d_num) {
		
		model.addAttribute("dto", inter.read(d_num));
		
		return "/d_day/delete";
	}

	@PostMapping("/d_day/delete")
	public String delete(RedirectAttributes redi, int d_num, Model model) {

		int flag = inter.delete(d_num);

		if (flag==1) {
			redi.addFlashAttribute("msg", "게시물 삭제 완료 했습니다.");
			return "redirect:/d_day/list";
		} else {
			model.addAttribute("flag", flag);
			return "error/error";
		}
	}
	
	@GetMapping("/d_day/list")
	public String list(HttpServletRequest request) {
		
		HttpSession session = request.getSession();
		MemberDTO dto = (MemberDTO)session.getAttribute("member");

		// 검색 관련 ------------------
		String col = Utility.checkNull(request.getParameter("col"));
		String word = Utility.checkNull(request.getParameter("word"));

		if (col.equals("total"))
			word = "";

		// 페이지 관련 -------------------

		int nowPage = 1; // 현재 보고 있는 페이지
		if (request.getParameter("nowPage") != null) {
			nowPage = Integer.parseInt(request.getParameter("nowPage"));
		}
		int recordPerPage = 5; // 한페이지당 보여줄 레코드 갯수

		// DB에서 가져올 순번 ------------------

		// nowPage : 현재 보고 있는 페이지

		int sno = ((nowPage - 1) * recordPerPage) + 1;
		int eno = nowPage * recordPerPage;

		Map map = new HashMap();
		map.put("uuid", dto.getUuid());
		map.put("col", col);
		map.put("word", word);
		map.put("sno", sno);
		map.put("eno", eno);

		int total = inter.total(map);

		List<D_dayDTO> list = inter.list(map);

		String url = "list";
		String paging = Utility.paging(total, nowPage, recordPerPage, col, word, url);

		request.setAttribute("list", list);
		request.setAttribute("paging", paging);
		request.setAttribute("col", col);
		request.setAttribute("word", word);
		request.setAttribute("nowPage", nowPage);
		
		return "/d_day/list";
	}
	
}

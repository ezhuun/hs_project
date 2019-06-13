package spring.controller.hs;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import spring.mapper.hs.AboardMapperInter;
import spring.model.aboard.AboardDTO;
import spring.utility.hs.Utility;

@Controller
public class AboardController {
	
	@Autowired
	private AboardMapperInter ainter;
	
	
	//list
	@RequestMapping("/aboard/list")
	public String list(HttpServletRequest request) {
		
		//검색
		String col = Utility.checkNull(request.getParameter("col"));
		String word = Utility.checkNull(request.getParameter("word"));
		
		if(col.equals("total")) {word = "";}
		
		//페이지
		int nowPage = 1;
		if(request.getParameter("nowPage")!=null) {
			nowPage = Integer.parseInt(request.getParameter("nowPage"));
		}
		
		int recordPerPage = 10;
		
		//db페이징
		int sno = ((nowPage - 1) * recordPerPage) + 1;
		int eno = nowPage * recordPerPage;
		
		Map map = new HashMap();
		map.put("col", col);
		map.put("word",word);
		map.put("sno", sno);
		map.put("eno",eno);
		
		int total = ainter.total(map);
		
		String url = "list";
		String paging = Utility.paging(total, nowPage, recordPerPage, col, word, url);
		
		List<AboardDTO> list = ainter.list(map);
		List<AboardDTO> notice_list = ainter.notice_list(map);
		
		request.setAttribute("notice_list", notice_list);
		request.setAttribute("list", list);
		request.setAttribute("paging", paging);
		request.setAttribute("col", col);
		request.setAttribute("word", word);
		request.setAttribute("nowPage", nowPage);
		request.setAttribute("ainter", ainter);
		
		return "/aboard/list";
				
	}
		
	
	//create
	@GetMapping("/aboard/create")
	public String create() {
		
		return "/aboard/create";	
		
	}
		
	@PostMapping("/aboard/create")
	public String create(AboardDTO dto, Model model, RedirectAttributes redi) {
		
			boolean flag = ainter.create(dto)>0;
			
			if(flag) {
				redi.addFlashAttribute("msg","게시글이 등록되었습니다.");
				return "redirect:/aboard/list";				
			}else {
				model.addAttribute("flag",flag);
				return "error/error";
			}		
	}
		
	
	//read
	@GetMapping("/aboard/read")	
	public String read(int a_num, Model model, int nowPage, String col, String word,HttpServletRequest request) {
		
		ainter.upViewcnt(a_num);
		
		AboardDTO dto = ainter.read(a_num);
		
		model.addAttribute("dto",dto);
		
		//댓글
		int nPage = 1;
		if(request.getParameter("nPage") != null) {
			nPage = Integer.parseInt(request.getParameter("nPage"));
		}
		
		int recordPerPage = 5; // 한페이지당 출력할 레코드 갯수
		int sno = ((nPage - 1) * recordPerPage) + 1; //
		int eno = nPage * recordPerPage;
				
		Map map = new HashMap();
		map.put("sno", sno);
		map.put("eno", eno);
		map.put("a_num", a_num);
		map.put("nPage", nPage);
		map.put("nowPage", nowPage);
		map.put("col", col);
		map.put("word", word);
		model.addAllAttributes(map);
		
		return "/aboard/read";
		
	}
				
	
	//update
	@GetMapping("/aboard/update")
	public String update(int a_num, Model model) {
		
		AboardDTO dto = ainter.read(a_num);
		model.addAttribute("dto", dto);
		
		return "/aboard/update";		
		
	}
	
	@PostMapping("/aboard/update")
	public String update(AboardDTO dto, Model model, RedirectAttributes redi) {
		
		boolean flag= ainter.update(dto)>0;
		
		if(flag==true) {
			redi.addFlashAttribute("msg", "게시글을 수정했습니다");
			return "redirect:/aboard/list";
		}else {
			model.addAttribute("flag", flag);
			return "error/error";
		}
				
	}
	
	
	//delete		
	@PostMapping("/aboard/delete")
	public String delete(@RequestParam Map<String, String>map, int a_num, Model model, RedirectAttributes redi) {
		
		boolean flag = ainter.delete(a_num)>0;

		if(flag==true) {
			redi.addFlashAttribute("msg", "게시글이 삭제되었습니다");
			return "redirect:/aboard/list";
		} else {
				model.addAttribute("flag", flag);
				return "error/error";
		}

	}
		

}

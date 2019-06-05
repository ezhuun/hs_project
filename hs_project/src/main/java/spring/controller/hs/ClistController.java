package spring.controller.hs;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import spring.mapper.hs.ClistMapperInter;
import spring.model.clist.ClistDTO;
import spring.utility.hs.Utility;

@Controller
public class ClistController {

	@Autowired
	private ClistMapperInter inter;
	
	
	@GetMapping("/c_list/create")
	public String create(){
		return "/c_list/create";

	}
	
	@PostMapping("/c_list/create")
	public String create(ClistDTO dto, HttpServletRequest request, RedirectAttributes redi) {

		
		int flag=inter.create(dto);
		
		redi.addFlashAttribute("flag", flag);
		if(flag==1) {
			redi.addFlashAttribute("msg", "게시물을 생성했습니다.");
			return "redirect:/c_list/list";
		}else {
			return "/error";
		}
		
	}
		
	@RequestMapping("/c_list/list")
	public String list(HttpServletRequest request) {
	
		String col=Utility.checkNull(request.getParameter("col"));
		String word=Utility.checkNull(request.getParameter("word"));
		
		if(col.equals("total"))
			word="";
		
		int nowPage=1;
		int recordPerPage=5;
		
		if(request.getParameter("nowPage")!=null) {
			nowPage=Integer.parseInt(request.getParameter("nowPage"));
			
		}
		
		int sno= ((nowPage-1) * recordPerPage) + 1; 
		int eno= nowPage * recordPerPage;
		
		Map map=new HashMap();
		map.put("col", col);
		map.put("word", word);
		map.put("sno", sno);
		map.put("eno", eno);
		
		List<ClistDTO> list = inter.list(map);
		
		int totalRecord=inter.total(map);
		String paging=Utility.paging(totalRecord, nowPage, recordPerPage, col, word, "list");
		
		
		System.out.println(list);
		
		request.setAttribute("list", list);
		request.setAttribute("paging", paging);
		request.setAttribute("col", col);
		request.setAttribute("word", word);
		request.setAttribute("nowPage", nowPage);
				
				
		
		
		return "/c_list/list";
	}
		
		
		
		
	}
	

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
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import spring.mapper.hs.DiaryMapperInter;
import spring.model.diary.DiaryDTO;
import spring.utility.hs.Utility;

@Controller
public class DiaryController {
	
	@Autowired
	private DiaryMapperInter diaryinter;
	
	//create
	@GetMapping("/diary/create")
	public String create() {
		return "/diary/create";
	}
	@PostMapping("/diary/create")
	public String create(DiaryDTO diarydto,RedirectAttributes redi,Model model) {
		
		System.out.println(diarydto);
		int flag = diaryinter.create(diarydto);
		
		if(flag>0) {
			redi.addFlashAttribute("msg","등록성공");
			return "redirect:/diary/list";
		}
		else {
			model.addAttribute("msg", "등록실패");
			return "/diary/create";//현재페이지에 계속 있음
		}
	}
	
	//read
	@GetMapping("/diary/read")
	public String read(int nowPage,int diary_num,HttpServletRequest request,Model model) {
		//조회수증가 추가
		DiaryDTO diarydto = diaryinter.read(diary_num);
		model.addAttribute("diarydto", diarydto);
		
		//댓글관련 추가
		int nPage = 1;
		
		if(request.getParameter("nPage")!=null) {
			nPage = Integer.parseInt(request.getParameter("nPage"));
		}
		
		int recordPerPage = 3; // 한페이지당 출력할 레코드 갯수
		int sno = ((nPage - 1) * recordPerPage) + 1; //
		int eno = nPage * recordPerPage;
		
		Map map = new HashMap();
		map.put("diary_num", diary_num);
		map.put("sno", sno);
		map.put("eno", eno);
		map.put("nowPage", nowPage);
		
		model.addAttribute("map",map);
		
		return "/diary/read";
	}
	
	//update
	//delete
	//list
	@RequestMapping("/diary/list")
	public String list(HttpServletRequest request) {
		//페이지 설정
		int nowPage = 1;
		if(request.getParameter("nowPage")!=null) {
			nowPage = Integer.parseInt(request.getParameter("nowPage"));
		}
		int recordPerPage = 5;
		
		int sno = ((nowPage - 1) * recordPerPage) + 1;
		int eno = nowPage * recordPerPage;
		
		Map map = new HashMap();
		map.put("sno", sno);
		map.put("eno", eno);
		
		int total = diaryinter.total();
		
		String url = "list";
		String paging = Utility.paging(total, nowPage, recordPerPage,url);
		
		//list담기
		List<DiaryDTO>list = diaryinter.list(map);
		
		request.setAttribute("list", list);
		request.setAttribute("nowPage",nowPage);
		request.setAttribute("paging", paging);
		request.setAttribute("diaryinter", diaryinter);
		
		return "/diary/list";
	}
	
}

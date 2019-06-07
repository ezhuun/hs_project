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
			redi.addFlashAttribute("msg","글 생성 성공");
			return "redirect:/diary/list";
		}
		else {
			model.addAttribute("msg", "글 생성 실패");
			return "/diary/create";//�쁽�옱�럹�씠吏��뿉 怨꾩냽 �엳�쓬
		}
	}
	
	//read
	@GetMapping("/diary/read")
	public String read(int diary_num,HttpServletRequest request,Model model) {
		//議고쉶�닔利앷� 異붽�
		DiaryDTO diarydto = diaryinter.read(diary_num);
		model.addAttribute("diarydto", diarydto);//title,content,d_date등은 jsp에서 사용시 diarydto를 붙이고 사용가능
		
		//�뙎湲�愿��젴 異붽�
		int nPage = 1;
		
		if(request.getParameter("nPage")!=null) {
			nPage = Integer.parseInt(request.getParameter("nPage"));
		}
		
		int recordPerPage = 3; // �븳�럹�씠吏��떦 異쒕젰�븷 �젅肄붾뱶 媛��닔
		int sno = ((nPage - 1) * recordPerPage) + 1; //
		int eno = nPage * recordPerPage;
		
		Map map = new HashMap();
		map.put("diary_num", diary_num);//diarydto를 붙이지 않고 diary_num사용가능
		map.put("sno", sno);
		map.put("eno", eno);
		//map.put("nowPage", nowPage);
		
		model.addAttribute("map",map);
		
		return "/diary/read";
	}
	
	//update
	//delete
	//list
	@RequestMapping("/diary/list")
	public String list(HttpServletRequest request) {
		//�럹�씠吏� �꽕�젙
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
		
		//list�떞湲�
		List<DiaryDTO>list = diaryinter.list(map);
		
		request.setAttribute("list", list);
		request.setAttribute("nowPage",nowPage);
		request.setAttribute("paging", paging);
		request.setAttribute("diaryinter", diaryinter);
		
		return "/diary/list";
	}
	
}

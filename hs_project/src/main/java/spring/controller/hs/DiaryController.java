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
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import spring.mapper.hs.DiaryMapperInter;
import spring.mapper.hs.DiaryReplyMapperInter;
import spring.model.diary.DiaryDTO;
import spring.model.diary.DiaryService;
import spring.utility.hs.Utility;

@Controller
public class DiaryController {

	@Autowired
	private DiaryMapperInter diaryinter;
		
	//댓글과 글 삭제 service
	@Autowired
	private DiaryService service;
	
	@Autowired
	private DiaryReplyMapperInter drinter;
	
	// create
	@GetMapping("/diary/create")
	public String create() {
		return "/diary/create";
	}

	@PostMapping("/diary/create")
	public String create(DiaryDTO diarydto, RedirectAttributes redi, Model model,HttpServletRequest request) {
		
		String basePath = request.getRealPath("/resources/images/diary/storage");
		String filename = null;
		
		int size = (int)diarydto.getFilenameMF().getSize();
		if(size>0) {
			filename = Utility.saveFileSpring(diarydto.getFilenameMF(), basePath);
		}else {
			filename = "default.jpg";
		}
		diarydto.setFilename(filename);
		
		System.out.println(diarydto);
				
		int flag = diaryinter.create(diarydto);

		if (flag > 0) {
			redi.addFlashAttribute("msg", "글 생성 성공");
			return "redirect:/diary/list";
		} else {
			model.addAttribute("msg", "글 생성 실패");
			return "/diary/create";// �쁽�옱�럹�씠吏��뿉 怨꾩냽 �엳�쓬
		}
	}

	// read
	@GetMapping("/diary/read")
	public String read(int diary_num, HttpServletRequest request, Model model,String nowPage) {
		// 議고쉶�닔利앷� 異붽�
		DiaryDTO diarydto = diaryinter.read(diary_num);
		model.addAttribute("diarydto", diarydto);// title,content,d_date등은 jsp에서 사용시 diarydto를 붙이고 사용가능

		//조회 하단에 댓글 페이징
		int nPage = 1;

		if (request.getParameter("nPage") != null) {
			nPage = Integer.parseInt(request.getParameter("nPage"));
		}

		int recordPerPage = 5; // �븳�럹�씠吏��떦 異쒕젰�븷 �젅肄붾뱶 媛��닔
		int sno = ((nPage - 1) * recordPerPage) + 1; //
		int eno = nPage * recordPerPage;

		Map map = new HashMap();
		map.put("diary_num", diary_num);// diarydto를 붙이지 않고 diary_num사용가능
		map.put("sno", sno);
		map.put("eno", eno);
		map.put("nPage", nPage);
		map.put("nowPage", nowPage);
		
		request.setAttribute("drinter", drinter);
		model.addAllAttributes(map);
		
		return "/diary/read";
	}

	// update
	@GetMapping("/diary/update")
	public String update(int diary_num, Model model) {//컨트롤러에 접근하기 전 read.jsp에서 넘겨받은 데이터가 들어갈 수 있음(hidden)
		DiaryDTO diarydto = diaryinter.read(diary_num);
		model.addAttribute("diarydto", diarydto);
		
		return "/diary/update";
	}

	@PostMapping("/diary/update")
	public String update(DiaryDTO diarydto,String oldfile,MultipartFile filenameMF, RedirectAttributes redi, Model model,HttpServletRequest request) {

		int diary_num = Integer.parseInt(request.getParameter("diary_num"));
		String basePath = request.getRealPath("/resources/images/diary/storage");
		String filename = null;
		
		if(filenameMF.getSize()>0) {
			if(oldfile !=null && !oldfile.equals("default.jpg")) {
				Utility.deleteFile(basePath, oldfile);
			}
			filename = Utility.saveFileSpring(filenameMF, basePath);
		}else {
			filename = oldfile;
		}
		
		diarydto.setFilename(filename);
		int flag = diaryinter.update(diarydto);
		
		System.out.println(flag);
		if(flag>0) {
			redi.addFlashAttribute("msg","글수정 성공");
			redi.addFlashAttribute("diary_num",diary_num);
			return "redirect:/diary/list";//redirect
		}else {
			model.addAttribute("msg","글수정 실패");
			return "/diary/update";
		}
	}

	// delete
	/*@GetMapping("/diary/delete")
	public String delete() {
		return "/diary/delete";
	}
	*/
	@PostMapping("/diary/delete")
	public String delete(int diary_num, RedirectAttributes redi) {
		
		try {
			System.out.println("gggggggggggggggggggggggggggggggg");
			 service.delete(diary_num);
			 return "redirect:/diary/list";
		}catch (Exception e) {
			// TODO: handle exception
			System.out.println("ettttttttttttttttttttt");
			return "/diary/read";
		}
		
	}
	
	// list
	@RequestMapping("/diary/list")
	public String list(HttpServletRequest request) {
		// �럹�씠吏� �꽕�젙
		int nowPage = 1;
		if (request.getParameter("nowPage") != null) {
			nowPage = Integer.parseInt(request.getParameter("nowPage"));
		}
		int recordPerPage = 50;

		int sno = ((nowPage - 1) * recordPerPage) + 1;
		int eno = nowPage * recordPerPage;

		Map map = new HashMap();
		map.put("sno", sno);
		map.put("eno", eno);

		int total = diaryinter.total();

		String url = "list";
		String paging = Utility.diarypaging(total, nowPage, recordPerPage, url);

		// list�떞湲�
		List<DiaryDTO> list = diaryinter.list(map);

		request.setAttribute("list", list);
		request.setAttribute("nowPage", nowPage);
		request.setAttribute("paging", paging);
		request.setAttribute("diaryinter", diaryinter);

		return "/diary/list";
	}

}

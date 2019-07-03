package spring.controller.hs;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

import spring.mapper.hs.AboardMapperInter;
import spring.mapper.hs.DiaryMapperInter;
import spring.mapper.hs.MemberMapperInter;
import spring.model.aboard.AboardDTO;
import spring.model.diary.DiaryDTO;
import spring.model.member.MemberDTO;

@Controller
public class IndexController {
	
	@Autowired
	private MemberMapperInter mapper;
	
	@Autowired
	private DiaryMapperInter diarymapper;
	
	@Autowired
	private AboardMapperInter aboardmapper;
	
	@GetMapping("/main")
	public String main(HttpSession session, HttpServletRequest request ) {
		//session에서 memberdto꺼내서 그 정보를갖고 /다이어리정보갖고와야함
		//request.setAttribute("diary", diarydto);
		session = request.getSession();
		MemberDTO memberdto =  (MemberDTO)session.getAttribute("member");	
		String c_code = memberdto.getC_code();
		
		List<DiaryDTO> diarylist = diarymapper.maindiary(c_code);
		request.setAttribute("diarylist", diarylist);
		System.out.println(diarylist+"11558866334455");
		
		int nowPage = 1;
		
		
		int recordPerPage = 10;
		
		//db페이징
		int sno = ((nowPage - 1) * recordPerPage) + 1;
		int eno = nowPage * recordPerPage;
		
		Map map = new HashMap();
		map.put("col", "");
		map.put("word","");
		map.put("sno", sno);
		map.put("eno",eno);
		
		List<AboardDTO> aboardlist = aboardmapper.notice_list(map);
		request.setAttribute("sno", sno);
		request.setAttribute("eno", eno);
		request.setAttribute("nowPage", nowPage);
		request.setAttribute("aboardlist", aboardlist);
		return "/index";
	}
}

package spring.controller.hs;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import spring.mapper.hs.ClistMapperInter;
import spring.model.clist.ClistDTO;
import spring.model.member.MemberDTO;

@Controller
public class ClistController {

	@Autowired
	private ClistMapperInter inter;

	@ResponseBody

	@GetMapping("/c_list/update")
	public String update() {
		return "/c_list/update";
	}

	@ResponseBody
	@PostMapping("/c_list/update")
	public Map update(String c_num, String checked) {
		Map map = new HashMap();
		map.put("c_num", c_num);
		map.put("checked", checked);
		
		inter.update(map);
		
		return map;
	}

	@GetMapping("/c_list/create")
	public String create() {
		return "/c_list/create";

	}

	@PostMapping("/c_list/create")
	public String create(ClistDTO dto, HttpServletRequest request, RedirectAttributes redi) {

		int flag = inter.create(dto);

		redi.addFlashAttribute("flag", flag);
		if (flag == 1) {
			redi.addFlashAttribute("msg", "게시물을 생성했습니다.");
			return "redirect:/c_list/list";
		} else {
			return "/error";
		}

	}

	@RequestMapping("/c_list/list")
	public String list(HttpServletRequest request) {
		HttpSession session = request.getSession();

		MemberDTO dto = (MemberDTO) session.getAttribute("member");
		Map<String, String> map = new HashMap<String, String>();
		map.put("c_code", dto.getC_code());

		List<ClistDTO> list = inter.list(map);
		request.setAttribute("list", list);

		return "/c_list/list";
	}

}

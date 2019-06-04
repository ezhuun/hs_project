package spring.controller.hs;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import spring.mapper.hs.D_dayMapperInter;
import spring.model.d_day.D_dayDTO;

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

		int flag = inter.create(dto);

		if (flag==1) {
			redi.addFlashAttribute("msg", "D-day 생성이 완료 되었습니다.");
			return "redirect:/d_day/list";
		} else {
			model.addAttribute("flag", flag);
			return "error/error";
		}
	}
	
}

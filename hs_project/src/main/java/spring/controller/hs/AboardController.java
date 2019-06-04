package spring.controller.hs;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import spring.mapper.hs.AboardMapperInter;
import spring.model.aboard.AboardDTO;

@Controller
public class AboardController {
	
	@Autowired
	private AboardMapperInter ainter;
	
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
		
		
		
		
	
	
	
	
	

}

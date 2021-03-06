package spring.utility.hs;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;
import org.springframework.web.util.WebUtils;

import spring.model.member.MemberDTO;
import spring.model.member.MemberService;

public class AutoLoginInterceptor extends HandlerInterceptorAdapter {
	
	@Autowired
	MemberService service;

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		
		HttpSession session = request.getSession();
		Object obj = session.getAttribute("member");
		
		if(obj != null) {
			MemberDTO dto = (MemberDTO)obj;
			dto = service.getJoinMemberByUuid(dto.getUuid());
//			dto.setLover(service.getConnectedAccount(dto.getUuid()));
//			dto.setConnect(service.getCode(dto.getC_code()));
			session.setAttribute("member", dto);
			
			response.sendRedirect(request.getContextPath()+"/main");
			return false;
		}else{
			Cookie cookieLogin = WebUtils.getCookie(request, "cookieLogin");
			if(cookieLogin != null) {
				String session_key = cookieLogin.getValue();
				MemberDTO dto = service.checkMemberWithSessionKey(session_key);

				if(dto != null) {
					dto = service.getJoinMemberByUuid(dto.getUuid());
//					dto.setLover(service.getConnectedAccount(dto.getUuid()));
//					dto.setConnect(service.getCode(dto.getC_code()));
					session.setAttribute("member", dto);
					
					response.sendRedirect(request.getContextPath()+"/main");
					return false;
				}
			}
		}
		
		return true;
	}

}

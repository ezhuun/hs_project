package spring.model.member;

import java.util.HashMap;
import java.util.Map;

import org.junit.Ignore;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.web.WebAppConfiguration;

import spring.mapper.hs.MemberMapperInter;

@WebAppConfiguration
@RunWith(SpringJUnit4ClassRunner.class)
//@ContextConfiguration(locations = { "file:src/main/webapp/WEB-INF/spring/**/*.xml"})
@ContextConfiguration(locations = { "file:src/main/webapp/WEB-INF/spring/root-context.xml", 
		"file:src/main/webapp/WEB-INF/spring/appServlet/servlet-context.xml",
		"file:src/main/webapp/WEB-INF/spring/spring-security.xml"
		})
public class MemberServiceImplTest {

	private static final Logger logger = LoggerFactory.getLogger(MemberServiceImplTest.class);
	
	@Autowired
	private MemberService service;
	@Autowired
	private MemberMapperInter inter;
	
	@Test
	//@Ignore
	public void testGetCcodebyUuid() {
		String uuid = "1a5db6d777d748eeb872566649a4ffa0";
		String code = service.getCcodebyUuid(uuid);
		
		logger.info("code is " + code);
	}
	
	@Test
	@Ignore
	public void testcreateMember() {
		Map<String, String> map = new HashMap<String, String>();
		map.put("email", "abcd@abcd.abcd");
		map.put("passwd", "123");
		map.put("code", "1212");
		map.put("uuid", "uuuuuid");
		
		boolean flag = false;
		try {
			flag = service.createMember(map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		logger.info("createMember: " + flag);
	}

}

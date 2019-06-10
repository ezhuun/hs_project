package spring.model.member;

import static org.junit.Assert.assertTrue;

import java.util.Date;
import java.util.HashMap;
import java.util.Map;

import org.junit.Ignore;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.web.WebAppConfiguration;

import spring.mapper.hs.MemberMapperInter;
import spring.utility.hs.Utility;

@WebAppConfiguration
@RunWith(SpringJUnit4ClassRunner.class)
//@ContextConfiguration(locations = { "file:src/main/webapp/WEB-INF/spring/**/*.xml"})
@ContextConfiguration(locations = { "file:src/main/webapp/WEB-INF/spring/root-context.xml",
		"file:src/main/webapp/WEB-INF/spring/appServlet/servlet-context.xml",
		"file:src/main/webapp/WEB-INF/spring/spring-security.xml" })
public class MemberServiceImplTest {

	private static final Logger logger = LoggerFactory.getLogger(MemberServiceImplTest.class);
	private int amount = (60 * 60 * 24) * 3;

	@Autowired
	private MemberService service;
	@Autowired
	private BCryptPasswordEncoder passwordEncoder;

	@Test
	// @Ignore
	public void testDiffDay() {
		long day = Utility.validDiffTime("2019-06-12" + " 00:00:00");
		System.out.println(day);
	}

	@Test
	@Ignore
	public void testDeleteMember() {
		boolean flag = false;

		try {
			flag = service.deleteMember("uuid1");
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		logger.info("deleteMember: " + flag);
	}

	@Test
	@Ignore
	public void testUpdateDisconnectStatus() {
		boolean flag = false;

		Date limit = new Date(System.currentTimeMillis() + (1000 * amount));
		try {
			flag = service.updateDisconnectStatus("guest2", limit);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		logger.info("disconnect: " + flag);
	}

	@Test
	@Ignore
	public void testChangePasswd() {
		boolean flag = false;

		flag = service.changePasswd("guest1", "1234");

		logger.info("change password: " + flag);
	}

	@Test
	@Ignore
	public void testGetCcodebyUuid() {
		String uuid = "guest1";
		String code = service.getCcodebyUuid(uuid);

		logger.info("code is " + code);
	}

	@Test
	@Ignore
	public void testCheckMemberWithSessionKey() {
		MemberDTO dto = service.checkMemberWithSessionKey("sessssion_____key");

		logger.info("dto from session_key : " + dto);
	}

	@Test
	@Ignore
	public void testKeepLogin() {
		boolean flag = false;

		Date limit = new Date(System.currentTimeMillis() + (1000 * amount));
		flag = service.keepLogin("guest2", "1234", limit);

		logger.info("keeplogin: " + flag);
	}

	@Test
	@Ignore
	public void testGetConnectedAccount() {
		MemberDTO dto = service.getConnectedAccount("guest2");

		logger.info("dto: " + dto);
	}

	@Test
	@Ignore
	public void testLastLoginUpdate() {
		service.lastLoginUpdate("guest2");

		logger.info("last_login date update success");
	}

	@Test
	@Ignore
	public void testPasswdCheck() {
		boolean flag = false;

		flag = service.passwdCheck("1234", "$2a$10$a40sP2IsjHIC0/E/fQ/7cOympZruRX1J4MAAQPTuKQjc4CP33xf1y");

		logger.info("password check : " + flag);
	}

	@Test
	@Ignore
	public void testUpdateProfile() {
		MemberDTO dto = new MemberDTO();
		dto.setUuid("guest2");
		dto.setName("haha");
		dto.setGender("m");
		dto.setBegin_date("2019-06-03");
		dto.setBirth("2019-06-03");

		boolean flag = false;
		flag = service.updateProfile(dto);

		logger.info("updateProfile: " + flag);
	}

	@Test
	@Ignore
	public void testUpdatePhoto() {
		boolean flag = false;

		flag = service.updatePhoto("guest2", "phototototototo");

		logger.info("update photo: " + flag);
	}

	@Test
	@Ignore
	public void testGetMemberByEmail() {
		MemberDTO dto = service.getMemberByEmail("b@b.b");

		logger.info("dto: " + dto);
	}

	@Test
	@Ignore
	public void GetMemberByUuid() {
		MemberDTO dto = service.getMemberByUuid("guest2");

		logger.info("dto: " + dto);
	}

	@Test
	@Ignore
	public void testValidCode() {
		boolean flag = false;
		flag = service.validCode("guest2");

		logger.info("valid code: " + flag);
	}

	@Test
	@Ignore
	public void testResigerConnect() {
		boolean flag = false;
		try {
			flag = service.resigerConnect("guest2", "00000001");
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		logger.info("connected: " + flag);
	}

	@Test
	@Ignore
	public void testGetCode() {
		MemberConnectDTO dto = service.getCode("00000001");

		logger.info("MemberConnectDTO: " + dto);
	}

	@Test
	@Ignore
	public void testSendMail() {
		String email = "ljhadf@naver.com";
		String title = "테스트메일입니다";
		String message = "테스트 메일에 대한 내용입니다.";
		String location = "/login";
		String btnStr = "테스트버튼";

		int cnt = service.sendMail(email, title, message, location, btnStr);

		logger.info("mail send: " + cnt);
	}

	@Test
	@Ignore
	public void testCreateMember() {
		boolean flag = false;

		Map<String, String> map = new HashMap<String, String>();
		map.put("email", "test@test.test");
		map.put("passwd", passwordEncoder.encode("1234"));
		map.put("code", "00000011");
		map.put("uuid", "test1");

		try {
			flag = service.createMember(map);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		logger.info("create member: " + flag);
	}

	@Test
	@Ignore
	public void testRegisterMember() {

		Map map = service.registerMember("test2@test2.test2", "1234");

		logger.info("register Member: " + map);
	}

	@Test
	public void testDuplicateEmail() {
		boolean flag = false;
		flag = service.duplicateEmail("b@b.b");

		logger.info("duplicate email: " + flag);
	}
}

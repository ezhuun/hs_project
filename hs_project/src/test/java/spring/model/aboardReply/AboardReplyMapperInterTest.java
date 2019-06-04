package spring.model.aboardReply;

import static org.junit.Assert.assertTrue;

import java.util.HashMap;
import java.util.List;
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

import spring.mapper.hs.AboardReplyMapperInter;



@WebAppConfiguration
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = { "file:src/main/webapp/WEB-INF/spring/root-context.xml",
"file:src/main/webapp/WEB-INF/spring/appServlet/servlet-context.xml",
"file:src/main/webapp/WEB-INF/spring/spring-security.xml"})
public class AboardReplyMapperInterTest {
	
	private static final Logger logger = LoggerFactory.getLogger(AboardReplyMapperInterTest.class);
	
	@Autowired
	private AboardReplyMapperInter inter;

	@Test
	@Ignore
	public void testCreate() {
		AboardReplyDTO dto = new AboardReplyDTO();
	dto.setR_num(1);
		dto.setR_name("답!!");
		dto.setContent("덕수궁가요 ㅋㅋㅋ");
		dto.setUuid("guest2");
		
		assertTrue(inter.create(dto)>0);
	
	}	

	@Test
	@Ignore
	public void testRead() {
		AboardReplyDTO dto = inter.read(2);
		logger.info("dto: " + dto);
	}

	@Test
	@Ignore
	public void testUpdate() {
		AboardReplyDTO dto = new AboardReplyDTO();
		dto.setContent("-----댓글수정--------");
		dto.setR_num(1);

		assertTrue(inter.update(dto)>0);
	}
	
	@Test
	@Ignore
	public void testDelete() {
		
		int r_num = 1;
		assertTrue(inter.delete(r_num)>0);
	
	}


	@Test
	@Ignore
	public void testList() {
		Map map = new HashMap();
		map.put("a_num", 1);
		map.put("sno", 1);
		map.put("eno", 5);

		List<AboardReplyDTO> list = inter.list(map);
		logger.info("list: " + list);
	}

	@Test
	//@Ignore
	public void testTotal() {
		int r_num = 3;
		int cnt = inter.total(r_num);
		logger.info("total: " + cnt);
	}


	

}

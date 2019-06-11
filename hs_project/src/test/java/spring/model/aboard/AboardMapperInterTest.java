package spring.model.aboard;

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

import spring.mapper.hs.AboardMapperInter;


@WebAppConfiguration
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = { "file:src/main/webapp/WEB-INF/spring/root-context.xml",
"file:src/main/webapp/WEB-INF/spring/appServlet/servlet-context.xml",
"file:src/main/webapp/WEB-INF/spring/spring-security.xml"})
public class AboardMapperInterTest {
	
	private static final Logger logger = LoggerFactory.getLogger(AboardMapperInterTest.class);
	
	@Autowired
	private AboardMapperInter inter;

	@Test
	@Ignore
	public void testCreate() {
		AboardDTO dto = new AboardDTO();
		dto.seta_num(3);
		dto.seta_name("궁그미");
		dto.setTitle("이번주말에 데이트 장소로..");
		dto.setContent("휴일인데 어디를 가야할까요?");
		dto.setUuid("guest1");
		
		assertTrue(inter.create(dto)>0);
	
	}	

	@Test
	@Ignore
	public void testRead() {
		AboardDTO dto = inter.read(2);
		logger.info("dto: " + dto);
	}

	@Test
	@Ignore
	public void testUpdate() {
		AboardDTO dto = new AboardDTO();
		dto.setTitle("수정중입니다");
		dto.setContent("-----댓글수정--------");
		dto.seta_num(1);

		assertTrue(inter.update(dto)>0);
	}
	
	@Test
	@Ignore
	public void testDelete() {
		
		int a_num = 2;
		assertTrue(inter.delete(a_num) > 0);
	
	}


	@Test
	@Ignore
	public void testList() {
		Map map = new HashMap();
		map.put("a_num", 1);
		map.put("sno", 1);
		map.put("eno", 5);

		List<AboardDTO> list = inter.list(map);
		logger.info("list: " + list);
	}

	@Test
	
	public void testTotal() {
		Map map = new HashMap();
		
		String col = "제목";
		String word = "수정중";
		int sno = 1;
		int eno = 10;
		
		
		map.put("col", col);
		map.put("word", word);
		map.put("sno", sno);
		map.put("eno", eno);
		
		
		int cnt = inter.total(map);
		logger.info("total: " + cnt);
	}


	

}

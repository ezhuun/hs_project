package spring.model.diaryreply;

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

import spring.mapper.hs.DiaryReplyMapperInter;
import spring.model.diary.DiaryReplyDTO;

@WebAppConfiguration
@RunWith(SpringJUnit4ClassRunner.class)
//@ContextConfiguration(locations = { "file:src/main/webapp/WEB-INF/spring/**/*.xml"})
@ContextConfiguration(locations = { "file:src/main/webapp/WEB-INF/spring/root-context.xml", 
		"file:src/main/webapp/WEB-INF/spring/appServlet/servlet-context.xml",
		"file:src/main/webapp/WEB-INF/spring/spring-security.xml"
		})
public class DiaryReplyMapperInterTest {
	
	private Logger logger = LoggerFactory.getLogger(this.getClass());
	
	@Autowired 
	DiaryReplyMapperInter drinter;
	
	@Test
	//@Ignore
	public void test() {
		Map map = new HashMap();
		
		List<DiaryReplyDTO> list = drinter.mdrJoinList(map);
		System.out.println(list);	
	}
	
	
	@Test
	@Ignore
	public void testCreate() {
		DiaryReplyDTO drdto = new DiaryReplyDTO();
		drdto.setR_num(3);
		drdto.setContent("공원이 너무너무 예뻤당");
		drdto.setUuid("test2");
		
		
		assertTrue(drinter.create(drdto)>0);
	}

	@Test
	 @Ignore
	public void testRead() {
		DiaryReplyDTO drdto = drinter.read(1);
		logger.info("drdto: " + drdto);
		
	}

	@Test
	@Ignore
	public void testUpdate() {
		DiaryReplyDTO drdto = new DiaryReplyDTO();
		drdto.setContent("어린이대공원도 예뻤지만 석촌호수 야경도 너무 좋았당");
		drdto.setR_num(1);
		
		assertTrue(drinter.update(drdto) > 0);
	}

	@Test
	@Ignore
	public void testDelete() {
		int diary_num = 1;
		assertTrue(drinter.delete(diary_num) > 0);
	}

	@Test
	@Ignore
	public void testBdelete() throws Exception {
		int diary_num = 3;
	}

	@Test
	@Ignore
	public void testList() {
		Map map = new HashMap();
		map.put("diary_num", 1);
		map.put("sno", 1);
		map.put("eno", 5);

		List<DiaryReplyDTO> list = drinter.list(map);
		logger.info("list: " + list);
	}

	@Test
	@Ignore
	public void testTotal() {
		int diary_num = 1;
		int cnt = drinter.total(diary_num);
		logger.info("total: " + cnt);
	}

}

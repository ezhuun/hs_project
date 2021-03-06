package spring.model.diary;

import static org.junit.Assert.assertTrue;
import static org.junit.Assert.fail;

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

import spring.mapper.hs.DiaryMapperInter;

@WebAppConfiguration
@RunWith(SpringJUnit4ClassRunner.class)
//@ContextConfiguration(locations = { "file:src/main/webapp/WEB-INF/spring/**/*.xml"})
@ContextConfiguration(locations = { "file:src/main/webapp/WEB-INF/spring/root-context.xml", 
		"file:src/main/webapp/WEB-INF/spring/appServlet/servlet-context.xml",
		"file:src/main/webapp/WEB-INF/spring/spring-security.xml"
		})
public class DiaryMapperInterTest {
	
	private Logger logger = LoggerFactory.getLogger(this.getClass());
	
	@Autowired 
	DiaryMapperInter diaryinter;
	
	@Test
	//@Ignore
	public void test() {
		Map map = new HashMap();
		
		List<DiaryDTO> list = diaryinter.mdJoinList(map);
		System.out.println(list);	
	}
	
	
	@Test
	@Ignore
	public void testCreate() {
		DiaryDTO diarydto = new DiaryDTO();
		diarydto.setDiary_num(3);
		diarydto.setTitle("어린이대공원 다녀옴");
		diarydto.setContent("공원이 너무너무 예뻤당");
		diarydto.setC_code("00000001");
		diarydto.setUuid("test2");
		diarydto.setD_date("2019-04-01");
		
		assertTrue(diaryinter.create(diarydto)>0);
	}

	@Test
	 @Ignore
	public void testRead() {
		DiaryDTO diarydto = diaryinter.read(1);
		logger.info("diarydto: " + diarydto);
		
	}

	@Test
	@Ignore
	public void testUpdate() {
		DiaryDTO diarydto = new DiaryDTO();
		diarydto.setTitle("어린이대공원과 석촌호수");
		diarydto.setContent("어린이대공원도 예뻤지만 석촌호수 야경도 너무 좋았당");
		diarydto.setD_date("2019-06-06");
		diarydto.setDiary_num(1);;
		
		assertTrue(diaryinter.update(diarydto) > 0);
	}

	@Test
	@Ignore
	public void testDelete() {
		int diary_num = 1;
		assertTrue(diaryinter.delete(diary_num) > 0);
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

		List<DiaryDTO> list = diaryinter.list(map);
		logger.info("list: " + list);
	}

	@Test
	@Ignore
	public void testTotal() {
		int diary_num = 1;
		int cnt = diaryinter.total();
		logger.info("total: " + cnt);
	}

}

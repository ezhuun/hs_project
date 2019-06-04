package sprring.model.d_day;

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

import spring.mapper.hs.D_dayMapperInter;
import spring.model.d_day.D_dayDTO;


@WebAppConfiguration
@RunWith(SpringJUnit4ClassRunner.class)
//@ContextConfiguration(locations = { "file:src/main/webapp/WEB-INF/spring/**/*.xml"})
@ContextConfiguration(locations = { "file:src/main/webapp/WEB-INF/spring/root-context.xml", 
		"file:src/main/webapp/WEB-INF/spring/appServlet/servlet-context.xml",
		"file:src/main/webapp/WEB-INF/spring/spring-security.xml"
		})
public class D_dayInterTest {
	private static final Logger logger = LoggerFactory.getLogger(D_dayInterTest.class);
	
	@Autowired
	private D_dayMapperInter inter;
	
	@Test
	@Ignore
	public void testMapper() {
		logger.info("mapper : " + inter.getClass().getName());
	}
	
	@Test
	@Ignore
	public void testCreate() {
		D_dayDTO dto = new D_dayDTO();
		dto.setTitle("100일");
		dto.setRegdate("2019-08-08");
		dto.setUuid("uuid");
		
		assertTrue(inter.create(dto)>0);
	}
	
	@Test
	@Ignore
	public void testUpdate() {
		D_dayDTO dto = new D_dayDTO();
		dto.setTitle("변경 기념일");
		dto.setRegdate("2019=10=10");
		dto.setD_num(2);
		
		assertTrue(inter.update(dto)>0);
	}
	
	@Test
	@Ignore
	public void testDelete() {
		int d_num = 1;
		assertTrue(inter.delete(d_num)>0);
	}
	
	@Test
	@Ignore
	public void testList() {
		Map map = new HashMap();
		map.put("d_num", 2);
		map.put("sno", 1);
		map.put("eno", 5);
		
		List<D_dayDTO> list = inter.list(map);

		logger.info("list: " + list);
	}
	
	@Test
	@Ignore
	public void testTotal() {
		int d_num = 1;
		int cnt = inter.total(d_num);
		logger.info("total: " + cnt);
	}
}

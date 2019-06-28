package spring.model.clist;


import static org.junit.Assert.assertTrue;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.web.WebAppConfiguration;

import jdk.nashorn.internal.ir.annotations.Ignore;
import spring.mapper.hs.ClistMapperInter;

@WebAppConfiguration
@RunWith(SpringJUnit4ClassRunner.class)
//@ContextConfiguration(locations = { "file:src/main/webapp/WEB-INF/spring/**/*.xml"})
@ContextConfiguration(locations = { "file:src/main/webapp/WEB-INF/spring/root-context.xml",
		"file:src/main/webapp/WEB-INF/spring/appServlet/servlet-context.xml",
		"file:src/main/webapp/WEB-INF/spring/spring-security.xml" })

public class ClistInterTest {

	private static final Logger logger = LoggerFactory.getLogger(ClistInterTest.class);

	@Autowired
	private ClistMapperInter inter;

	@Test
	@Ignore
	public void testmapper() {

		logger.info("mapper:" + inter.getClass().getName());
	}

	@Test
	@Ignore
	public void testcreate() {
		ClistDTO dto=new ClistDTO();
		dto.setC_num(2);
		dto.setUuid("user1");
		dto.setTitle("얍");
		dto.setC_code("00000004");

		assertTrue(inter.create(dto)>0);
	}
	
	@Test
	@Ignore
	public void testread() {
	
		ClistDTO dto=new ClistDTO();
		dto.setC_num(1);
		logger.info("mapper:" + inter.getClass().getName());
	}
	
	@Test
	@Ignore
	public void testupdate() {
		
		ClistDTO dto=new ClistDTO();
		Map map = new HashMap();
		map.put("c_num", 1);
		map.put("checked", 1);
		
		inter.update(map);
//		logger.info("mapper:" + inter.getClass().getName());
	}
	
	@Test
	@Ignore
	public void testdelete() {
		
		int c_num=0;
				
		assertTrue(inter.delete(c_num)>0);
//		logger.info("mapper:" + inter.getClass().getName());
	}
	
	@Test 
	@Ignore
	public void testlist() {
		
		Map map=new HashMap();
		map.put("sno",1);
		map.put("eno",5);
				
		List<ClistDTO> list = inter.list(map);
		
		logger.info("list:"+list);
	}
	@Test 
	//@Ignore
	public void testTotal() {
		
		Map map=new HashMap();
		map.put("col", "title");
		//map.put("col", "content");
		map.put("word", "이얍");
		
		int total=inter.total(map);
		
		logger.info("total:"+total);
			}
	
	
	
}

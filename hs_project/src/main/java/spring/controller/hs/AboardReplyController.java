package spring.controller.hs;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import spring.mapper.hs.AboardReplyMapperInter;
import spring.model.aboardReply.AboardReplyDTO;
import spring.utility.hs.Utility;

@RestController
public class AboardReplyController {
	
	private static final Logger log = LoggerFactory.getLogger(AboardReplyController.class);
	
	@Autowired
	private AboardReplyMapperInter arinter;
	
	@PutMapping("/aboard/aboardreply/{r_num}")
	public ResponseEntity<String> modify( @RequestBody AboardReplyDTO vo, @PathVariable("r_num") int r_num) {
	 		
		log.info("r_num: " + r_num);
		log.info("modify: " + vo);
		 
		return arinter.update(vo) == 1 ? new ResponseEntity<>("success", HttpStatus.OK)
				: new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
	}
	
	 
	@DeleteMapping("/aboard/aboardreply/{r_num}") 
	public ResponseEntity<String> remove(@PathVariable("r_num") int r_num) {
	 
		log.info("remove: " + r_num);
	 
		return arinter.delete(r_num) == 1 ? new ResponseEntity<>("success", HttpStatus.OK)
				: new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
	}	
		
	
	@GetMapping("/aboard/aboardreply/{r_num}")
	public ResponseEntity<AboardReplyDTO> get(@PathVariable("r_num") int r_num) {
	 
		log.info("get: " + r_num);
	 
		return new ResponseEntity<>(arinter.read(r_num), HttpStatus.OK);
	}
	
	
	@GetMapping("/aboard/aboardreply/page")
	public ResponseEntity<String> getPage(@RequestParam("nPage") int nPage, @RequestParam("nowPage") int nowPage,
		@RequestParam("a_num") int a_num, @RequestParam("col") String col, @RequestParam("word") String word){
	 
		int total = arinter.total(a_num);
		String url = "read";
	 
		int recordPerPage = 3; // 한페이지당 출력할 레코드 갯수
		String fk = "a_num=";
	
		String paging = Utility.rpaging(total, nowPage, recordPerPage, col, word, url, nPage,fk, a_num);
	 
		return new ResponseEntity<>(paging, HttpStatus.OK);
	 
	}
	
	
	
	@GetMapping("/aboard/aboardreply/list/{a_num}/{sno}/{eno}")//요청uri
	public ResponseEntity<List<AboardReplyDTO>> getList (@PathVariable("a_num") int imgno,
			@PathVariable("sno") int sno, @PathVariable("eno") int eno) {	 
	 
		Map map = new HashMap();
		map.put("sno", sno);
		map.put("eno", eno);
		map.put("imgno", imgno);
		 
	 
		return new ResponseEntity<List<AboardReplyDTO>>(arinter.list(map), HttpStatus.OK);
	
	}	
			

	@PostMapping("/aboard/aboardreply/create")
	public ResponseEntity<String> create(@RequestBody AboardReplyDTO vo){
	//@RequestBody를 쓰면 json형식으로 온 데이터를 IreplyDTO타입 파라메터로 변환해서 받을 수 있음.
		
		//타입이 변경된 데이터가 제대로 들어왔는지 확인
		log.info("AboardReplyDTO1: " + vo.getContent());
		log.info("AboardReplyDTO1: " + vo.getUuid());
		log.info("AboardReplyDTO1: " + vo.getA_num());
		
		vo.setContent(vo.getContent().replaceAll("/n/r", "<br>"));
		
		int flag = arinter.create(vo);
		
		log.info("Reply INSERT flag: "+flag);
		
		return flag == 1? new ResponseEntity<>("success",HttpStatus.OK)
							: new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
			
			
			
	}
	
}

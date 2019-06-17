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

import spring.mapper.hs.DiaryReplyMapperInter;
import spring.model.diary.DiaryDTO;
import spring.model.diary.DiaryReplyDTO;
import spring.utility.hs.Utility;

//ajax요청처리, js파일(ajax)에서 요청url과 일치한곳에 매핑
@RestController
public class DiaryReplyController {

	private static final Logger log = LoggerFactory.getLogger(DiaryReplyController.class);
	
	@Autowired 
	DiaryReplyMapperInter drinter;
	
	
	//ResponseEntity:첫 번째 값이 responsebody(String타입), 두 번째 값이 상태코드
	//@RequestBody : js에서 넘겨온 데이터는 JSON형식 @RequestBody을 이용하여  Java Object로 변환하고 값을 넣어주기 때문에 setter가 없어도 값이 저장됨(https://jojoldu.tistory.com/407)
	//Create
	@PostMapping("/diary/reply/create")
	public ResponseEntity<String> create(@RequestBody DiaryReplyDTO drdto){ 
		System.out.println(drdto+"~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~");
		log.info("DiaryReplyDTO: "+drdto.getContent());
		drdto.setContent(drdto.getContent().replaceAll("/n/r", "<br>"));
		
		int flag = drinter.create(drdto);
		
		return flag ==1 ? new ResponseEntity<>("success",HttpStatus.OK):new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
	}
	
	//@PathVariable : URL 경로에 변수를 넣어줌
	//Read
	@GetMapping("/diary/reply/{r_num}")
	public ResponseEntity<DiaryReplyDTO> get(@PathVariable("r_num")int r_num){
		
		return new ResponseEntity<>(drinter.read(r_num),HttpStatus.OK);
		
	}
	
	//Update
	@PutMapping("/diary/reply/{r_num}")
	public ResponseEntity<String> update(@RequestBody DiaryReplyDTO drdto,@PathVariable("r_num")int r_num){
		
		int flag = drinter.update(drdto);
		return flag==1 ? new ResponseEntity<>("success",HttpStatus.OK) : new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
	}
	
	//Delete
	@DeleteMapping("/diary/reply/{r_num}")
	public ResponseEntity<String> delete(@PathVariable("r_num")int r_num){
		int flag = drinter.delete(r_num);
		return flag==1 ? new ResponseEntity<>("success",HttpStatus.OK) : new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
	}
	
	//list
	@GetMapping("/diary/reply/list/{diary_num}/{sno}/{eno}")
	public ResponseEntity<List<DiaryReplyDTO>> list(@PathVariable("diary_num")int diary_num,
												@PathVariable("sno") int sno,
												@PathVariable("eno") int eno){
		Map map = new HashMap();
		map.put("sno", sno);
		map.put("eno", eno);
		map.put("diary_num", diary_num);
		System.out.println("=====================");
		System.out.println(map);
		List<DiaryReplyDTO> list = drinter.mdrJoinList(map);
		System.out.println("=====================");
		System.out.println(list);
		return new ResponseEntity<List<DiaryReplyDTO>>(list,HttpStatus.OK);
				
	}
	
	//paging(댓글 목록 페이징)
	@GetMapping("/diary/reply/page")
	public ResponseEntity<String> page(@RequestParam("nPage")int nPage,
										@RequestParam(value="nowPage",required = true, defaultValue="1")int nowPage,
										@RequestParam("diary_num")int diary_num){
		int total = drinter.total(diary_num);
		String url = "read";
		int recordPerPage = 5;
		
		String paging = Utility.drpaging(total, nowPage, recordPerPage, url, nPage, diary_num);
		
		return new ResponseEntity<>(paging,HttpStatus.OK);
	}
}

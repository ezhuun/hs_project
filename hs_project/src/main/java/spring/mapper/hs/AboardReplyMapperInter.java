package spring.mapper.hs;

import java.util.List;
import java.util.Map;

import spring.model.aboardReply.AboardReplyDTO;

public interface AboardReplyMapperInter {
	
	
	List<AboardReplyDTO> list(Map map);
	int create(AboardReplyDTO dto);
	AboardReplyDTO read(int r_num);
	int update(AboardReplyDTO dto);
	int delete(int r_num);
	int total(int r_num);
	

}

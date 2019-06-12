package spring.mapper.hs;

import java.util.List;
import java.util.Map;

import spring.model.aboard.AboardDTO;

public interface AboardMapperInter {


	List<AboardDTO> list (Map map);
	int create(AboardDTO dto);
	AboardDTO read(int a_num);
	int update(AboardDTO dto);
	int delete(int a_num);
	int total(Map map);
	int upViewcnt(int a_num);
	List<AboardDTO> notice_list(Map map);
	
}

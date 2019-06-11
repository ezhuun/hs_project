package spring.mapper.hs;

import java.util.List;
import java.util.Map;

import spring.model.clist.ClistDTO;

public interface ClistMapperInter {

	int create(ClistDTO dto);
	ClistDTO read(int c_num);
	int delete(int c_num);
	List<ClistDTO> list(Map map);
	int total(Map map);
	void update(Map map);
	
}

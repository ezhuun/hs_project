package spring.mapper.hs;

import java.util.List;
import java.util.Map;

import spring.model.d_day.D_dayDTO;

public interface D_dayMapperInter {
	int create(D_dayDTO dto);
	D_dayDTO read (int d_num);
	int delete(int d_num);
	int update(D_dayDTO dto);
	List<D_dayDTO> list(Map map);
	int total(Map map);
}

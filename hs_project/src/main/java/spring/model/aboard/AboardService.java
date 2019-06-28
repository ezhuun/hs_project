package spring.model.aboard;

import java.util.List;
import java.util.Map;

public interface AboardService {
	
	void delete(int a_num) throws Exception;
	void update(AboardDTO dto) throws Exception;
	AboardDTO read(int a_num) throws Exception;
	void upViewcnt(int a_num) throws Exception;
	void create(AboardDTO dto) throws Exception;
	int total(Map map) throws Exception;
	List<AboardDTO> list(Map map) throws Exception;
	List<AboardDTO> notice_list(Map map) throws Exception;
	
}

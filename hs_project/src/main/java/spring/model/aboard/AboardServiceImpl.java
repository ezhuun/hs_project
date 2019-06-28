package spring.model.aboard;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import spring.mapper.hs.AboardMapperInter;
import spring.mapper.hs.AboardReplyMapperInter;

@Service
public class AboardServiceImpl implements AboardService {
	
	
	
	@Autowired
	private AboardMapperInter ainter;
	
	@Autowired
	private AboardReplyMapperInter arinter;
	
	@Override
	public void delete(int a_num) throws Exception{
		arinter.adelete(a_num);
		ainter.delete(a_num);
	}
	
	@Override
	public void update(AboardDTO dto) throws Exception{		
		ainter.update(dto);			
	}

	@Override
	public void upViewcnt(int a_num) throws Exception{
		ainter.upViewcnt(a_num);
	}
	
	@Override
	public AboardDTO read(int a_num) throws Exception{
		return ainter.read(a_num);
	}
	
	@Override
	public void create(AboardDTO dto) throws Exception{
		ainter.create(dto);
	}
	
	@Override
	public int total(Map map) throws Exception{
		return ainter.total(map);
	}
	
	
	@Override
	public List<AboardDTO> list(Map map) throws Exception{
		return ainter.list(map);		
	}
	
	@Override
	public List<AboardDTO> notice_list(Map map) throws Exception{
		return ainter.notice_list(map);		
	}
	
}

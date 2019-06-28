package spring.model.aboard;

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
	

	
	
	

}

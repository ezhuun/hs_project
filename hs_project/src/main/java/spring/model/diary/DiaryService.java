package spring.model.diary;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import spring.mapper.hs.DiaryMapperInter;
import spring.mapper.hs.DiaryReplyMapperInter;

@Service
public class DiaryService {
	@Autowired
	private DiaryMapperInter diaryinter;
	
	@Autowired 
	private DiaryReplyMapperInter drinter;
	
	public void delete(int diary_num) throws Exception{
		
		drinter.deleteall(diary_num);
		diaryinter.delete(diary_num);
		
	}
}

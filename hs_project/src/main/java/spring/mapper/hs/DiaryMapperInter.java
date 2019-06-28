package spring.mapper.hs;

import java.util.List;
import java.util.Map;

import spring.model.diary.DiaryDTO;

public interface DiaryMapperInter {
	
	int create (DiaryDTO diarydto);
	DiaryDTO read(int diary_num);
	int update(DiaryDTO diarydto);
	int delete(int diary_num);
	List<DiaryDTO> list(Map map);
	int total();
	List<DiaryDTO> mdJoinList(Map map);
}

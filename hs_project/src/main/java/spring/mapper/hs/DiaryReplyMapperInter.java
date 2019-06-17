package spring.mapper.hs;

import java.util.List;
import java.util.Map;

import spring.model.diary.DiaryReplyDTO;

public interface DiaryReplyMapperInter {
	int create(DiaryReplyDTO drdto);
	DiaryReplyDTO read(int r_num);
	int update(DiaryReplyDTO drdto);
	int delete(int r_num);
	List<DiaryReplyDTO> list(Map map);
	int total(int diary_num);
	int rcount(int diary_num);
	List<DiaryReplyDTO> mdrJoinList(Map map);
}

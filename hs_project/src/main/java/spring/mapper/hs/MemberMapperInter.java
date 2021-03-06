package spring.mapper.hs;

import java.util.Date;
import java.util.List;
import java.util.Map;


import spring.model.member.MemberConnectDTO;
import spring.model.member.MemberDTO;

public interface MemberMapperInter {
	int deleteMember(String uuid);
	int deleteCode(String code);
	int clearCcode(String uuid);
	int deleteMemberConnectU2(String code);
	int changeMemberConnectUUID(String code);
	int tempCodeChange(String uuid);
	int disabledCode(String temp_code);
	int disconnectMember(Map<String, String> _map);
	int disconnectMemberConnect(Map<String, Object> map);
	int changePasswd(Map<String, String> map);
	String getCcodebyUuid(String uuid);
	MemberDTO checkMemberWithSessionKey(String session_key);
	int keepLogin(Map<String, Object> map);
	MemberDTO getConnectedAccount(String uuid);
	int lastLoginUpdate(String uuid);
	int updateProfile(MemberDTO dto);
	int updatePhoto(Map<String, String> map);
	MemberDTO getMemberByUuid(String uuid);
	MemberDTO getMemberByEmail(String email);
	int validCode(String uuid);
	int updateMemberCode(Map<String, String> map);
	int updateMemberConnectCode(Map<String, String> map);
	MemberConnectDTO getCode(String code);
	int createMember(Map<String, String> map);
	int createMemberConnect(Map<String, String> map);
	int duplicateEmail(String email);
	List<String> getAllcode();
	int changeName(Map<String, String> map);
	MemberDTO getJoinMemberByUuid(String uuid);
	void changeMemberDate(MemberDTO dto);
	List<MemberDTO> mainlist(String c_code);
}

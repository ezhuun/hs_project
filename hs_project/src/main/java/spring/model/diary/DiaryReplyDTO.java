package spring.model.diary;

public class DiaryReplyDTO {
	private int r_num               ;
    private String uuid             ;
    private String content          ;
    private int diary_num           ;
    private String regdate          ;
    
    private String name;
    private String profile;
    
	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getProfile() {
		return profile;
	}

	public void setProfile(String profile) {
		this.profile = profile;
	}

	public DiaryReplyDTO() {
		super();
		// TODO Auto-generated constructor stub
	}

	public DiaryReplyDTO(int r_num, String uuid, String content, int diary_num, String regdate) {
		super();
		this.r_num = r_num;
		this.uuid = uuid;
		this.content = content;
		this.diary_num = diary_num;
		this.regdate = regdate;
	}
	
	

	public int getR_num() {
		return r_num;
	}

	@Override
	public String toString() {
		return "DiaryReplyDTO [r_num=" + r_num + ", uuid=" + uuid + ", content=" + content + ", diary_num=" + diary_num
				+ ", regdate=" + regdate + ", name=" + name + ", profile=" + profile + "]";
	}

	public void setR_num(int r_num) {
		this.r_num = r_num;
	}

	public String getUuid() {
		return uuid;
	}

	public void setUuid(String uuid) {
		this.uuid = uuid;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public int getDiary_num() {
		return diary_num;
	}

	public void setDiary_num(int diary_num) {
		this.diary_num = diary_num;
	}

	public String getRegdate() {
		return regdate;
	}

	public void setRegdate(String regdate) {
		this.regdate = regdate;
	}
	
	
}

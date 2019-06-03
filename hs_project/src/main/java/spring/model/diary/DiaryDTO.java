package spring.model.diary;

public class DiaryDTO {
	private int diary_num     ;
    private String uuid       ;
    private String content    ;
    private String regdate    ;
    private String title      ;
    private String c_code     ;
	public DiaryDTO() {
		super();
		// TODO Auto-generated constructor stub
	}

	public DiaryDTO(int diary_num, String uuid, String content, String regdate, String title, String c_code) {
		super();
		this.diary_num = diary_num;
		this.uuid = uuid;
		this.content = content;
		this.regdate = regdate;
		this.title = title;
		this.c_code = c_code;
	}
	
	@Override
	public String toString() {
		return "DiaryDTO [diary_num=" + diary_num + ", uuid=" + uuid + ", content=" + content + ", regdate=" + regdate
				+ ", title=" + title + ", c_code=" + c_code + "]";
	}
	public int getDiary_num() {
		return diary_num;
	}

	public void setDiary_num(int diary_num) {
		this.diary_num = diary_num;
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

	public String getRegdate() {
		return regdate;
	}

	public void setRegdate(String regdate) {
		this.regdate = regdate;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getC_code() {
		return c_code;
	}

	public void setC_code(String c_code) {
		this.c_code = c_code;
	}

	
}

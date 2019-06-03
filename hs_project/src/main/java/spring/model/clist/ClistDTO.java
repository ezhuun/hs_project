package spring.model.clist;

public class ClistDTO {

	private int c_num;
	private String uuid;
	private String title;
	private String content;
	private String regdate;
	private String c_code;

	
	
	public ClistDTO() {
		super();
		// TODO Auto-generated constructor stub
	}


	public ClistDTO(int c_num, String uuid, String title, String content, String regdate, String c_code) {
		super();
		this.c_num = c_num;
		this.uuid = uuid;
		this.title = title;
		this.content = content;
		this.regdate = regdate;
		this.c_code = c_code;
	}


	@Override
	public String toString() {
		return "ClistDTO [c_num=" + c_num + ", uuid=" + uuid + ", title=" + title + ", content=" + content
				+ ", regdate=" + regdate + ", c_code=" + c_code + "]";
	}
	
	
	public int getC_num() {
		return c_num;
	}
	public void setC_num(int c_num) {
		this.c_num = c_num;
	}
	public String getUuid() {
		return uuid;
	}
	public void setUuid(String uuid) {
		this.uuid = uuid;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
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
	public String getC_code() {
		return c_code;
	}
	public void setC_code(String c_code) {
		this.c_code = c_code;
	}
	
		
}

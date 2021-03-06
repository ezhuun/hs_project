package spring.model.aboard;

public class AboardDTO {
	private int a_num;
	private String title;
	private String regdate;
	private String content;
	private String uuid;
	private String a_name;
	private int viewcnt;
	
	public AboardDTO() {
		super();
		// TODO Auto-generated constructor stub
	}

	public AboardDTO(int a_num, String title, String regdate, String content, String uuid, String a_name, int viewcnt) {
		super();
		this.a_num = a_num;
		this.title = title;
		this.regdate = regdate;
		this.content = content;
		this.uuid = uuid;
		this.a_name = a_name;
		this.viewcnt = viewcnt;
	}

	@Override
	public String toString() {
		return "AboardDTO [a_num=" + a_num + ", title=" + title + ", regdate=" + regdate + ", content=" + content
				+ ", uuid=" + uuid + ", a_name=" + a_name + ", viewcnt=" + viewcnt + "]";
	}

	public int getA_num() {
		return a_num;
	}

	public void setA_num(int a_num) {
		this.a_num = a_num;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getRegdate() {
		return regdate;
	}

	public void setRegdate(String regdate) {
		this.regdate = regdate;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public String getUuid() {
		return uuid;
	}

	public void setUuid(String uuid) {
		this.uuid = uuid;
	}

	public String getA_name() {
		return a_name;
	}

	public void setA_name(String a_name) {
		this.a_name = a_name;
	}

	public int getViewcnt() {
		return viewcnt;
	}

	public void setViewcnt(int viewcnt) {
		this.viewcnt = viewcnt;
	}
	
	
		
	

}

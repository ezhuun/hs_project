package spring.model.aboard;

public class AboardReplyDTO {

	private int r_num;
	private String r_name;
	private String regdate;
	private String content;
	private String uuid;
	private int a_num;

	
	public AboardReplyDTO() {
		super();
		// TODO Auto-generated constructor stub
	}

	public AboardReplyDTO(int r_num, String r_name, String regdate, String content, String uuid, int a_num) {
		super();
		this.r_num = r_num;
		this.r_name = r_name;
		this.regdate = regdate;
		this.content = content;
		this.uuid = uuid;
		this.a_num = a_num;
	}

		
	@Override
	public String toString() {
		return "AboardReplyDTO [r_num=" + r_num + ", r_name=" + r_name + ", regdate=" + regdate + ", content=" + content
				+ ", uuid=" + uuid + ", a_num=" + a_num + "]";
	}

	public int getR_num() {
		return r_num;
	}

	public void setR_num(int r_num) {
		this.r_num = r_num;
	}

	public String getR_name() {
		return r_name;
	}

	public void setR_name(String r_name) {
		this.r_name = r_name;
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

	public int getA_num() {
		return a_num;
	}

	public void setA_num(int a_num) {
		this.a_num = a_num;
	}


	
	
	
}

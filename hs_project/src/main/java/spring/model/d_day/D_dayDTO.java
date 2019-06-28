package spring.model.d_day;

public class D_dayDTO {
	private int d_num;
	private String d_date;
    private String regdate;
    private String title;
    private String uuid;
    
	public D_dayDTO() {
		super();
		// TODO Auto-generated constructor stub
	}

	public D_dayDTO(int d_num, String d_date, String regdate, String title, String uuid) {
		super();
		this.d_num = d_num;
		this.d_date = d_date;
		this.regdate = regdate;
		this.title = title;
		this.uuid = uuid;
	}

	@Override
	public String toString() {
		return "D_dayDTO [d_num=" + d_num + ", d_date=" + d_date + ", regdate=" + regdate + ", title=" + title
				+ ", uuid=" + uuid + "]";
	}

	public int getD_num() {
		return d_num;
	}

	public void setD_num(int d_num) {
		this.d_num = d_num;
	}

	public String getD_date() {
		return d_date;
	}

	public void setD_date(String d_date) {
		this.d_date = d_date;
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

	public String getUuid() {
		return uuid;
	}

	public void setUuid(String uuid) {
		this.uuid = uuid;
	}
}

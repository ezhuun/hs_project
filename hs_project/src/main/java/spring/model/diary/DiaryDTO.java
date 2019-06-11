package spring.model.diary;

import org.springframework.web.multipart.MultipartFile;

public class DiaryDTO {
	private int diary_num     ;
    private String uuid       ;
    private String content    ;
    private String regdate    ;
    private String title      ;
    private String c_code     ;
    private String d_date	  ;
    private String  filename; // 파일명  
    private int    filesize; // 파일 사이즈 
    private MultipartFile filenameMF; 
    
    public String getFilename() {
		return filename;
	}


	public void setFilename(String filename) {
		this.filename = filename;
	}


	public int getFilesize() {
		return filesize;
	}


	public void setFilesize(int filesize) {
		this.filesize = filesize;
	}


	public MultipartFile getFilenameMF() {
		return filenameMF;
	}


	public void setFilenameMF(MultipartFile filenameMF) {
		this.filenameMF = filenameMF;
	}

	
    
    public DiaryDTO() {
		super();
		// TODO Auto-generated constructor stub
	}

	
	public String getD_date() {
		return d_date;
	}


	public void setD_date(String d_date) {
		this.d_date = d_date;
	}


	


	@Override
	public String toString() {
		return "DiaryDTO [diary_num=" + diary_num + ", uuid=" + uuid + ", content=" + content + ", regdate=" + regdate
				+ ", title=" + title + ", c_code=" + c_code + ", d_date=" + d_date + ", filename=" + filename
				+ ", filesize=" + filesize + ", filenameMF=" + filenameMF + "]";
	}


	public DiaryDTO(int diary_num, String uuid, String content, String regdate, String title, String c_code,
			String d_date, String filename, int filesize, MultipartFile filenameMF) {
		super();
		this.diary_num = diary_num;
		this.uuid = uuid;
		this.content = content;
		this.regdate = regdate;
		this.title = title;
		this.c_code = c_code;
		this.d_date = d_date;
		this.filename = filename;
		this.filesize = filesize;
		this.filenameMF = filenameMF;
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

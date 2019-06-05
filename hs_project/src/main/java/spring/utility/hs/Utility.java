package spring.utility.hs;

import java.io.File;
import java.io.FileOutputStream;
import java.io.InputStream;
import java.io.OutputStream;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.List;
import java.util.UUID;

import org.springframework.web.multipart.MultipartFile;

public class Utility {
	
	public static long validDiffTime(String timestamp) {
		long diffDays = 0;

		SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		
		Date d_limit = null;
		Date now = null;
		try {
			d_limit = dateFormat.parse(timestamp);
			now = new Date();
			long diff = now.getTime() - d_limit.getTime();
			diffDays = diff / (24 * 60 * 60 * 1000);
		} catch (ParseException e) {e.printStackTrace();}
		
		return diffDays;
	}
	
	
	public static String saveFileSpring(MultipartFile multipartFile, String basePath) {
		// input form's parameter name
		String fileName = "";
		// original file name
		String originalFileName = multipartFile.getOriginalFilename();
		// file content type
		//String contentType = multipartFile.getContentType();
		// file size
		long fileSize = multipartFile.getSize();

		System.out.println("fileSize: " + fileSize);
		System.out.println("originalFileName: " + originalFileName);

		InputStream inputStream = null;
		OutputStream outputStream = null;

		try {
			if (fileSize > 0) { // 파일이 존재한다면
				// 인풋 스트림을 얻는다.
				inputStream = multipartFile.getInputStream();

				File oldfile = new File(basePath, originalFileName);

				if (oldfile.exists()) {
					for (int k = 0; true; k++) {
						// 파일명 중복을 피하기 위한 일련 번호를 생성하여
						// 파일명으로 조합
						oldfile = new File(basePath, "(" + k + ")" + originalFileName);

						// 조합된 파일명이 존재하지 않는다면, 일련번호가
						// 붙은 파일명 다시 생성
						if (!oldfile.exists()) { // 존재하지 않는 경우
							fileName = "(" + k + ")" + originalFileName;
							break;
						}
					}
				} else {
					fileName = originalFileName;
				}
				// make server full path to save
				String serverFullPath = basePath + "\\" + fileName;

				System.out.println("fileName: " + fileName);
				System.out.println("serverFullPath: " + serverFullPath);

				outputStream = new FileOutputStream(serverFullPath);

				// 버퍼를 만든다.
				int readBytes = 0;
				byte[] buffer = new byte[8192];

				while ((readBytes = inputStream.read(buffer, 0, 8192)) != -1) {
					outputStream.write(buffer, 0, readBytes);
				}
				outputStream.close();
				inputStream.close();

			}

		} catch (Exception e) {
			e.printStackTrace();
		} finally {

		}

		return fileName;
	}

	public static void deleteFile(String upDir, String oldfile) {
		File file = new File(upDir, oldfile);

		if (file.exists()) {
			file.delete();
		}
	}

	public static String checkNull(String str) {
		if (str == null) {
			str = "";
		}

		return str;
	}

	/**
	 * 오늘,어제,그제 날짜 가져오기
	 * 
	 * @return List- 날짜들 저장
	 */
	public static List<String> getDay() {
		List<String> list = new ArrayList<String>();

		SimpleDateFormat sd = new SimpleDateFormat("yyyy-MM-dd");
		Calendar cal = Calendar.getInstance();
		for (int j = 0; j < 3; j++) {
			list.add(sd.format(cal.getTime()));
			cal.add(Calendar.DATE, -1);
		}

		return list;
	}

	/**
	 * 등록날짜와 오늘,어제,그제날짜와 비교
	 * 
	 * @param wdate - 등록날짜
	 * @return - true:오늘,어제,그제중 등록날짜와 같음 false:오늘,어제,그제 날짜가 등록날짜와 다 다름
	 */
	public static boolean compareDay(String wdate) {
		boolean flag = false;
		List<String> list = getDay();
		if (wdate.equals(list.get(0)) || wdate.equals(list.get(1)) || wdate.equals(list.get(2))) {
			flag = true;
		}

		return flag;
	}

	public static String getUuid() {
		return UUID.randomUUID().toString().replaceAll("-", "");
	}

	public static String randomKey(List<String> list, int len) {
		String key = null;
		StringBuffer temp = new StringBuffer();
		temp.append("1");
		for (int i = 0; i < len; i++) {
			temp.append("0");
		}
		int end = (Integer.parseInt(temp.toString())) - 1;

		boolean flag = true;
		while (flag) {
			flag = false;
			int random = (int) (Math.random() * (end - 1 + 1)) + 1;
			key = String.format("%0" + len + "d", random);

			for (int i = 0; i < list.size(); i++) {
				if (list.get(i) == key)
					flag = true;
			}
		}
		return key;
	}
	
	public static String paging(int totalRecord, int nowPage, int recordPerPage, 
			String col, String word, String url){ 
		   int pagePerBlock = 5; // 블럭당 페이지 수 
		   int totalPage = (int)(Math.ceil((double)totalRecord/recordPerPage)); // 전체 페이지  
		   int totalGrp = (int)(Math.ceil((double)totalPage/pagePerBlock));// 전체 그룹 
		   int nowGrp = (int)(Math.ceil((double)nowPage/pagePerBlock));    // 현재 그룹 
		   int startPage = ((nowGrp - 1) * pagePerBlock) + 1; // 특정 그룹의 페이지 목록 시작  
		   int endPage = (nowGrp * pagePerBlock);             // 특정 그룹의 페이지 목록 종료   
		    
		   StringBuffer str = new StringBuffer(); 
		   str.append("<div style='text-align:center'>"); 
		   str.append("<ul class='pagination'> ");
		   int _nowPage = (nowGrp-1) * pagePerBlock; // 10개 이전 페이지로 이동 
		   if (nowGrp >= 2){ 
		     str.append("<li><a href='"+url+"?col="+col+"&word="+word+"&nowPage="+_nowPage+"'>이전</A></li>"); 
		   } 
		 
		   for(int i=startPage; i<=endPage; i++){ 
		     if (i > totalPage){ 
		       break; 
		     } 
		 
		     if (nowPage == i){ 
		       str.append("<li class='active'><a href=#>"+i+"</a></li>"); 
		     }else{ 
		       str.append("<li><a href='"+url+"?col="+col+"&word="+word+"&nowPage="+i+"'>"+i+"</A></li>");   
		     } 
		   } 
		       
		   _nowPage = (nowGrp * pagePerBlock)+1; // 10개 다음 페이지로 이동 
		   if (nowGrp < totalGrp){ 
		     str.append("<li><A href='"+url+"?col="+col+"&word="+word+"&nowPage="+_nowPage+"'>다음</A></li>"); 
		   } 
		   str.append("</ul>"); 
		   str.append("</div>"); 
		    
		   return str.toString(); 
		} 

}

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

import spring.mapper.hs.DiaryReplyMapperInter;

public class Utility {

	public static String paging(int totalRecord, int nowPage, int recordPerPage, String col, String word, String url) {
		int pagePerBlock = 5; // 블럭당 페이지 수
		int totalPage = (int) (Math.ceil((double) totalRecord / recordPerPage)); // 전체 페이지
		// ceil: 반올림 역할
		int totalGrp = (int) (Math.ceil((double) totalPage / pagePerBlock));// 전체 그룹
		int nowGrp = (int) (Math.ceil((double) nowPage / pagePerBlock)); // 현재 그룹

		int startPage = ((nowGrp - 1) * pagePerBlock) + 1; // 특정 그룹의 페이지 목록 시작
		// startPage = ((현재 보여지는 그룹 -1) * 5)+1
		// => 처음 보이는 그룹은 1부터 시작한다는 의미, 2번째 그룹(다음으로보이는 그룹)은 번호 부터 보이는것.

		int endPage = (nowGrp * pagePerBlock); // 특정 그룹의 페이지 목록 종료

		StringBuffer str = new StringBuffer();
		str.append("<div style='text-align:center'>");
		str.append("<ul class='pagination'> ");
		// 스타일 지정 'pagination'
		int _nowPage = (nowGrp - 1) * pagePerBlock; // 10개 이전 페이지로 이동
		if (nowGrp >= 2) {
			str.append(
					"<li><a href='" + url + "?col=" + col + "&word=" + word + "&nowPage=" + _nowPage + "'>이전</A></li>");
		}

		for (int i = startPage; i <= endPage; i++) {
			if (i > totalPage) {
				break;
			}

			if (nowPage == i) {
				str.append("<li class='active'><a href=#>" + i + "</a></li>");
			} else {
				str.append("<li><a href='" + url + "?col=" + col + "&word=" + word + "&nowPage=" + i + "'>" + i
						+ "</A></li>");
			}
		}

		_nowPage = (nowGrp * pagePerBlock) + 1; // 10개 다음 페이지로 이동
		if (nowGrp < totalGrp) {
			str.append(
					"<li><A href='" + url + "?col=" + col + "&word=" + word + "&nowPage=" + _nowPage + "'>다음</A></li>");
		}
		str.append("</ul>");
		str.append("</div>");

		return str.toString();
	}

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
		} catch (ParseException e) {
			e.printStackTrace();
		}

		return diffDays;
	}

	public static String saveFileSpring(MultipartFile multipartFile, String basePath) {
		// input form's parameter name
		String fileName = "";
		// original file name
		String originalFileName = multipartFile.getOriginalFilename();
		// file content type
		// String contentType = multipartFile.getContentType();
		// file size
		long fileSize = multipartFile.getSize();

		System.out.println("fileSize: " + fileSize);
		System.out.println("originalFileName: " + originalFileName);

		InputStream inputStream = null;
		OutputStream outputStream = null;

		try {
			if (fileSize > 0) { // �뙆�씪�씠 議댁옱�븳�떎硫�
				// �씤�뭼 �뒪�듃由쇱쓣 �뼸�뒗�떎.
				inputStream = multipartFile.getInputStream();

				File oldfile = new File(basePath, originalFileName);

				if (oldfile.exists()) {
					for (int k = 0; true; k++) {
						// �뙆�씪紐� 以묐났�쓣 �뵾�븯湲� �쐞�븳 �씪�젴 踰덊샇瑜� �깮�꽦�븯�뿬
						// �뙆�씪紐낆쑝濡� 議고빀
						oldfile = new File(basePath, "(" + k + ")" + originalFileName);

						// 議고빀�맂 �뙆�씪紐낆씠 議댁옱�븯吏� �븡�뒗�떎硫�, �씪�젴踰덊샇媛�
						// 遺숈� �뙆�씪紐� �떎�떆 �깮�꽦
						if (!oldfile.exists()) { // 議댁옱�븯吏� �븡�뒗 寃쎌슦
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

				// 踰꾪띁瑜� 留뚮뱺�떎.
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
	 * �삤�뒛,�뼱�젣,洹몄젣 �궇吏� 媛��졇�삤湲�
	 *
	 * @return List- �궇吏쒕뱾 ���옣
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
	 * �벑濡앸궇吏쒖� �삤�뒛,�뼱�젣,洹몄젣�궇吏쒖� 鍮꾧탳
	 *
	 * @param wdate - �벑濡앸궇吏�
	 * @return - true:�삤�뒛,�뼱�젣,洹몄젣以� �벑濡앸궇吏쒖� 媛숈쓬 false:�삤�뒛,�뼱�젣,洹몄젣 �궇吏쒓�
	 *         �벑濡앸궇吏쒖� �떎 �떎由�
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

	/**
	 *
	 * @param totalRecord   �쟾泥� �젅肄붾뱶�닔
	 * @param nowPage       �쁽�옱 �럹�씠吏�
	 * @param recordPerPage �럹�씠吏��떦 �젅肄붾뱶 �닔
	 * @param col           寃��깋 而щ읆
	 * @param word          寃��깋�뼱
	 * @return �럹�씠吏� �깮�꽦 臾몄옄�뿴
	 */

	public static String diarypaging(int totalRecord, int nowPage, int recordPerPage, String url) {

		int pagePerBlock = 5; // 釉붾윮�떦 �럹�씠吏� �닔 , rownum�쓣 �븳踰덉뿉 紐뉕컻源뚯� 蹂댁뿬以꾧굔吏�(1~5媛� �굹�삤怨� �떎�쓬�쓣 �닃�윭�빞
								// 6~10�씠 �굹�샂)
		int totalPage = (int) (Math.ceil((double) totalRecord / recordPerPage)); // �쟾泥� �럹�씠吏� = �쟾泥대젅肄붾뱶/�럹�씠吏� �떦
																					// 蹂댁뿬以� �젅肄붾뱶,
																					// �븞�굹�늻�뼱�뼥�뼱吏�硫� �삱由쇱쑝濡� �븿(ceil)
		int totalGrp = (int) (Math.ceil((double) totalPage / pagePerBlock));// �쟾泥� 洹몃９ �쟾泥댄럹�씠吏�/�븳�럹�씠吏��떦 蹂댁뿬以�
																			// rownum ,�븞�굹�늻�뼱 �뼥�뼱�졇�룄
																			// �삱由� 123 456 78 (3釉붾윮)
		int nowGrp = (int) (Math.ceil((double) nowPage / pagePerBlock)); // �쁽�옱 洹몃９ �쁽�옱�럹�씠吏�/�븳�럹�씠�떦蹂댁뿬以� rounum,
																			// 2�럹�씠吏�/3釉붾윮 = 1踰덉㎏
																			// 釉붾윮�뿉 �엳�쓬(�삱由�) 6�럹�씠吏�/2釉붾윮 = 3
		int startPage = ((nowGrp - 1) * pagePerBlock) + 1; // �듅�젙 洹몃９�쓽 �럹�씠吏� 紐⑸줉 �떆�옉
		int endPage = (nowGrp * pagePerBlock); // �듅�젙 洹몃９�쓽 �럹�씠吏� 紐⑸줉 醫낅즺

		StringBuffer str = new StringBuffer();
		str.append("<div style='text-align:center'>");
		str.append("<ul class='pagination'> ");// �럹�씠吏��븯�떒 踰덊샇�쓽 紐⑥뼇�쓣 �궗媛곹삎�쑝濡� 吏��젙

		int _nowPage = (nowGrp - 1) * pagePerBlock; // 10媛� �씠�쟾 �럹�씠吏�濡� �씠�룞 pagePerBlock=5�씪�븣 1洹몃９�� 1~5�쓽 rownum�쓣
													// 媛�吏�,
		// 2洹몃９(6~10)-1 * 5 = 5 = > 2洹몃９�뿉�꽌 �씠�쟾�쓣 �닃���쓣�븣 �씠�룞�븯�뒗怨�(�쁽�옱洹몃９�뿉�꽌
		// �씠�쟾洹몃９�쓽 留� 留덉�留� �럹�씠吏�瑜� 媛�由ы궡)
		if (nowGrp >= 2) { // �궡媛� 蹂닿퀬 �엳�뒗 洹몃９�씠 2洹몃９�씠硫�(6~10)
			str.append("<li><a href='" + url + "&nowPage=" + _nowPage + "'>이전</A></li>");
		}

		for (int i = startPage; i <= endPage; i++) {
			if (i > totalPage) { // endPage媛� �쟾泥댄럹�씠吏�蹂대떎 而ㅼ�硫� 諛섎났�쓣 �걹�깂
				break;
			}
			if (nowPage == i) {
				str.append("<li class='active'><a href=#>" + i + "</a></li>");
			} else {
				// �쁽�옱�럹�씠吏�媛� �븘�땶怨녹뿉�꽌 col怨� word瑜� 媛�吏�怨� 媛�
				str.append("<li><a href='" + url + "?nowPage=" + i + "'>" + i + "</A></li>");
			}
		}
		// 2洹몃９ (6~10)* 5 = 10+1 =>11�럹�씠吏�濡� �씠�룞(2洹몃９�뿉�꽌 �떎�쓬�쓣 �닃���쓣�븣 �씠�룞�븯�뒗 怨�,
		// �쁽�옱洹몃９�뿉�꽌 �떎�쓬洹몃９�쓽 泥ル쾲夷� �럹�씠吏�瑜�
		// 媛�由ы궡)
		_nowPage = (nowGrp * pagePerBlock) + 1; // 10媛� �떎�쓬 �럹�씠吏�濡� �씠�룞
		if (nowGrp < totalGrp) {
			str.append("<li><A href='" + url + "?nowPage=" + _nowPage + "'>다음</A></li>");
		}
		str.append("</ul>");
		str.append("</div>");
		return str.toString();
	}

	//댓글 페이징
	public static String drpaging(int total, int nowPage, int recordPerPage,  String url,int nPage, int diary_num) {

		int pagePerBlock = 5; // 블럭당 페이지 수
		int totalPage = (int) (Math.ceil((double) total / recordPerPage)); // 전체 페이지
		int totalGrp = (int) (Math.ceil((double) totalPage / pagePerBlock));// 전체 그룹
		int nowGrp = (int) (Math.ceil((double) nPage / pagePerBlock)); // 현재 그룹
		int startPage = ((nowGrp - 1) * pagePerBlock) + 1; // 특정 그룹의 페이지 목록 시작
		int endPage = (nowGrp * pagePerBlock); // 특정 그룹의 페이지 목록 종료

		StringBuffer str = new StringBuffer();
		str.append("<div style='text-align:center'>");
		str.append("<ul class='pagination'> ");

		int _nowPage = (nowGrp - 1) * pagePerBlock; // 10개 이전 페이지로 이동
		if (nowGrp >= 2) {

			str.append("<li><a href='" + url + "?nowPage=" + nowPage + "&diary_num="
					+ diary_num + "&nPage=" + _nowPage + "'>이전</A></li>");

		}

		for (int i = startPage; i <= endPage; i++) {
			if (i > totalPage) {
				break;
			}
			if (nPage == i) {
				str.append("<li class='active'><a href=#>" + i + "</a></li>");
			} else {
				str.append("<li><a href='" + url + "?nowPage=" + nowPage + "&diary_num="
						+ diary_num + "&nPage=" + i + "'>" + i + "</A></li>");
			}
		}

		_nowPage = (nowGrp * pagePerBlock) + 1; // 10개 다음 페이지로 이동

		if (nowGrp < totalGrp) {
			str.append("<li><A href='" + url + "&nowPage=" + nowPage + "&diary_num="
					+ diary_num + "&nPage=" + _nowPage + "'>다음</A></li>");
		}
		str.append("</ul>");
		str.append("</div>");
		return str.toString();
	}

	//댓글갯수
	public static int rcount(int diary_num, DiaryReplyMapperInter drinter) {
		System.out.println(diary_num+"442525827971893672");
		return drinter.rcount(diary_num);
	}
}

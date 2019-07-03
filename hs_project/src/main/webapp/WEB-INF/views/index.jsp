<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/ssi/ssi.jsp" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>

<div class="banner-overlay"></div>
<div class="container-inner">

	<div class="dday-box">
		<div class="dday-container">
			<div class="dday-round">
				<span>우리 벌써</span>
				<span class="days">
					<c:choose>
						<c:when test="${not empty member.begin_date}">
							<c:set var="begin" value="${member.begin_date} 00:00:00" />
							${util:diffDay(begin)}
						</c:when>
						<c:otherwise>0</c:otherwise>
					</c:choose>
				</span>
				
				<span>일째 사랑중♡</span>
			</div>
			<div class="both-photo">
				<div class="onesProfile">
					<div class="circle-photo">
						<img src="<c:if test='${not empty member.profile}'>${root}/upload/profile/${member.profile}</c:if>" onError="this.src='${root}/upload/profile/default.png'">
					</div>
					<span>
						<c:choose>
							<c:when test="${not empty member.name}">
								${member.name}
							</c:when>
							<c:otherwise>미설정</c:otherwise>
						</c:choose>
					</span>
				</div>
				<span style="color:#ff8686; margin:0 1rem 1rem;">♥</span>
				<div class="onesProfile">
					<div class="circle-photo">
						<img src="<c:if test='${not empty member.lover.profile}'>${root}/upload/profile/${member.lover.profile}</c:if>" onError="this.src='${root}/upload/profile/default.png'">
					</div>
					<span>
						<c:choose>
							<c:when test="${not empty member.lover.name}">
								${member.lover.name}
							</c:when>
							<c:otherwise>미설정</c:otherwise>
						</c:choose>
					</span>
				</div>
			</div>
		</div>
	</div>

	<br><br>
	<span class="h2">우리의 추억</span>
	<span class="headerLine">+</span>
	<div class="postbox">
		
			<!-- 메인에는 4개의 사진이 보여지도록 -->
						<!-- list의 갯수만큼 보여줌 -->
					<c:choose>
						<c:when test="${not empty diarylist }">
							<c:forEach var="dl" items="${diarylist}" >
								<div class="posts">
									<div class="post-photo">
										<a href="javascript:diaryread('${dl.diary_num }')"><img src="${root}/images/diary/storage/${dl.filename}" onerror="this.src='${root}/images/diary/storage/default.jpg'" /></a> <!-- diary썸네일 가지고 오기 -->
									</div>
									<div class="post-title">${dl.title }</div>
								</div>
							</c:forEach>	
							
						
						<!-- list의 갯수가 4개가 안될경우 보여줄 코드 -->
							<c:if test="${4-(fn:length(diarylist)) > 0}">  <!-- list에 2개만 들어있음 -->
								<c:forEach var="i" begin="1" end="${4-(fn:length(diarylist)) }" step="1" > <!-- 0부터 2까지 -->
									<div class="posts">
										<div class="post-photo">
											당신의 이야기로 채워주세요
										</div>
										<div class="post-title"></div>
									</div>
								</c:forEach>
							</c:if>	
							
						</c:when>
			
						<c:otherwise>
							<c:forEach var="i" begin="0" end="3" step="1" > <!-- 0부터 2까지 -->
										<div class="posts">
											<div class="post-photo">
												당신의 이야기로 채워주세요
											</div>
											<div class="post-title"></div>
									</div>
								</c:forEach>
						</c:otherwise>
			</c:choose>
	</div>
	
	

	
	<br/>
	<span class="h2">친구에게도 하기 힘든말</span>
	<span class="headerLine">+</span>
	<div class="board-list-box">
		<div class="tb-container">
			<div class="tb-top">
				<span class="tb-title">오늘의 고민</span>
				
			</div>
			<div class="title-line-b"></div>
			<div class="tb-body">
				<table>
					<c:choose>
						<c:when test="${not empty aboardlist }">
							<c:forEach var="al1" items="${aboardlist }" begin="0" end="3" step="1">
								<tr>
									<td><a href="javascript:aboard_read('${al1.a_num }')">${al1.title }</a></td>
									<td>${al1.regdate }</td>
								</tr>
							</c:forEach>
						</c:when>
						
					</c:choose>
		
				</table>
			</div>
		</div>
		<div class="tb-container responsiveNone">
			<img src="${root}/images/common/banner_date_trouble.gif" />
		</div>
		<div class="tb-container">
			<div class="tb-top">
				<br>
				<span class="more-btn" onclick="location.href='./aboard/list'">+ 더보기</span>
			</div>
			
			<div class="tb-body">
				<table>
					<c:choose>
						<c:when test="${not empty aboardlist }">
							<c:forEach var="al1" items="${aboardlist }" begin="4" end="7" step="1">
								<tr>
									<td><a href="javascript:aboard_read('${al1.a_num }')">${al1.title }</a></td>
									<td>${al1.regdate }</td>
								</tr>
							</c:forEach>
						</c:when>
					</c:choose>
					<!-- <tr>
						<td><a href="#">어려워요</a></td>
						<td>2019.01.01</td>
					</tr>
					<tr>
						<td><a href="#">어려워요</a></td>
						<td>2019.01.01</td>
					</tr>
					<tr>
						<td><a href="#">어려워요</a></td>
						<td>2019.01.01</td>
					</tr>
					<tr>
						<td><a href="#">어려워요</a></td>
						<td>2019.01.01</td>
					</tr> -->
				</table>
			</div>
		</div>

	</div>
	
	
	<br/>
	<span class="h2">이런 곳 어때요?</span>
	<span class="headerLine">+</span>
	<div class="today-pick-box">
		<ul class="today-pick-slider">
			<img id="slide-loading" src="${root}/images/common/loading2.gif" onclick="geoLocationCall();"/>
		</ul>
	</div>
	
</div>

	<script src="${root}/js/tourapi.js"></script>
	<script>
	//scroll header
	document.addEventListener('scroll', debounce(headerScrolling, 10));
	function headerScrolling(){
		const header = document.querySelector(".header-wrap");
		
		if(document.body.scrollWidth < 768){
			//모바일 사이즈일 경우 header 스크롤링하지 않는다.
		}else{
			if(header){
				var scrollpos = window.scrollY || window.pageYOffset;
				//console.log(scrollpos);
				if(scrollpos >= 34){
				}else{
				}
			}
		}
	}
	</script>
	<script>
		function aboard_read(a_num){
		 	 var url = "./aboard/read"; 
		 	url += "?a_num="+a_num;
		 	url += "&col=${col}";
		 	url += "&word=${word}";
		 	url += "&nowPage=${nowPage}";
		 	location.href=url;  
		}
		function diaryread(diary_num){
			var url = "./diary/read";
			url += "?diary_num="+diary_num;                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                   
			location.href=url;
		}
	</script>
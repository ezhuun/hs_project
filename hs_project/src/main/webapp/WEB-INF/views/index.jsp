<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/ssi/ssi.jsp" %>

<style>
	.pick-viewer{position: relative; z-index:3;}
	.pick-viewer-layout{position:fixed; top:0; left:0; width:100%; height:100%; background: rgba(0,0,0,0.4); display:flex; justify-content: center; align-items: center;}
	.pick-viewer-container{position: relative; background: rgba(255,255,255,1); border-radius: 4px; width:80%; height:80%; box-sizing: border-box; padding: 1rem; display:flex; justify-content: center; align-content: center; flex-direction: column; animation: fadeIn-upDown .3s linear; outline:none;}
	.pick-viewer-content{position:relative; flex:1; box-sizing:border-box; overflow-y: auto; word-break: break-word;}
	.pick-viewer-btn{position:relative; padding-top:0.5rem; justify-content: flex-end; display: flex;}
	.pick-viewer-btn button{background:#34495E; border:none; color:#fff; padding:0.875rem 2rem; cursor:pointer; border-radius:4px; }
</style>

<div class="banner-overlay"></div>
<div class="container-inner">

	<div class="dday-box">
		<div class="dday-container">
			<div class="dday-round">
				<span>우리 벌써</span>
				<span class="days">
					
					<c:choose>
						<c:when test="${member.begin_date}">
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



	<div class="postbox">
		<div class="posts">
			<div class="post-photo">
				<img src="${pageContext.request.contextPath}/images/banner/1.jpg" />
			</div>
			<div class="post-title">제목제목11</div>
		</div>
		<div class="posts">
			<div class="post-photo">
				<img src="${pageContext.request.contextPath}/images/banner/2.jpg" />
			</div>
			<div class="post-title">제목제목22</div>
		</div>
		<div class="posts">
			<div class="post-photo">
				당신의 이야기로 채워주세요
			</div>
			<div class="post-title"></div>
		</div>
		<div class="posts">
			<div class="post-photo">
				<img src="${pageContext.request.contextPath}/images/banner/4.jpg" />
			</div>
			<div class="post-title">
				<span>제목제목33</span>
			</div>
		</div>
	</div>
	
	

	
	<br/>
	<span class="h2">친구에게도 하기 힘든말</span>
	<span class="headerLine">+</span>
	<div class="board-list-box">
		<div class="tb-container">
			<div class="tb-top">
				<span class="tb-title">오늘의 고민</span>
				<span class="more-btn">+ 더보기</span>
			</div>
			<div class="title-line-b"></div>
			<div class="tb-body">
				<table>
					<tr>
						<td>어려워요</td>
						<td>2019.01.01</td>
					</tr>
					<tr>
						<td>어려워요</td>
						<td>2019.01.01</td>
					</tr>
					<tr>
						<td>어려워요</td>
						<td>2019.01.01</td>
					</tr>
					<tr>
						<td>어려워요</td>
						<td>2019.01.01</td>
					</tr>
				</table>
			</div>
		</div>
		<div class="tb-container responsiveNone">
			<img src="${root}/images/common/banner_date_trouble.gif" />
		</div>
		<div class="tb-container">
			<div class="tb-top">
				<span class="tb-title">추천 고민</span>
				<span class="more-btn">+ 더보기</span>
			</div>
			<div class="title-line-b"></div>
			<div class="tb-body">
				<table>
					<tr>
						<td>어려워요</td>
						<td>2019.01.01</td>
					</tr>
					<tr>
						<td>어려워요</td>
						<td>2019.01.01</td>
					</tr>
					<tr>
						<td>어려워요</td>
						<td>2019.01.01</td>
					</tr>
					<tr>
						<td>어려워요</td>
						<td>2019.01.01</td>
					</tr>
				</table>
			</div>
		</div>

	</div>
	
	
	<br/>
	<span class="h2">오늘 여기 어때요?</span>
	<span class="headerLine">+</span>
	<div class="today-pick-box">
		<ul class="today-pick-slider">
			<img id="slide-loading" src="${root}/images/common/loading2.gif"/>
		</ul>
	</div>
	
</div>
	
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
	
	//slider script config
	const bop = {
			auto: true,
			slideWidth: 374,
			moveSlides: 1,
			slideMargin: 50,
			pager:false,
			controls: false,
			touchEnabled: false,
			autoHover: true,
			onSliderLoad: function() {

			}
	}
	const slideOnload = function() {
		const f = document.querySelector("#slide-loading");
		if(f){
			f.remove();
		}
	}
	let slider;
	if(document.body.scrollWidth < 768){
		slider = $('.today-pick-slider').bxSlider(Object.assign(bop, {minSlides: 1, maxSlides: 1}));
	}else{
		slider = $('.today-pick-slider').bxSlider(Object.assign(bop, {minSlides: 3, maxSlides: 3}));
	}
	let media = window.matchMedia("screen and (max-width: 768px)");
	media.addListener(function(e) {
		if(e.matches){
			slider.reloadSlider(Object.assign(bop, {minSlides: 1, maxSlides: 1}));
		}else{
			slider.reloadSlider(Object.assign(bop, {minSlides: 3, maxSlides: 3}));
		}
	});
	
	
	
	const pickViewerOpen = function(data){
		const __div = document.createElement("div");
		__div.setAttribute("class", "pick-viewer");
		
		const __div_layout = document.createElement("div");
		__div_layout.setAttribute("class", "pick-viewer-layout");
		
		const __div_container = document.createElement("div");
		__div_container.setAttribute("class", "pick-viewer-container");
		__div_container.setAttribute("tabindex", "0");
		
		const __div_content = document.createElement("div");
		__div_content.setAttribute("class", "pick-viewer-content");
		__div_content.innerHTML = data;

		const __div_btn = document.createElement("div");
		__div_btn.setAttribute("class", "pick-viewer-btn");
		
		const closeBtn = document.createElement("button");
		closeBtn.innerText = "닫 기";
		closeBtn.onclick = function(){
			pickViewerClose();
		}

		__div_layout.addEventListener("click", function (e) {
			e.preventDefault();
			__div_container.focus();
			if(e.target.className == "pick-viewer-layout"){
				pickViewerClose();
			}
		});
		__div_container.addEventListener("keyup", function (e) {
			if (["Enter","Escape","Space"].includes(e.code)) {
				pickViewerClose();
			}
		});
		
		__div_btn.appendChild(closeBtn);
		__div_container.appendChild(__div_content);
		__div_container.appendChild(__div_btn);
		__div_layout.appendChild(__div_container);
		__div.appendChild(__div_layout);
		document.body.prepend(__div);
		__div_container.focus();
	}
	
	const pickViewerClose = function(){
		const pickViewer = document.querySelector(".pick-viewer");
		pickViewer.remove();
	}
	
	const getData = function(url){
		return new Promise(resolve => {
			$.get(url, function(data){
				resolve(data);
			});
		});
	}
	
	const openGoogleMap = function(x, y){
		utils.alert(x + " " + y);
	}
	
	const serviceKey = "0165%2B411e%2FgQnKNGRQg%2BLDx3RvUEyydBouP2dSw1kt7oznhaPXAx6SEXBjjZSnXlWWw8rdxjb8pW%2BhIws3LOiQ%3D%3D";
	const pickViewer = async function(id, contentTypeId){
		//공통정보
		const common_url = "http://api.visitkorea.or.kr/openapi/service/rest/KorService/detailCommon?ServiceKey="+serviceKey+"&contentTypeId="+contentTypeId+"&contentId="+id+"&MobileOS=ETC&MobileApp=TourAPI3.0_Guide&defaultYN=Y&firstImageYN=Y&areacodeYN=Y&catcodeYN=Y&addrinfoYN=Y&mapinfoYN=Y&overviewYN=Y&transGuideYN=Y&_type=json";
		const common = await getData(common_url);
		const commonData = common.response.body.items.item;
				
		let html = "";
		if(commonData.title)
			html += "<h3>"+commonData.title+"</h3>";
		html += "<div style='display:flex; justify-content: flex-start; flex-direction: row;'>";
		html += "<div style='width:100%;'><img src='"+commonData.firstimage+"' style='width:100%'></div>";
		html += "<div style='width:100%; padding:0 1rem;'><ul style='padding:0; margin:0; list-style:none;'>";
		if(commonData.zipcode)
			html += "<li> 우편번호: "+commonData.zipcode+"</li>";
			if(commonData.addr1)
				html += "<li> 주소: "+commonData.addr1+"</li>";
		if(commonData.tel)
			html += "<li> 전화번호: "+commonData.tel+"</li>";
		if(commonData.homepage)
			html += "<li> 홈페이지: "+commonData.homepage+"</li>";
		html += "<li><button onclick='openGoogleMap(\""+commonData.mapx+"\", \""+commonData.mapy+"\")' style='background: #4497EA; border: none; color: #fff; padding: 0.5rem 0.875rem; cursor:pointer; border-radius: 4px; margin:0.5rem 0;'>지도보기</button></li>";
		html += "</ul><br><개요><br>";
		html += commonData.overview;
		html += "</div>";
		html += "</div>";
		
		
		//소개정보
		const info_url = "http://api.visitkorea.or.kr/openapi/service/rest/KorService/detailIntro?ServiceKey="+serviceKey+"&contentTypeId="+contentTypeId+"&contentId="+id+"&MobileOS=ETC&MobileApp=TourAPI3.0_Guide&introYN=Y&_type=json";
		const info = await getData(info_url);
		const infoData = info.response.body.items.item;
				
		html += "<br><hr style='margin-right: 0.5rem; border: 0.5px solid #efefef;'>";
		html += "<h3>코스</h3>";
		html += "<div>";
		if(infoData.chkbabycarriageculture)
			html += "<span style='display:block;'> 유모차대여여부: " + infoData.chkbabycarriageculture+"</span>";
		if(infoData.chkcreditcardculture)
			html += "<span style='display:block;'> 신용카드가능여부: " + infoData.chkcreditcardculture+"</span>";
		if(infoData.chkpetculture)
			html += "<span style='display:block;'> 애완동물가능여부: " + infoData.chkpetculture+"</span>";
		if(infoData.discountinfo)
			html += "<span style='display:block;'> 할인정보: " + infoData.discountinfo+"</span>";
		if(infoData.infocenterculture)
			html += "<span style='display:block;'> 문의및안내: " + infoData.infocenterculture+"</span>";
		if(infoData.parkingculture)
			html += "<span style='display:block;'> 주차시설: " + infoData.parkingculture+"</span>";
		if(infoData.parkingfee)
			html += "<span style='display:block;'> 주차요금: " + infoData.parkingfee+"</span>";
		if(infoData.restdateculture)
			html += "<span style='display:block;'> 쉬는날: " + infoData.restdateculture+"</span>";
		if(infoData.usefee)
			html += "<span style='display:block;'> 이용요금: " + infoData.usefee+"</span>";
		if(infoData.usetimeculture)
			html += "<span style='display:block;'> 이용시간: " + infoData.usetimeculture+"</span>";
		if(infoData.scale)
			html += "<span style='display:block;'> 규모: " + infoData.scale+"</span>";
		if(infoData.spendtime)
			html += "<span style='display:block;'> 관람소요시간: " + infoData.spendtime+"</span>";
		if(infoData.agelimit)
			html += "<span style='display:block;'> 관람가능연령: " + infoData.agelimit+"</span>";
		if(infoData.bookingplace)
			html += "<span style='display:block;'> 예매처: " + infoData.bookingplace+"</span>";
		if(infoData.discountinfofestival)
			html += "<span style='display:block;'> 할인정보: " + infoData.discountinfofestival+"</span>";
		if(infoData.eventenddate)
			html += "<span style='display:block;'> 행사종료일: " + infoData.eventenddate+"</span>";
		if(infoData.eventhomepage)
			html += "<span style='display:block;'> 행사홈페이지: " + infoData.eventhomepage+"</span>";
		if(infoData.eventplace)
			html += "<span style='display:block;'> 행사장소: " + infoData.eventplace+"</span>";
		if(infoData.eventstartdate)
			html += "<span style='display:block;'> 행사시작일: " + infoData.eventstartdate+"</span>";
		if(infoData.festivalgrade)
			html += "<span style='display:block;'> 축제등급: " + infoData.festivalgrade+"</span>";
		if(infoData.placeinfo)
			html += "<span style='display:block;'> 행사장위치안내: " + infoData.placeinfo+"</span>";
		if(infoData.playtime)
			html += "<span style='display:block;'> 공연시간: " + infoData.playtime+"</span>";
		if(infoData.program)
			html += "<span style='display:block;'> 행사프로그램: " + infoData.program+"</span>";
		if(infoData.spendtimefestival)
			html += "<span style='display:block;'> 관람소요시간: " + infoData.spendtimefestival+"</span>";
		if(infoData.sponsor1)
			html += "<span style='display:block;'> 주최자정보: " + infoData.sponsor1+"</span>";
		if(infoData.sponsor1tel)
			html += "<span style='display:block;'> 주최자연락처: " + infoData.sponsor1tel+"</span>";
		if(infoData.sponsor2)
			html += "<span style='display:block;'> 주관사정보: " + infoData.sponsor2+"</span>";
		if(infoData.sponsor2tel)
			html += "<span style='display:block;'> 주관사연락처: " + infoData.sponsor2tel+"</span>";
		if(infoData.subevent)
			html += "<span style='display:block;'> 부대행사: " + infoData.subevent+"</span>";
		if(infoData.usetimefestival)
			html += "<span style='display:block;'> 이용요금: " + infoData.usetimefestival+"</span>";
		if(infoData.distance)
			html += "<span style='display:block;'> 코스총거리: " + infoData.distance+"</span>";
		if(infoData.infocentertourcourse)
			html += "<span style='display:block;'> 문의및안내: " + infoData.infocentertourcourse+"</span>";
		if(infoData.schedule)
			html += "<span style='display:block;'> 코스일정: " + infoData.schedule+"</span>";
		if(infoData.taketime)
			html += "<span style='display:block;'> 코스총소요시간: " + infoData.taketime+"</span>";
		if(infoData.theme)
			html += "<span style='display:block;'> 코스테마: " + infoData.theme+"</span>";
		if(infoData.accomcountleports)
			html += "<span style='display:block;'> 수용인원: " + infoData.accomcountleports+"</span>";
		if(infoData.chkbabycarriageleports)
			html += "<span style='display:block;'> 유모차대여여부: " + infoData.chkbabycarriageleports+"</span>";
		if(infoData.chkcreditcardleports)
			html += "<span style='display:block;'> 신용카드가능여부: " + infoData.chkcreditcardleports+"</span>";
		if(infoData.chkpetleports)
			html += "<span style='display:block;'> 애완동물가능여부: " + infoData.chkpetleports+"</span>";
		if(infoData.expagerangeleports)
			html += "<span style='display:block;'> 체험가능연령: " + infoData.expagerangeleports+"</span>";
		if(infoData.infocenterleports)
			html += "<span style='display:block;'> 문의및안내: " + infoData.infocenterleports+"</span>";
		if(infoData.openperiod)
			html += "<span style='display:block;'> 개장기간: " + infoData.openperiod+"</span>";
		if(infoData.parkingfeeleports)
			html += "<span style='display:block;'> 주차요금: " + infoData.parkingfeeleports+"</span>";
		if(infoData.parkingleports)
			html += "<span style='display:block;'> 주차시설: " + infoData.parkingleports+"</span>";
		if(infoData.reservation)
			html += "<span style='display:block;'> 예약안내: " + infoData.reservation+"</span>";
		if(infoData.restdateleports)
			html += "<span style='display:block;'> 쉬는날: " + infoData.restdateleports+"</span>";
		if(infoData.scaleleports)
			html += "<span style='display:block;'> 규모: " + infoData.scaleleports+"</span>";
		if(infoData.usefeeleports)
			html += "<span style='display:block;'> 입장료: " + infoData.usefeeleports+"</span>";
		if(infoData.usetimeleports)
			html += "<span style='display:block;'> 이용시간: " + infoData.usetimeleports+"</span>";
		if(infoData.accomcountlodging)
			html += "<span style='display:block;'> 수용가능인원: " + infoData.accomcountlodging+"</span>";
		if(infoData.benikia)
			html += "<span style='display:block;'> 베니키아여부: " + infoData.benikia+"</span>";
		if(infoData.checkintime)
			html += "<span style='display:block;'> 입실시간: " + infoData.checkintime+"</span>";
		if(infoData.checkouttime)
			html += "<span style='display:block;'> 퇴실시간: " + infoData.checkouttime+"</span>";
		if(infoData.chkcooking)
			html += "<span style='display:block;'> 객실내취사여부: " + infoData.chkcooking+"</span>";
		if(infoData.foodplace)
			html += "<span style='display:block;'> 식음료장: " + infoData.foodplace+"</span>";
		if(infoData.goodstay)
			html += "<span style='display:block;'> 굿스테이여부: " + infoData.goodstay+"</span>";
		if(infoData.hanok)
			html += "<span style='display:block;'> 한옥여부: " + infoData.hanok+"</span>";
		if(infoData.infocenterlodging)
			html += "<span style='display:block;'> 문의및안내: " + infoData.infocenterlodging+"</span>";
		if(infoData.parkinglodging)
			html += "<span style='display:block;'> 주차시설: " + infoData.parkinglodging+"</span>";
		if(infoData.pickup)
			html += "<span style='display:block;'> 픽업서비스: " + infoData.pickup+"</span>";
		if(infoData.roomcount)
			html += "<span style='display:block;'> 객실수: " + infoData.roomcount+"</span>";
		if(infoData.reservationlodging)
			html += "<span style='display:block;'> 예약안내: " + infoData.reservationlodging+"</span>";
		if(infoData.reservationurl)
			html += "<span style='display:block;'> 예약안내홈페이지: " + infoData.reservationurl+"</span>";
		if(infoData.roomtype)
			html += "<span style='display:block;'> 객실유형: " + infoData.roomtype+"</span>";
		if(infoData.refundregulation)
			html += "<span style='display:block;'> 환불규정: " + infoData.refundregulation+"</span>";
		if(infoData.scalelodging)
			html += "<span style='display:block;'> 규모: " + infoData.scalelodging+"</span>";
		if(infoData.subfacility)
			html += "<span style='display:block;'> 부대시설 (기타): " + infoData.subfacility+"</span>";
		if(infoData.barbecue)
			html += "<span style='display:block;'> 바비큐장여부: " + infoData.barbecue+"</span>";
		if(infoData.beauty)
			html += "<span style='display:block;'> 뷰티시설정보: " + infoData.beauty+"</span>";
		if(infoData.beverage)
			html += "<span style='display:block;'> 식음료장여부: " + infoData.beverage+"</span>";
		if(infoData.bicycle)
			html += "<span style='display:block;'> 자전거대여여부: " + infoData.bicycle+"</span>";
		if(infoData.campfire)
			html += "<span style='display:block;'> 캠프파이어여부: " + infoData.campfire+"</span>";
		if(infoData.fitness)
			html += "<span style='display:block;'> 휘트니스센터여부: " + infoData.fitness+"</span>";
		if(infoData.karaoke)
			html += "<span style='display:block;'> 노래방여부: " + infoData.karaoke+"</span>";
		if(infoData.publicbath)
			html += "<span style='display:block;'> 공용샤워실여부: " + infoData.publicbath+"</span>";
		if(infoData.publicpc)
			html += "<span style='display:block;'> 공용 PC실여부: " + infoData.publicpc+"</span>";
		if(infoData.sauna)
			html += "<span style='display:block;'> 사우나실여부: " + infoData.sauna+"</span>";
		if(infoData.seminar)
			html += "<span style='display:block;'> 세미나실여부: " + infoData.seminar+"</span>";
		if(infoData.Sports)
			html += "<span style='display:block;'> 스포츠시설여부: " + infoData.Sports+"</span>";
		if(infoData.chkbabycarriageshopping)
			html += "<span style='display:block;'> 유모차대여여부: " + infoData.chkbabycarriageshopping+"</span>";
		if(infoData.chkcreditcardshopping)
			html += "<span style='display:block;'> 신용카드가능여부: " + infoData.chkcreditcardshopping+"</span>";
		if(infoData.chkpetshopping)
			html += "<span style='display:block;'> 애완동물가능여부: " + infoData.chkpetshopping+"</span>";
		if(infoData.culturecenter)
			html += "<span style='display:block;'> 문화센터바로가기: " + infoData.culturecenter+"</span>";
		if(infoData.fairday)
			html += "<span style='display:block;'> 장서는날: " + infoData.fairday+"</span>";
		if(infoData.infocentershopping)
			html += "<span style='display:block;'> 문의및안내: " + infoData.infocentershopping+"</span>";
		if(infoData.opendateshopping)
			html += "<span style='display:block;'> 개장일: " + infoData.opendateshopping+"</span>";
		if(infoData.opentime)
			html += "<span style='display:block;'> 영업시간: " + infoData.opentime+"</span>";
		if(infoData.parkingshopping)
			html += "<span style='display:block;'> 주차시설: " + infoData.parkingshopping+"</span>";
		if(infoData.restdateshopping)
			html += "<span style='display:block;'> 쉬는날: " + infoData.restdateshopping+"</span>";
		if(infoData.restroom)
			html += "<span style='display:block;'> 화장실설명: " + infoData.restroom+"</span>";
		if(infoData.saleitem)
			html += "<span style='display:block;'> 판매품목: " + infoData.saleitem+"</span>";
		if(infoData.saleitemcost)
			html += "<span style='display:block;'> 판매품목별가격: " + infoData.saleitemcost+"</span>";
		if(infoData.scaleshopping)
			html += "<span style='display:block;'> 규모: " + infoData.scaleshopping+"</span>";
		if(infoData.shopguide)
			html += "<span style='display:block;'> 매장안내: " + infoData.shopguide+"</span>";
		if(infoData.chkcreditcardfood)
			html += "<span style='display:block;'> 신용카드가능여부: " + infoData.chkcreditcardfood+"</span>";
		if(infoData.discountinfofood)
			html += "<span style='display:block;'> 할인정보: " + infoData.discountinfofood+"</span>";
		if(infoData.firstmenu)
			html += "<span style='display:block;'> 대표메뉴: " + infoData.firstmenu+"</span>";
		if(infoData.infocenterfood)
			html += "<span style='display:block;'> 문의및안내: " + infoData.infocenterfood+"</span>";
		if(infoData.kidsfacility)
			html += "<span style='display:block;'> 어린이놀이방: " + infoData.kidsfacility+"</span>";
		if(infoData.opendatefood)
			html += "<span style='display:block;'> 개업일: " + infoData.opendatefood+"</span>";
		if(infoData.opentimefood)
			html += "<span style='display:block;'> 영업시간: " + infoData.opentimefood+"</span>";
		if(infoData.packing)
			html += "<span style='display:block;'> 포장가능여부: " + infoData.packing+"</span>";
		if(infoData.parkingfood)
			html += "<span style='display:block;'> 주차시설: " + infoData.parkingfood+"</span>";
		if(infoData.reservationfood)
			html += "<span style='display:block;'> 예약안내: " + infoData.reservationfood+"</span>";
		if(infoData.restdatefood)
			html += "<span style='display:block;'> 쉬는날: " + infoData.restdatefood+"</span>";
		if(infoData.scalefood)
			html += "<span style='display:block;'> 규모: " + infoData.scalefood+"</span>";
		if(infoData.seat)
			html += "<span style='display:block;'> 좌석수: " + infoData.seat+"</span>";
		if(infoData.smoking)
			html += "<span style='display:block;'> 금연/흡연여부: " + infoData.smoking+"</span>";
		if(infoData.treatmenu)
			html += "<span style='display:block;'> 취급메뉴: " + infoData.treatmenu+"</span>";

		html += "</div>";


		
		//코스정보
		const course_url = "http://api.visitkorea.or.kr/openapi/service/rest/KorService/detailInfo?ServiceKey="+serviceKey+"&contentTypeId="+contentTypeId+"&contentId="+id+"&MobileOS=ETC&MobileApp=TourAPI3.0_Guide&listYN=Y&_type=json";
		const course = await getData(course_url);
		const courseData = course.response.body.items.item;

		console.log(courseData);
		
		if(Array.isArray(courseData)){
			html += "<br><hr style='margin-right: 0.5rem; border: 0.5px solid #efefef;'>";
			html += "<h3>코스정보</h3>";
			
			courseData.forEach(function(item){
				html += "<div style='padding:1rem; padding:1rem; border-bottom:1px solid #efefef;'>";
				html += "<span style='display:block; padding: 1rem 0;'>"+(item.subnum+1)+"코스 : ";
				if(item.subname)
					html += item.subname;
				html += "</span>";
				html += "<div style='display:flex; justify-content: flex-start; flex-direction: row;'>";
				if(item.subdetailimg)
					html += "<div style='width:100%;'><img src='"+item.subdetailimg+"' style='width:100%;'></div>";
				html += "<div style='width:100%; padding: 0 1rem;'>";
				html += "<<코스개요>><br>";
				html += item.subdetailoverview;
				html += "</div>";
				
				html += "</div>";
				html += "</div>";
			});
		}
		
		pickViewerOpen(html);
	}
	
	//bxslider item click event(detail viewer)
	const pickBox = document.querySelector(".today-pick-box");
	pickBox.addEventListener('click', function(e){
		const contentId = e.target.dataset.id
			| e.target.parentElement.dataset.id
			| e.target.parentElement.parentElement.dataset.id;

		const contentTypeId = e.target.dataset.contenttypeid
		| e.target.parentElement.dataset.contenttypeid
		| e.target.parentElement.parentElement.dataset.contenttypeid;
		
		if(contentId){
			pickViewer(contentId, contentTypeId);
		}
	})

	
	//api 호출
	const apiCall = async function(lati, longi) {
		let list_url = "http://api.visitkorea.or.kr/openapi/service/rest/KorService/locationBasedList?ServiceKey="+serviceKey+"&contentTypeId=&radius=2000&listYN=Y&MobileOS=ETC&MobileApp=TourAPI3.0_Guide&arrange=A&numOfRows=50&pageNo=1&_type=json";
		list_url = list_url + "&mapY=" + lati;
		list_url = list_url + "&mapX=" + longi;
		
		const data = await getData(list_url);
		if(!data){
			apiCall(37.568477, 126.981611);
			return;
		}
		const items = data.response.body.items.item;
		
		//api로 받은 데이터(배열)을 순서를 무작위로 바꾼다
      	for(let i=items.length-1; i>0; i--){
            let j = Math.floor(Math.random() * (i+1));
            let temp = items[i];
            items[i] = items[j];
            items[j] = temp;
        }
      	
		//html코드 작성
		var html="";
		items.forEach(function(item, i){
			if(item.firstimage2){
				html += "<li>";
				html += "<div class='pick-card' data-id='"+item.contentid+"' data-contenttypeid='"+item.contenttypeid+"'>";
				html += "<div class='pick-img'><img src='"+item.firstimage2+"' ondragstart='return false'></div>";
				html += "<span>"+item.title+"</span>";
				html += "</div>";
				html += "</li>";				
			}

		});
		document.querySelector(".today-pick-slider").innerHTML = html;
		
		slider.reloadSlider(Object.assign(bop, {onSliderLoad: slideOnload}));
	}
	
	apiCall(37.568477, 126.981611);
	
	if (navigator.geolocation) {
	  navigator.geolocation.getCurrentPosition(function(position) {
		  apiCall(position.coords.latitude, position.coords.longitude);
	  });
	}
	
	</script>
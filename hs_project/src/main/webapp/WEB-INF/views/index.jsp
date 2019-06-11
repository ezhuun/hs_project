<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/ssi/ssi.jsp" %>

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
	
	if (navigator.geolocation) {
	  navigator.geolocation.getCurrentPosition(function(position) {
		  apiCall(position.coords.latitude, position.coords.longitude);
	  });
	}
	</script>
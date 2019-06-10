<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/ssi/ssi.jsp" %>

<style>
	.pick-viewer{position: relative; z-index:3;}
	.pick-viewer-layout{position:fixed; top:0; left:0; width:100%; height:100%; background: rgba(0,0,0,0.4); display:flex; justify-content: center; align-items: center;}
	.pick-viewer-container{position: relative; background: rgba(255,255,255,1); border-radius: 4px; width:80%; height:80%; box-sizing: border-box; padding: 1rem; display:flex; justify-content: center; align-content: center; flex-direction: column; animation: fadeIn-upDown .3s linear; outline:none;}
	.pick-viewer-content{position:relative; flex:1; box-sizing:border-box; overflow-y: auto; word-break: break-word;}
	.pick-viewer-btn{position:relative; padding-top:0.5rem; justify-content: flex-end; display: flex;}
	.pick-viewer-btn button{background:#34495E; border:none; color:#fff; padding:0.875rem 2rem; cursor:pointer;}
</style>

<div class="banner-overlay"></div>
<div class="container-inner">

	<div class="dday-box">
		<div class="dday-container">
			<div class="dday-round">
				<span>우리 벌써</span>
				<span class="days">100</span>
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
		closeBtn.innerText = "닫기";
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
	
	const serviceKey = "0165%2B411e%2FgQnKNGRQg%2BLDx3RvUEyydBouP2dSw1kt7oznhaPXAx6SEXBjjZSnXlWWw8rdxjb8pW%2BhIws3LOiQ%3D%3D";
	const pickViewer = async function(id){
		//공통정보
		let common_url = "http://api.visitkorea.or.kr/openapi/service/rest/KorService/detailCommon?ServiceKey="+serviceKey+"&contentTypeId=25&contentId="+id+"&MobileOS=ETC&MobileApp=TourAPI3.0_Guide&defaultYN=Y&firstImageYN=Y&areacodeYN=Y&catcodeYN=Y&addrinfoYN=Y&mapinfoYN=Y&overviewYN=Y&transGuideYN=Y&_type=json";
		const common = await getData(common_url);
		
		//코스정보
		let course_url = "http://api.visitkorea.or.kr/openapi/service/rest/KorService/detailInfo?ServiceKey="+serviceKey+"&contentTypeId=25&contentId="+id+"&MobileOS=ETC&MobileApp=TourAPI3.0_Guide&listYN=Y&_type=json";
		const course = await getData(course_url);
		
		pickViewerOpen("==================================common==================================<br>"+JSON.stringify(common)
				+"<br><br>==================================course==================================<br>"+JSON.stringify(course));
	}
	
	//bxslider item click event(detail viewer)
	const pickBox = document.querySelector(".today-pick-box");
	pickBox.addEventListener('click', function(e){
		const contentId = e.target.dataset.id
			| e.target.parentElement.dataset.id
			| e.target.parentElement.parentElement.dataset.id;
		
		if(contentId){
			pickViewer(contentId);
		}
	})

	
	//api 호출
	const apiCall = async function(lati, longi) {
		let list_url = "http://api.visitkorea.or.kr/openapi/service/rest/KorService/locationBasedList?ServiceKey="+serviceKey+"&MobileOS=ETC&MobileApp=AppTest&listYN=Y&arrange=B&contentTypeId=25&radius=2000&numOfRows=30&pageNo=1&_type=json";
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
			html += "<li>";
			html += "<div class='pick-card' data-id='"+item.contentid+"'>";
			html += "<div class='pick-img'><img src='"+item.firstimage2+"' ondragstart='return false'></div>";
			html += "<span>"+item.title+"</span>";
			html += "</div>";
			html += "</li>";
		});
		document.querySelector(".today-pick-slider").innerHTML = html;
		
		slider.reloadSlider(Object.assign(bop, {onSliderLoad: slideOnload}));
	}
	
	apiCall(37.568477, 126.981611);
	
	
// 	if (navigator.geolocation) {
// 	  navigator.geolocation.getCurrentPosition(function(position) {
// 		  apiCall(position.coords.latitude, position.coords.longitude);
// 	  });
// 	}
	
	</script>
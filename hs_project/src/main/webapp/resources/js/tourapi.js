const serviceKey = "0165%2B411e%2FgQnKNGRQg%2BLDx3RvUEyydBouP2dSw1kt7oznhaPXAx6SEXBjjZSnXlWWw8rdxjb8pW%2BhIws3LOiQ%3D%3D";
	
const getData = function (url) {
	return new Promise(resolve => {
		$.get(url, function (data) {
			resolve(data);
		});
	});
}

const pickViewerOpen = function (data) {
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
	closeBtn.onclick = function () {
		pickViewerClose();
	}

	__div_layout.addEventListener("click", function (e) {
		e.preventDefault();
		__div_container.focus();
		if (e.target.className == "pick-viewer-layout") {
			pickViewerClose();
		}
	});
	__div_container.addEventListener("keyup", function (e) {
		if (["Enter", "Escape", "Space"].includes(e.code)) {
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

const pickViewerClose = function () {
	const pickViewer = document.querySelector(".pick-viewer");
	pickViewer.remove();
}

const pickViewer = async function (id, contentTypeId) {
	//공통정보
	const common_url = "http://api.visitkorea.or.kr/openapi/service/rest/KorService/detailCommon?ServiceKey=" + serviceKey + "&contentTypeId=" + contentTypeId + "&contentId=" + id + "&MobileOS=ETC&MobileApp=TourAPI3.0_Guide&defaultYN=Y&firstImageYN=Y&areacodeYN=Y&catcodeYN=Y&addrinfoYN=Y&mapinfoYN=Y&overviewYN=Y&transGuideYN=Y&_type=json";
	const common = await getData(common_url);
	const commonData = common.response.body.items.item;

	let html = "";
	if (commonData.title)
		html += "<h3>" + commonData.title + "</h3>";
	html += "<div class='common-container'>";
	html += "<div class='common-images'><img src='" + commonData.firstimage + "'></div>";
	html += "<div class='common-details'><ul>";
	if (commonData.zipcode)
		html += "<li> 우편번호: " + commonData.zipcode + "</li>";
	if (commonData.addr1)
		html += "<li> 주소: " + commonData.addr1 + "</li>";
	if (commonData.tel)
		html += "<li> 전화번호: " + commonData.tel + "</li>";
	if (commonData.homepage)
		html += "<li> 홈페이지: " + commonData.homepage + "</li>";
	html += "<li><button class='mapBtn' onclick='openGoogleMap(\"" + commonData.mapx + "\", \"" + commonData.mapy + "\")'>지도보기</button></li>";
	html += "</ul><br><개요><br>";
	html += commonData.overview;
	html += "</div>";
	html += "</div>";


	//소개정보
	const info_url = "http://api.visitkorea.or.kr/openapi/service/rest/KorService/detailIntro?ServiceKey=" + serviceKey + "&contentTypeId=" + contentTypeId + "&contentId=" + id + "&MobileOS=ETC&MobileApp=TourAPI3.0_Guide&introYN=Y&_type=json";
	const info = await getData(info_url);
	const infoData = info.response.body.items.item;

	html += "<br><hr class='pick-line'>";
	html += "<h3>코스</h3>";
	html += "<div class='course-details'>";
	if (infoData.chkbabycarriage)
		html += "<span> 유모차대여여부: " + infoData.chkbabycarriage + "</span>";
	if (infoData.chkbabycarriageculture)
		html += "<span> 유모차대여여부: " + infoData.chkbabycarriageculture + "</span>";
	if (infoData.chkcreditcard)
		html += "<span> 신용카드가능여부: " + infoData.chkcreditcard + "</span>";
	if (infoData.chkcreditcardculture)
		html += "<span> 신용카드가능여부: " + infoData.chkcreditcardculture + "</span>";
	if (infoData.chkpet)
		html += "<span> 애완동물가능여부: " + infoData.chkpet + "</span>";
	if (infoData.chkpetculture)
		html += "<span> 애완동물가능여부: " + infoData.chkpetculture + "</span>";
	if (infoData.discountinfo)
		html += "<span> 할인정보: " + infoData.discountinfo + "</span>";
	if (infoData.infocenterculture)
		html += "<span> 문의및안내: " + infoData.infocenterculture + "</span>";
	if (infoData.parkingculture)
		html += "<span> 주차시설: " + infoData.parkingculture + "</span>";
	if (infoData.parkingfee)
		html += "<span> 주차요금: " + infoData.parkingfee + "</span>";
	if (infoData.restdateculture)
		html += "<span> 쉬는날: " + infoData.restdateculture + "</span>";
	if (infoData.usefee)
		html += "<span> 이용요금: " + infoData.usefee + "</span>";
	if (infoData.usetimeculture)
		html += "<span> 이용시간: " + infoData.usetimeculture + "</span>";
	if (infoData.scale)
		html += "<span> 규모: " + infoData.scale + "</span>";
	if (infoData.spendtime)
		html += "<span> 관람소요시간: " + infoData.spendtime + "</span>";
	if (infoData.agelimit)
		html += "<span> 관람가능연령: " + infoData.agelimit + "</span>";
	if (infoData.bookingplace)
		html += "<span> 예매처: " + infoData.bookingplace + "</span>";
	if (infoData.discountinfofestival)
		html += "<span> 할인정보: " + infoData.discountinfofestival + "</span>";
	if (infoData.eventenddate)
		html += "<span> 행사종료일: " + infoData.eventenddate + "</span>";
	if (infoData.eventhomepage)
		html += "<span> 행사홈페이지: " + infoData.eventhomepage + "</span>";
	if (infoData.eventplace)
		html += "<span> 행사장소: " + infoData.eventplace + "</span>";
	if (infoData.eventstartdate)
		html += "<span> 행사시작일: " + infoData.eventstartdate + "</span>";
	if (infoData.festivalgrade)
		html += "<span> 축제등급: " + infoData.festivalgrade + "</span>";
	if (infoData.placeinfo)
		html += "<span> 행사장위치안내: " + infoData.placeinfo + "</span>";
	if (infoData.playtime)
		html += "<span> 공연시간: " + infoData.playtime + "</span>";
	if (infoData.program)
		html += "<span> 행사프로그램: " + infoData.program + "</span>";
	if (infoData.spendtimefestival)
		html += "<span> 관람소요시간: " + infoData.spendtimefestival + "</span>";
	if (infoData.sponsor1)
		html += "<span> 주최자정보: " + infoData.sponsor1 + "</span>";
	if (infoData.sponsor1tel)
		html += "<span> 주최자연락처: " + infoData.sponsor1tel + "</span>";
	if (infoData.sponsor2)
		html += "<span> 주관사정보: " + infoData.sponsor2 + "</span>";
	if (infoData.sponsor2tel)
		html += "<span> 주관사연락처: " + infoData.sponsor2tel + "</span>";
	if (infoData.subevent)
		html += "<span> 부대행사: " + infoData.subevent + "</span>";
	if (infoData.usetimefestival)
		html += "<span> 이용요금: " + infoData.usetimefestival + "</span>";
	if (infoData.distance)
		html += "<span> 코스총거리: " + infoData.distance + "</span>";
	if (infoData.infocentertourcourse)
		html += "<span> 문의및안내: " + infoData.infocentertourcourse + "</span>";
	if (infoData.schedule)
		html += "<span> 코스일정: " + infoData.schedule + "</span>";
	if (infoData.taketime)
		html += "<span> 코스총소요시간: " + infoData.taketime + "</span>";
	if (infoData.theme)
		html += "<span> 코스테마: " + infoData.theme + "</span>";
	if (infoData.accomcountleports)
		html += "<span> 수용인원: " + infoData.accomcountleports + "</span>";
	if (infoData.chkbabycarriageleports)
		html += "<span> 유모차대여여부: " + infoData.chkbabycarriageleports + "</span>";
	if (infoData.chkcreditcardleports)
		html += "<span> 신용카드가능여부: " + infoData.chkcreditcardleports + "</span>";
	if (infoData.chkpetleports)
		html += "<span> 애완동물가능여부: " + infoData.chkpetleports + "</span>";
	if (infoData.expagerangeleports)
		html += "<span> 체험가능연령: " + infoData.expagerangeleports + "</span>";
	if (infoData.infocenterleports)
		html += "<span> 문의및안내: " + infoData.infocenterleports + "</span>";
	if (infoData.openperiod)
		html += "<span> 개장기간: " + infoData.openperiod + "</span>";
	if (infoData.parkingfeeleports)
		html += "<span> 주차요금: " + infoData.parkingfeeleports + "</span>";
	if (infoData.parkingleports)
		html += "<span> 주차시설: " + infoData.parkingleports + "</span>";
	if (infoData.reservation)
		html += "<span> 예약안내: " + infoData.reservation + "</span>";
	if (infoData.restdateleports)
		html += "<span> 쉬는날: " + infoData.restdateleports + "</span>";
	if (infoData.scaleleports)
		html += "<span> 규모: " + infoData.scaleleports + "</span>";
	if (infoData.usefeeleports)
		html += "<span> 입장료: " + infoData.usefeeleports + "</span>";
	if (infoData.usetimeleports)
		html += "<span> 이용시간: " + infoData.usetimeleports + "</span>";
	if (infoData.accomcountlodging)
		html += "<span> 수용가능인원: " + infoData.accomcountlodging + "</span>";
	if (infoData.benikia)
		html += "<span> 베니키아여부: " + infoData.benikia + "</span>";
	if (infoData.checkintime)
		html += "<span> 입실시간: " + infoData.checkintime + "</span>";
	if (infoData.checkouttime)
		html += "<span> 퇴실시간: " + infoData.checkouttime + "</span>";
	if (infoData.chkcooking)
		html += "<span> 객실내취사여부: " + infoData.chkcooking + "</span>";
	if (infoData.foodplace)
		html += "<span> 식음료장: " + infoData.foodplace + "</span>";
	if (infoData.goodstay)
		html += "<span> 굿스테이여부: " + infoData.goodstay + "</span>";
	if (infoData.hanok)
		html += "<span> 한옥여부: " + infoData.hanok + "</span>";
	if (infoData.infocenterlodging)
		html += "<span> 문의및안내: " + infoData.infocenterlodging + "</span>";
	if (infoData.parkinglodging)
		html += "<span> 주차시설: " + infoData.parkinglodging + "</span>";
	if (infoData.pickup)
		html += "<span> 픽업서비스: " + infoData.pickup + "</span>";
	if (infoData.roomcount)
		html += "<span> 객실수: " + infoData.roomcount + "</span>";
	if (infoData.reservationlodging)
		html += "<span> 예약안내: " + infoData.reservationlodging + "</span>";
	if (infoData.reservationurl)
		html += "<span> 예약안내홈페이지: " + infoData.reservationurl + "</span>";
	if (infoData.roomtype)
		html += "<span> 객실유형: " + infoData.roomtype + "</span>";
	if (infoData.refundregulation)
		html += "<span> 환불규정: " + infoData.refundregulation + "</span>";
	if (infoData.scalelodging)
		html += "<span> 규모: " + infoData.scalelodging + "</span>";
	if (infoData.subfacility)
		html += "<span> 부대시설 (기타): " + infoData.subfacility + "</span>";
	if (infoData.barbecue)
		html += "<span> 바비큐장여부: " + infoData.barbecue + "</span>";
	if (infoData.beauty)
		html += "<span> 뷰티시설정보: " + infoData.beauty + "</span>";
	if (infoData.beverage)
		html += "<span> 식음료장여부: " + infoData.beverage + "</span>";
	if (infoData.bicycle)
		html += "<span> 자전거대여여부: " + infoData.bicycle + "</span>";
	if (infoData.campfire)
		html += "<span> 캠프파이어여부: " + infoData.campfire + "</span>";
	if (infoData.fitness)
		html += "<span> 휘트니스센터여부: " + infoData.fitness + "</span>";
	if (infoData.karaoke)
		html += "<span> 노래방여부: " + infoData.karaoke + "</span>";
	if (infoData.publicbath)
		html += "<span> 공용샤워실여부: " + infoData.publicbath + "</span>";
	if (infoData.publicpc)
		html += "<span> 공용 PC실여부: " + infoData.publicpc + "</span>";
	if (infoData.sauna)
		html += "<span> 사우나실여부: " + infoData.sauna + "</span>";
	if (infoData.seminar)
		html += "<span> 세미나실여부: " + infoData.seminar + "</span>";
	if (infoData.Sports)
		html += "<span> 스포츠시설여부: " + infoData.Sports + "</span>";
	if (infoData.chkbabycarriageshopping)
		html += "<span> 유모차대여여부: " + infoData.chkbabycarriageshopping + "</span>";
	if (infoData.chkcreditcardshopping)
		html += "<span> 신용카드가능여부: " + infoData.chkcreditcardshopping + "</span>";
	if (infoData.chkpetshopping)
		html += "<span> 애완동물가능여부: " + infoData.chkpetshopping + "</span>";
	if (infoData.culturecenter)
		html += "<span> 문화센터바로가기: " + infoData.culturecenter + "</span>";
	if (infoData.fairday)
		html += "<span> 장서는날: " + infoData.fairday + "</span>";
	if (infoData.infocentershopping)
		html += "<span> 문의및안내: " + infoData.infocentershopping + "</span>";
	if (infoData.opendateshopping)
		html += "<span> 개장일: " + infoData.opendateshopping + "</span>";
	if (infoData.opentime)
		html += "<span> 영업시간: " + infoData.opentime + "</span>";
	if (infoData.parkingshopping)
		html += "<span> 주차시설: " + infoData.parkingshopping + "</span>";
	if (infoData.restdateshopping)
		html += "<span> 쉬는날: " + infoData.restdateshopping + "</span>";
	if (infoData.restroom)
		html += "<span> 화장실설명: " + infoData.restroom + "</span>";
	if (infoData.saleitem)
		html += "<span> 판매품목: " + infoData.saleitem + "</span>";
	if (infoData.saleitemcost)
		html += "<span> 판매품목별가격: " + infoData.saleitemcost + "</span>";
	if (infoData.scaleshopping)
		html += "<span> 규모: " + infoData.scaleshopping + "</span>";
	if (infoData.shopguide)
		html += "<span> 매장안내: " + infoData.shopguide + "</span>";
	if (infoData.chkcreditcardfood)
		html += "<span> 신용카드가능여부: " + infoData.chkcreditcardfood + "</span>";
	if (infoData.discountinfofood)
		html += "<span> 할인정보: " + infoData.discountinfofood + "</span>";
	if (infoData.firstmenu)
		html += "<span> 대표메뉴: " + infoData.firstmenu + "</span>";
	if (infoData.infocenterfood)
		html += "<span> 문의및안내: " + infoData.infocenterfood + "</span>";
	if (infoData.kidsfacility)
		html += "<span> 어린이놀이방: " + infoData.kidsfacility + "</span>";
	if (infoData.opendatefood)
		html += "<span> 개업일: " + infoData.opendatefood + "</span>";
	if (infoData.opentimefood)
		html += "<span> 영업시간: " + infoData.opentimefood + "</span>";
	if (infoData.packing)
		html += "<span> 포장가능여부: " + infoData.packing + "</span>";
	if (infoData.parkingfood)
		html += "<span> 주차시설: " + infoData.parkingfood + "</span>";
	if (infoData.reservationfood)
		html += "<span> 예약안내: " + infoData.reservationfood + "</span>";
	if (infoData.restdatefood)
		html += "<span> 쉬는날: " + infoData.restdatefood + "</span>";
	if (infoData.scalefood)
		html += "<span> 규모: " + infoData.scalefood + "</span>";
	if (infoData.seat)
		html += "<span> 좌석수: " + infoData.seat + "</span>";
	if (infoData.smoking)
		html += "<span> 금연/흡연여부: " + infoData.smoking + "</span>";
	if (infoData.treatmenu)
		html += "<span> 취급메뉴: " + infoData.treatmenu + "</span>";
	html += "</div>";

	//코스정보
	const course_url = "http://api.visitkorea.or.kr/openapi/service/rest/KorService/detailInfo?ServiceKey=" + serviceKey + "&contentTypeId=" + contentTypeId + "&contentId=" + id + "&MobileOS=ETC&MobileApp=TourAPI3.0_Guide&listYN=Y&_type=json";
	const course = await getData(course_url);
	const courseData = course.response.body.items.item;

	if (courseData) {
		html += "<br><hr class='pick-line'>";
		if (contentTypeId == "25") {
			//여행코스
			html += "<h3>여행코스</h3>";
			if (Array.isArray(courseData)) {
				courseData.forEach(function (item) {
					html += "<div class='trav-container'>";
					html += "<span class='trav-title'>" + (item.subnum + 1) + "코스 : ";
					if (item.subname)
						html += item.subname;
					html += "</span>";
					html += "<div class='trav-inner-container'>";
					if (item.subdetailimg)
						html += "<div class='trav-inner-images'><img src='" + item.subdetailimg + "'></div>";
					html += "<div class='trav-inner-details'>";
					html += "<<코스개요>><br>";
					html += item.subdetailoverview;
					html += "</div>";

					html += "</div>";
					html += "</div>";
				});
			}
		} else if (contentTypeId == "32") {
			//숙박코스
			html += "<h3>숙박코스</h3>";
			if (Array.isArray(courseData)) {
				courseData.forEach(function (item) {
					html += "<div class='trav-container'>";
					html += "<span class='trav-title'> 객실명: " + item.roomtitle + "</span>";
					html += "<div class='trav-inner-container'>";

					if (item.roomimg1)
						html += "<div class='trav-inner-images'><img src='" + item.roomimg1 + "'></div>";

					html += "<div class='trav-inner-details'>";
					if (item.roomsize1)
						html += "<span'> 객실크기(평): " + item.roomsize1 + "</span>";
					if (item.roomcount)
						html += "<span'> 객실수: " + item.roomcount + "</span>";
					if (item.roombasecount)
						html += "<span'> 기준인원: " + item.roombasecount + "</span>";
					if (item.roommaxcount)
						html += "<span'> 최대인원: " + item.roommaxcount + "</span>";
					if (item.roomoffseasonminfee1)
						html += "<span'> 비수기주중최소: " + item.roomoffseasonminfee1 + "</span>";
					if (item.roomoffseasonminfee2)
						html += "<span'> 비수기주말최소: " + item.roomoffseasonminfee2 + "</span>";
					if (item.roompeakseasonminfee1)
						html += "<span'> 성수기주중최소: " + item.roompeakseasonminfee1 + "</span>";
					if (item.roompeakseasonminfee2)
						html += "<span'> 성수기주말최소: " + item.roompeakseasonminfee2 + "</span>";
					if (item.roomintro)
						html += "<span'> 객실소개: " + item.roomintro + "</span>";
					if (item.roombathfacility)
						html += "<span'> 목욕시설: " + item.roombathfacility + "</span>";
					if (item.roombath)
						html += "<span'> 욕조: " + item.roombath + "</span>";
					if (item.roomhometheater)
						html += "<span'> 홈시어터: " + item.roomhometheater + "</span>";
					if (item.roomaircondition)
						html += "<span'> 에어컨: " + item.roomaircondition + "</span>";
					if (item.roomtv)
						html += "<span'> TV: " + item.roomtv + "</span>";
					if (item.roompc)
						html += "<span'> PC: " + item.roompc + "</span>";
					if (item.roomcable)
						html += "<span'> 케이블설치: " + item.roomcable + "</span>";
					if (item.roominternet)
						html += "<span'> 인터넷: " + item.roominternet + "</span>";
					if (item.roomrefrigerator)
						html += "<span'> 냉장고: " + item.roomrefrigerator + "</span>";
					if (item.roomtoiletries)
						html += "<span'> 세면도구: " + item.roomtoiletries + "</span>";
					if (item.roomsofa)
						html += "<span'> 소파: " + item.roomsofa + "</span>";
					if (item.roomcook)
						html += "<span'> 취사용품: " + item.roomcook + "</span>";
					if (item.roomTable)
						html += "<span'> 테이블: " + item.roomTable + "</span>";
					if (item.roomhairdryer)
						html += "<span'> 드라이기: " + item.roomhairdryer + "</span>";
					if (item.roomsize2)
						html += "<span'> 객실크기(평방미터): " + item.roomsize2 + "</span>";
					html += "</div>";
					html += "</div>";
					html += "</div>";
				});
			}
		} else {
			//그 외
			html += "<h3>상세정보</h3>";
			if (Array.isArray(courseData)) {
				courseData.forEach(function (item) {
					if (item.infoname)
						html += item.infoname;
					if (item.infotext)
						html += "<span style='display:block; padding-left:1rem;'>" + item.infotext + "</span><br>";
				});
			} else {
				if (courseData.infoname)
					html += courseData.infoname;
				if (courseData.infotext)
					html += "<span style='display:block; padding-left:1rem;'>" + courseData.infotext + "</span><br>";
			}
		}
	}

	pickViewerOpen(html);
}

//bxslider item click event(detail viewer)
const pickBox = document.querySelector(".today-pick-box");
pickBox.addEventListener('click', function (e) {
	const contentId = e.target.dataset.id |
		e.target.parentElement.dataset.id |
		e.target.parentElement.parentElement.dataset.id;

	const contentTypeId = e.target.dataset.contenttypeid |
		e.target.parentElement.dataset.contenttypeid |
		e.target.parentElement.parentElement.dataset.contenttypeid;

	if (contentId) {
		pickViewer(contentId, contentTypeId);
	}
});

const openGoogleMap = function(x, y){
	window.open('https://www.google.co.kr/maps/place/'+y+', '+x);
}

//slider script config
const bop = {
	auto: true,
	slideWidth: 374,
	moveSlides: 1,
	slideMargin: 50,
	pager: false,
	controls: false,
	touchEnabled: false,
	autoHover: true,
}
const slideOnload = function () {
	const f = document.querySelector("#slide-loading");
	if (f) {
		f.remove();
	}
}
let slider;
if (document.body.scrollWidth < 768) {
	slider = $('.today-pick-slider').bxSlider(Object.assign(bop, {
		minSlides: 1,
		maxSlides: 1
	}));
} else {
	slider = $('.today-pick-slider').bxSlider(Object.assign(bop, {
		minSlides: 3,
		maxSlides: 3
	}));
}
let media = window.matchMedia("screen and (max-width: 768px)");
media.addListener(function (e) {
	if (e.matches) {
		slider.reloadSlider(Object.assign(bop, {
			minSlides: 1,
			maxSlides: 1
		}));
	} else {
		slider.reloadSlider(Object.assign(bop, {
			minSlides: 3,
			maxSlides: 3
		}));
	}
});

//api 호출
const apiCall = async function (lati, longi) {
	let list_url = "http://api.visitkorea.or.kr/openapi/service/rest/KorService/locationBasedList?ServiceKey=" + serviceKey + "&contentTypeId=&radius=2000&listYN=Y&MobileOS=ETC&MobileApp=TourAPI3.0_Guide&arrange=A&numOfRows=50&pageNo=1&_type=json";
	list_url = list_url + "&mapY=" + lati;
	list_url = list_url + "&mapX=" + longi;

	const data = await getData(list_url);
	if (!data) {
		apiCall(37.568477, 126.981611);
		return;
	}
	const items = data.response.body.items.item;

	//api로 받은 데이터(배열)을 순서를 무작위로 바꾼다
	for (let i = items.length - 1; i > 0; i--) {
		let j = Math.floor(Math.random() * (i + 1));
		let temp = items[i];
		items[i] = items[j];
		items[j] = temp;
	}

	//html코드 작성
	var html = "";
	items.forEach(function (item, i) {
		if (item.firstimage2) {
			html += "<li>";
			html += "<div class='pick-card' data-id='" + item.contentid + "' data-contenttypeid='" + item.contenttypeid + "'>";
			html += "<div class='pick-img'><img src='" + item.firstimage2 + "' ondragstart='return false'></div>";
			html += "<span>" + item.title + "</span>";
			html += "</div>";
			html += "</li>";
		}

	});
	document.querySelector(".today-pick-slider").innerHTML = html;

	slider.reloadSlider(Object.assign(bop, {
		onSliderLoad: slideOnload
	}));
}

if (navigator.geolocation) {
	navigator.geolocation.getCurrentPosition(function (position) {
		apiCall(position.coords.latitude, position.coords.longitude);
	});
}
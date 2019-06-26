<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/ssi/ssi.jsp"%>

<script type='text/javascript'
	src='${root }/libs/unitegallery/js/unitegallery.min.js'></script>

<link rel='stylesheet'
	href='${root }/libs/unitegallery/css/unite-gallery.css' type='text/css' />

<script type='text/javascript'
	src='${root }/libs/unitegallery/themes/tiles/ug-theme-tiles.js'></script>



<style>
#createbtn{
	background-color: white; 
	color: black;
	font-size: 15px; 
	
}
.content{
	padding: 10px;
}
.paging{
	position: absolute;
	bottom: 0; 
	width: 100%;
	right: 1%;
}
</style>


<!-- 여기부터 -->
<script type="text/javascript">
	function read(diary_num) {
		var url = "read";
		url += "?diary_num=" + diary_num;
		location.href = url;
	}
	function deleteM(){
		window.opener.location.reload();    //부모창 reload
		window.close();    //현재 팝업창 Close
	}
</script>
<div class="container-inner sideBorder ">
	<div class="bootstrap">
		<!-- 목록에 보여질 데이터들을 for문을 이용하여 다 보이도록 -->
		<!-- 이미지 등을 담는 컨테이너 역할 -->
		<div id="gallery" style="display:none;">
			<c:forEach var="diarydto" items="${list}">
					<a href="./read?diary_num=${diarydto.diary_num }&nowPage=1" target="_blank">
					<img
						alt="${diarydto.title }" 
						data-image=""
						data-description="${diarydto.title }"
						src="${root }/images/diary/storage/${diarydto.filename}" 
						style="display:none"/>
					</a>
			</c:forEach>
		</div>
	</div>
	<div class="bootstrap" align="right" style="margin: 10px; margin-top: 30px; "> 
		<button class="btn btn-default" type="button" id="createbtn" onclick="location.href='./create'">글쓰기</button>
	</div>
</div>
		
	<div class="paging">
		<hr align="center" style="color: gray;width: 90%;">
		<div class="bootstrap">
			${paging }
		</div>
	</div>

	<!-- 자신의 js는 아래 script태그를 만들어서 사용 -->
	<script>
		$(".hover").mouseleave(function() {
			$(this).removeClass("hover");
		});
	</script>

	<script type="text/javascript">
		jQuery(document).ready(function() {
			jQuery("#gallery").unitegallery({
				tile_show_link_icon:true, //a tag
				tile_enable_textpanel:true, //title
				
			});
		});
	</script>
	<!-- 여기까지 -->
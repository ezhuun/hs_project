<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/ssi/ssi.jsp"%>


<script type='text/javascript' src='${root }/libs/unitegallery/js/jquery-11.0.min.js'></script>
<script type='text/javascript' src='${root }/libs/unitegallery/js/unitegallery.min.js'></script>

<link rel='stylesheet' href='${root }/libs/unitegallery/css/unite-gallery.css'
	type='text/css' />

<script type='text/javascript'
	src='${root }/libs/unitegallery/themes/tiles/ug-theme-tiles.js'></script>



<style>
.snip1361 {
	font-family: 'Quattrocento', Arial, sans-serif;
	position: relative;
	overflow: hidden; /*구역밖으로 나가는 글씨를 숨김 */
	margin: 10px;
	min-width: 230px;
	max-width: 315px;
	width: 100%;
	color: #141414;
	text-align: left;
	line-height: 1.4em;
	font-size: 16px;
}

.snip1361 * {
	-webkit-box-sizing: border-box;
	box-sizing: border-box; /* */
	-webkit-transition: all 0.35s ease;
	transition: all 0.35s ease;
}

.snip1361 img {
	max-width: 100%;
	vertical-align: top;
}

.snip1361 figcaption {
	position: absolute; /*조상태그안에 위치(title이 이미지 안에 들어갈 수 있도록 위치를 지정) */
	top: calc(77%); /*title부분이 77%보인 상태에서 마우스를 올리면 내용의 전부가 보임 */
	width: 100%;
	background-color: rgba(255, 255, 255, 0.5);
	padding: 5px 25px 80px;
}

.snip1361 figcaption:before {
	position: absolute;
	content: '';
	z-index: 2;
	bottom: 100%;
	left: 0;
	width: 100%;
	height: 60px;
}

.snip1361 h3 {
	font-weight: 300;
	font-size: 1.4em;
	line-height: 0em;
	font-family: 'Oswald', Arial, sans-serif;
	text-align: center;
}

.snip1361 p {
	font-size: 0.9em;
	letter-spacing: 1px;
	opacity: 0.9;
	text-align: center;
}

.snip1361 a {
	position: absolute;
	top: 0;
	bottom: 0;
	left: 0;
	right: 0;
	z-index: 2;
}
/*마우스를 올려놓았을 때 제목구역이 위로올라옴 */
.snip1361:hover figcaption, .snip1361.hover figcaption {
	top: 150px;
}
}
</style>
<!-- 여기부터 -->
<script type="text/javascript">
	function read(diary_num){
		var url = "read";
		url += "?diary_num="+diary_num;
		location.href = url;
	}
</script>
<div class="container-inner sideBorder boxsing">

	<div class="bootstrap">
		<h1>Diary List</h1>
		<!-- 목록에 보여질 데이터들을 for문을 이용하여 다 보이도록 -->
		<!-- 이미지 등을 담는 컨테이너 역할 -->
		<div id="gallery">
		<input type="hidden" id="diary_num" name="diary_num" value="${diarydto.diary_num }">
		<input type="hidden" id="nowPage" name="nowPage" value="${nowPage }">
		<%-- <img alt="Image 1 Title" src="${root }/images/diary/Tulips.jpg" data-image="images/image1.jpg" data-description="Image 1 Description">
		<img alt="Image 1 Title" src="${root }/images/diary/Tulips.jpg" data-image="images/image1.jpg" data-description="Image 1 Description">
		<img alt="Image 1 Title" src="${root }/images/diary/Tulips.jpg" data-image="images/image1.jpg" data-description="Image 1 Description">  --%>
			<c:choose>
				<c:when test="${empty list }">
					<!-- controller request한 list -->
					<tr>
						<td colspan="7" align="center">추억을 남겨주세요.</td>
					</tr>
				</c:when>
				<c:otherwise>
					<c:forEach var="diarydto" items="${list}">
						<figure class="snip1361">
						<!-- 생성시 메인에 사용할 사진을 설정 or 내용에 적은 사진 중에서 첫번째 사진을 사용 -->
							<img src="${root }/images/diary/Tulips.jpg" alt="sample45" />
							<figcaption>
								<!-- 이에 대한 설명을하는 문구를 담는 태그 -->
								<h3>${diarydto.title }</h3>
								<p>${diarydto.d_date }</p>
							</figcaption>
							<!-- read(조회)로 이동 --> 
							<a href="javascript:read('${diarydto.diary_num }')"></a>
							
						</figure>
						<br>
					</c:forEach>
				</c:otherwise>
			</c:choose>
		</div>



		<!-- 	<figure class="snip1361">
				<img src="D:/machine/ojt/image/Tulips.jpg" alt="sample45" />
				<figcaption>
					이에 대한 설명을하는 문구를 담는 태그
					<h3>Date</h3>
					<p>title</p>
				</figcaption>
				<a href="#"></a>
				read(조회)로 이동
			</figure>

			<figure class="snip1361">
				<img src="D:/machine/ojt/image/Tulips.jpg" alt="sample45" />
				<figcaption>
					이에 대한 설명을하는 문구를 담는 태그
					<h3>Date</h3>
					<p>title</p>
				</figcaption>
				<a href="#"></a>
				read(조회)로 이동
			</figure> -->
		
		<button type="button" onclick="location.href='./create'">생성</button>
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
		jQuery("#gallery").unitegallery();
	});
</script>

<!-- 여기까지 -->
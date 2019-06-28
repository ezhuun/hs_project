<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/ssi/ssi.jsp" %>

	<script type="text/javascript" src="${root }/css/d_day_css/script.js"></script>
	
	<div class="container-inner sideBorder boxsing">
	<h1 class="col-sm-offset-2 col-sm-10">D-day</h1>
	<div class="bootstrap">
		<form class="form-horizontal" method="post" action="read">
		
		<div class="panel panel-default">
			<input type="hidden" name="uuid" value="${member.uuid}">
			<div class="panel-heading">제목</div>
			<div class="panel-body">${dto.title}</div>

			<div class="panel-heading">기념일</div>
			<div class="panel-body">${dto.d_date}</div>

			<div class="panel-heading">등록일</div>
			<div class="panel-body">${dto.regdate}</div>
		</div>

		<div>
			<button type="button" class="btn" onclick="location.href='create'">등록</button>
			<button type="button" class="btn" onclick="updateM()">수정</button>
			<button type="button" class="btn" onclick="deleteM()">삭제</button>
			<button type="button" class="btn" onclick="location.href='list'">목록</button>
		</div>
		</form>
	</div>
</div>

<script>
function updateM(){
	  var url = "./update";
	  url = url + "?d_num=${dto.d_num}";
	  url = url + "&col=${param.col}";
	  url = url + "&word=${param.word}";
	  url = url + "&nowPage=${param.nowPage}";
	  
	  location.href = url;
}

function deleteM(){
var url = "./delete";
url = url + "?d_num=${dto.d_num}";
url = url + "&col=${param.col}";
url = url + "&word=${param.word}";
url = url + "&nowPage=${param.nowPage}";

location.href = url;
}
</script>
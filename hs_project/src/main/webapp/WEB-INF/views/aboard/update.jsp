<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/ssi/ssi.jsp" %>

<link rel="stylesheet" href="${root }/css/aboardCU.css" type="text/css"/>

	<!-- 여기부터 -->
	<div class="container-inner sideBorder boxsing">
		<div class="bootstrap">
			<h3 class="talk">UPDATE</h3>
			<form class="form-horizontal" action="update" method="post" >
			<input type="hidden" name ="uuid" id="uuid" value="${member.uuid}">
			<input type="hidden" name ="a_num" id="a_num" value="${dto.a_num}">
				<div class="write">
					<label for="a_name">닉네임</label>
					<span id="a_name" class="form-control">${dto.a_name}</span> 			
				</div>
				
				<div class="write">		
					<label for="title">제목</label>
					<input type="text" name="title" id="title" class="form-control" value="${dto.title }">
				</div>
				
				<div class="write">
					<label for="content">내용</label>
					<textarea class="form-control" rows="5" id="content" name='content'>${dto.content }</textarea>
				</div> 

				<br>		
				<div class="btn-group btn-xs">
					<button class="btn btn-default btn-xs" id="ok" type="submit">확인</button>
					<button class="btn btn-default btn-xs" id="cancle" type="reset" onclick="history.back()">취소</button>
				</div>
		
			</form>

						
		</div>
	</div>


	<!-- 자신의 js는 아래 script태그를 만들어서 사용 -->
	<script src="${root}/ckeditor/ckeditor.js"></script>
	<script>
	window.onload = function(){
		CKEDITOR.replace("content");
	}
	</script>
	
	<!-- 여기까지 -->
	
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/ssi/ssi.jsp" %>

<style type="text/css">
	h4{
		width:30%;
		margin-bottom: 14px;
		padding-bottom: 10px;
		border-bottom: 2px solid #000;
	}


	.btn-wrap {
		position: relative;
		clear: both;
		float: left;
		width: 100%;
		margin-top: 30px;
		padding-top: 10px;
		border-top: 1px solid #ebebeb;

	}  
	
	.btn-wrap button {
	    float: right;
	    width: 47px;
	    height: 26px;
	    margin-left: 5px;
	    overflow: hidden;
	    background-position:0 -253px;
	    background-position: 0 -253px;
	        padding: 0 !important;
	}	
		
	.btn-wrap button.list {
    	position: absolute;
    	top: 10px;
    	left: 0;
    	margin: 0;
	}
	
	
	.btn-wrap button.ok {
    	background-position: 0 -201px;
	}
	
	.btn-wrap button.cancle {
    	background-position: 0 -279px;
	}
	

</style>

	<!-- 여기부터 -->
	<div class="container-inner sideBorder boxsing">
		<div class="bootstrap">
			<h4 class="talk"><span>글쓰기</span></h4>
			<form class="form-horizontal" action="update" method="post" >
			<input type="hidden" name ="uuid" id="uuid" value=${member.uuid}>
			<input type="hidden" name ="a_num" id="a_num" value=${dto.a_num}>
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
				<div class="btn-wrap">
					<button class="btn btn-default" id="list" onclick="location.href='./list'">목록</button>
					<button class="btn btn-default" id="ok" type="submit">확인</button>
					<button class="btn btn-default" id="cancle" type="reset" onclick="history.back()">취소</button>
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
	<script>
		function test(){
			console.log('g');
		}
		test();
	</script>
	
	<!-- 여기까지 -->
	
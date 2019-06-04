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
		width: 1170px;
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
			<form class="form-horizontal" action="create" method="post" >
				<div class="write">
					<label for="a_name">닉네임</label>
					<input type="text" name="a_name" id="a_name" class="form-control">
				</div>
				
				<div class="write">		
					<label for="title">제목</label>
					<input type="text" name="title" id="title" class="form-control">
				</div>
				
				<div class="write">
					<label for="content">내용</label>
					<textarea class="form-control" rows="5" id="content" name='content'></textarea>
				</div> 
		
			</form>
			<br>		
			<div class="btn-wrap">
				<button class="btn btn-default" id="list">목록</button>
				<button class="btn btn-default" id="ok" type="submit">확인</button>
				<button class="btn btn-default" id="cancle" type="reset">취소</button>
			</div>
						
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
	
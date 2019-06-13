<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/ssi/ssi.jsp" %>

<style type="text/css">
	div.notice{
	    border-top: 2px solid #000 ;
	    border-bottom: 2px solid #000;
	    width: 80%;
	    padding: 10px 10px 10px 10px;
	    margin : 1% 10%;
	   
	}
	
	div.notice .title{
		margin: 20px 0;
	}
	.bridge_talk{
		padding-left: 10%;
	}
	ul.talk-list{
		list-style : none;
		padding: 0;
		float : left;
		width : 40%;
		margin-right : 30px;
		
	}
	
	ul.talk-list li a {
    	color: #464646;
    	font-size: 13px;
    	line-height : 1.3;
    	white-space: nowrap;
		overflow: hidden;
			
	}
	
	.reply-num {
    	font-size: 11px;
    	padding-left: 6px;
    	padding-top: 3px;
    	color: #e9281d;
    	float:right;
	}

	
	ul.talk-list li span.name {
	    font-size: 11px;
	    color: #999;
	    text-align: left;
	    letter-spacing: -1px;
	}
	
	hr{
	    width: 80%;
	    padding: 10px 10px;
    	margin: 10%;
    	color:#ccc;
	}
	
	.posting_wrap {
	    clear: both;
	    float: left;
	    width: 80%;
	    margin-left: 10%;
	    padding: 0 10px;
		
	}


	.talk_list th {
    	padding: 9px 0;
    	border-bottom: 1px solid #cccccc;
	}
	
	th, td {
    	border-collapse: collapse;
	}
	
</style>

	<!-- 여기부터 -->
	<div class="container-inner sideBorder bootstrap">
		<div id="header" class="notice"><!-- talk -->
			<h3 class="title"> 한줄 공지사항 입니다</h3>
		</div>	
		
		<div class="bridge_talk">
			<ul class="talk-list">
				<c:choose>
					<c:when test="${empty notice_list}">
						등록된 게시글이 없습니다.
					</c:when>
					<c:otherwise>
						<c:forEach var = "dto" items="${notice_list }" begin="0" end ="4" step="1">
							<li>
								<a href="javascript:read('${dto.a_num}')">${dto.title}</a>
								<span class="name">${dto.a_name}</span>
								<span class="reply-num">${dto.viewcnt }</span>
							</li>
						</c:forEach>
					</c:otherwise>
				</c:choose>
			</ul>
		</div>
		
		<div class="bridge_talk even">
			<ul class="talk-list">
				<c:choose>
					<c:when test="${empty notice_list}">
						등록된 게시글이 없습니다.
					</c:when>
					<c:otherwise>
						<c:forEach var = "dto" items="${notice_list }" begin="5" end="9" step="1">
							<li>
								<a href="javascript:read('${dto.a_num}')">${dto.title}</a>
								<span class="name">${dto.a_name}</span>
								<span class="reply-num">${dto.viewcnt }</span>
							</li>
						</c:forEach>
					</c:otherwise>
				</c:choose>
			</ul>
		</div>
		<br>
		<hr>
		<div class="posting_wrap">
			<table class="talk_list" summary="톡톡 카테고리 최신글 목록">
				<colgroup>
					<col width="700">
					<col width="240">
					<col width="215">
					<col width="230">
				</colgroup>
				<thead>
					<tr>
						<th>제목</th>
						<th>글쓴이</th>
						<th>조회수</th>
						<th>작성일</th>								
					</tr>
				</thead>
				<tbody>
					<c:choose>
						<c:when test ="${empty list }">
							<tr><td> 등록된 게시글이 없습니다 </td></tr>
						</c:when>
						<c:otherwise>
							<c:forEach var="dto" items="${list }">
								<tr>
									<td class="subject">
										<strong id="${col}"></strong><a href="javascript:read('${dto.a_num}')">${dto.title}</a>
									</td>
									<td class="writer">
										<span class="name">${dto.a_name}</span>
									</td>
									<td>${dto.viewcnt }</td>
									<td>${dto.regdate }</td>
							</c:forEach>
						
						</c:otherwise>						
					
					</c:choose>				
				</tbody>
			</table>
			<div>${paging }</div>						
		</div>
		<br>
		
		
	
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
	
	<script type="text/javascript">

		function read(a_num){	
		 	var url = "read"; 
		 	url += "?a_num="+a_num;
		 	url += "&col=${col}";
		 	url += "&word=${word}";
		 	url += "&nowPage=${nowPage}";
		 	location.href=url; 	
		} 	
	</script>
	
	<!-- 여기까지 -->
	
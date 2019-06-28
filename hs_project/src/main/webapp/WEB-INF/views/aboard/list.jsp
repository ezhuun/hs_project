<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/ssi/ssi.jsp" %>
<link rel="stylesheet" href="${root }/css/aboardList.css" type="text/css"/>
	<!-- 여기부터 -->
	<div class="container-inner sideBorder bootstrap">
		<div id="header" class="notice"><!-- talk -->
			<h3 class="title"> 욕설 및 비방 글은 쓰지 말아주세요.</h3>
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
								<c:set var="rcount" value="${util:rcount(dto.a_num, arinter)}"/>
								<a href="javascript:read('${dto.a_num}')">${dto.title}</a>
								<c:if test="${rcount>0 }"><span style="color: #e9281d;">(${rcount })</span></c:if>
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
						
					</c:when>
					<c:otherwise>
						<c:forEach var = "dto" items="${notice_list }" begin="5" end="9" step="1">
							<li>
								<c:set var="rcount" value="${util:rcount(dto.a_num, arinter)}"/>
								<a href="javascript:read('${dto.a_num}')">${dto.title}</a>
								<c:if test="${rcount>0 }"><span style="color: #e9281d;">(${rcount })</span></c:if>
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
		
		
		<div class="posting_wrap" style=" margin-top:60px;" >	
			<div class=" bootstrap" style="min-height: 500px;">
				<form class="form" action="./list">
				<div id="search-input" >			
					<div class="input-group">
						<input type="text" class="form-control input-md" name="word" value="${word }">
						<span class="input-group-btn">
							<button class="btn btn-default btn-md" type="submit">검색</button>
						</span>			
						<span class="input-group-btn">
							<button class="btn btn-default btn-md" type="button" onclick="location.href='./create'">등록</button>
						</span>	
					</div>						
				</div>
				</form>	
				<br>			
		
				<table class="talk_list" >
					<colgroup>
						<col width="550px">
						<col width="150px">
						<col width="116px">
						<col width="120px">
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
											<c:set var="rcount" value="${util:rcount(dto.a_num, arinter)}"/>
											<strong id="${col}"></strong><a href="javascript:read('${dto.a_num}')">${dto.title}</a>
											<c:if test="${rcount>0 }"><span style="color: #e9281d;">(${rcount })</span></c:if>
										</td>
										<td class="writer"  style="text-align:center; !important;">
											<span class="name">${dto.a_name}</span>
										</td>
										<td  style="text-align:center; !important;">${dto.viewcnt }</td>
										<td  style="text-align:center; !important;">${dto.regdate }</td>
								</c:forEach>						
							</c:otherwise>						
						
						</c:choose>				
					</tbody>
				</table>
			</div>
			<br><br>
			
			<div>${paging }</div>						
			<br>
		</div>	
	</div>	
	

	

	<!-- 자신의 js는 아래 script태그를 만들어서 사용 -->

	
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
	
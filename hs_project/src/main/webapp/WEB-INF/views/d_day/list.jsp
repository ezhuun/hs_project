<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/ssi/ssi.jsp"%>


<!-- 여기부터 -->

<div class="container-inner sideBorder boxsing">
<div class="bootstrap">
	<h2>D-day 목록</h2>
	<form class="form-inline" action="list">
		<div class="form-group">
			<select class="form-control" name="col">
				<c:if test="${col=='title'}">selected</c:if>
				<option value="title">제목</option>
				<c:if test="${col=='d_date'}">selected</c:if>
				<option value="content">기념일</option>
				<c:if test="${col=='total'}">selected</c:if>
				<option value="total">전체 출력</option>
			</select>
		</div>

		<div class="form-group">
			<input type="text" class="form-control" placeholder="Enter 검색어"
				name="word" value="${word}">
		</div>
		
		<button type="submit" class="btn btn-default">검색</button>
		<button class="btn" type="button" onclick="location.href='create'">등록</button>

		<br>
		<table class="table">
			<thead>
				<tr>
					<th>번호</th>
					<th>기념일</th>
					<th>제목</th>
					<th>D-day</th>
					<th>등록 날짜</th>
					<th>수정/삭제</th>
				</tr>
			</thead>

			<tbody>

				<c:choose>
					<c:when test="${empty list}">
						<tr>
							<td colspan="4">등록된 D-day가 없습니다.</td>
						</tr>
					</c:when>

					<c:otherwise>
						<c:forEach var="dto" items="${list}">
							<tr>
								<td>${dto.d_num}</td>
								<td>${dto.d_date}</td>
								<td>${dto.title}</td>
								<td><a>
									<c:set var="ddate" value="${dto.d_date} 00:00:00" />
									${util:diffDay(ddate)+1}일 지났습니다.
								</a></td>
								<td>${dto.regdate}</td>
								<td><a href="${pageContext.request.contextPath}/d_day/update"
								>수정</a>/
								<a href="${pageContext.request.contextPath}/d_day/delete">삭제</a>
								</td>
							</tr>
						</c:forEach>
					</c:otherwise>
				</c:choose>
			</tbody>
		</table>
		<div>${paging}</div>
	</form>
</div>
</div>

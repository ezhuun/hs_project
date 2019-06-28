<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/ssi/ssi.jsp"%>

<link href="${root }/css/d_day_css/style.css" rel="stylesheet" type="text/css">

<div class="container-inner sideBorder boxsing">
<div class="bootstrap">
	<h2>D-day 목록</h2>
	<form class="form-inline" action="list">
	<input type="hidden" name="uuid" value="${member.uuid}">
	
	<br>
		<table id="loveday" class="col-sm-12">
		<tr id="ld">
			<td rowspan="3" class="col-sm-2" style=text-align:center>Love Day</td>
		</tr>
		<tr>
			<th class="col-sm-2" style="border-bottom: 1px solid #444444">기념일</th>
			<td class="col-sm-2" style="border-bottom: 1px solid #444444">${member.begin_date}</td>
		</tr>
		<tr>
			<th class="col-sm-2">D-day</th>
			<td class="col-sm-2"><a>
				<c:set var="ddate" value="${member.begin_date} 00:00:00" />
				${util:diffDay(ddate)+1}일
			</a></td>
		</tr>
		</table>
		
		<table id="birthday" class="col-sm-6">
		<tr id="bd">
			<td rowspan="3" class="col-sm-2" style=text-align:center>${member.name}님의 생일</td>
		</tr>
		<tr>
			<th class="col-sm-2" style="border-bottom: 1px solid #444444">기념일</th>
			<td class="col-sm-2" style="border-bottom: 1px solid #444444">${member.birth}</td>
		</tr>
		<tr>
			<th class="col-sm-2">D-day</th>
			<td class="col-sm-2"><a>
				<c:set var="ddate" value="${member.birth} 00:00:00" />
				${util:diffDay(ddate)+1}일
			</a></td>
		</tr>
		</table>
		
		<table id="lovebirthday" class="col-sm-6">
		<tr id="lbd">
			<td rowspan="3" class="col-sm-2" style=text-align:center>${member.lover.name}님의 생일</td>
		</tr>
		<tr>
			<th class="col-sm-2" style="border-bottom: 1px solid #444444">기념일</th>
			<td class="col-sm-2" style="border-bottom: 1px solid #444444">${member.lover.begin_date}</td>
		</tr>
		<tr>
			<th class="col-sm-2">D-day</th>
			<td class="col-sm-2"><a>
				<c:set var="ddate" value="${member.lover.birth} 00:00:00" />
				${util:diffDay(ddate)+1}일
			</a></td>
		</tr>
		</table>
	
			<div class="form-group" style="margin-top:20px; ">
				<select class="form-control" name="col">
					<c:if test="${col=='title'}">selected</c:if>
					<option value="title">제목</option>
					<c:if test="${col=='d_date'}">selected</c:if>
					<option value="content">기념일</option>
					<c:if test="${col=='total'}">selected</c:if>
					<option value="total">전체 출력</option>
				</select>
				
				<input type="text" class="form-control" placeholder="Enter 검색어"
					name="word" value="${word}">
					
				<button type="submit" class="btn btn-default">검색</button>
				<button class="btn" type="button" onclick="location.href='create'">등록</button>
			</div>
			

		<br>
		
		<table class="table">
			<thead>
				<tr>
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
								<td>${dto.d_date}</td>
								<td>${dto.title}</td>
								<td><a href="javascript:read('${dto.d_num}')">
									<c:set var="ddate" value="${dto.d_date} 00:00:00" />
									${util:diffDay(ddate)+1}일
								</a></td>
								<td>${dto.regdate}</td>
								<td><a href="javascript:update('${dto.d_num}')">수정</a>/
								<a href="javascript:deleteM('${dto.d_num}')">삭제</a>
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

<script>
function read(d_num) {
	var url = "read";
	url = url + "?d_num=" + d_num;
	url += "&col=${col}";
	url += "&word=${word}";
	url += "&nowPage=${nowPage}";
	
	location.href = url;
}

function update(d_num) {
	var url = "update";
	url = url + "?d_num=" + d_num;
	url += "&col=${col}";
	url += "&word=${word}";
	url += "&nowPage=${nowPage}";

	location.href = url;
}
function deleteM(d_num) {
	var url = "delete";
	url = url + "?d_num=" + d_num;
	url += "&col=${col}";
	url += "&word=${word}";
	url += "&nowPage=${nowPage}";

	location.href = url;
}
</script>
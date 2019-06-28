<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/ssi/ssi.jsp" %>

	<script type="text/javascript" src="${root }/css/d_day_css/script.js"></script>
	
	<div class="container-inner sideBorder boxsing">
	<div class="bootstrap">
		<h1 class="col-sm-offset-2 col-sm-10">D-day 수정</h1>
		<form class="form-horizontal" method="post" action="update">
			<input type="hidden" name="uuid" value="${member.uuid}">
			<input type="hidden" name="d_num" value="${dto.d_num}"/>

			<div class="form-group">
				<label class="control-label col-sm-2" for="title">Title</label>
				<div class="col-sm-8">
					<input type="text" name="title" id="title" class="form-control" value="${dto.title}">
				</div>
			</div>

			<div class="form-group">
				<label class="control-label col-sm-2" for="d_date">Date</label>
				<div class="col-sm-6">
					<input type="text" name="d_date" id="d_date" class="form-control" value="${dto.d_date}">
				</div>
			</div>

			<div class="form-group">
				<div class="col-sm-offset-2 col-sm-5">
					<button class="btn">등록</button>
					<button type="reset" class="btn">취소</button>
					<button type="button" class="btn" onclick="location.href='./list'">목록</button>
				</div>
			</div>
		</form>
	</div>
	</div>
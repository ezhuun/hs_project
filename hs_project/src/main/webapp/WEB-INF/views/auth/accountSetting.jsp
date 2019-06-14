<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/ssi/ssi.jsp" %>


	<div class="container-inner sideBorder">
	
       	<div class="user_view_container">
			<form id="frm" name="frm" method="post" onsubmit="return false">
			<input type="hidden" id="uuid" name="uuid" value="${member.uuid}"/>
        	<h4>나의 계정 <c:if test="${member.lev == 1}">[관리자]</c:if></h4>
        	<div class="user_view_group">
        		<div class="user_view_rows">
		        	<div class="user_view_cols">
			        	<div class="user_view_selectionHeader">Uid</div>
			        	<div class="user_view_info"><span id="currentUuid">${member.uuid}</span></div>
		        	</div>
		        	<div class="user_view_cols">
			        	<div class="user_view_selectionHeader">이메일</div>
			        	<div class="user_view_info">${member.email}</div>
		        	</div>
		        	<div class="user_view_cols">
			        	<div class="user_view_selectionHeader">이름</div>
			        	<div class="user_view_info"><span id="currentName">${member.name}</span></div>
			        	<div class="user_view_link"><span id="changeName" onclick="popupChangeName();">이름 변경</span></div>
		        	</div>
		        	
		        	<div class="user_view_cols">
			        	<div class="user_view_selectionHeader">생일</div>
			        	<div class="user_view_info">			        		
			        		<input type="text" id="birth" name="birth" value="${member.birth}" style="display:none;">
			        		<label for="birth">
			        			${member.birth}
			        		</label>
			        		<span class="user_view_link" id="btn_birth" style="padding-left:0.5rem;">
			        			<span>변경</span>
			        		</span>
			        	</div>
		        	</div>
		        	
		        	<div class="user_view_cols">
			        	<div class="user_view_selectionHeader">처음 만난 날</div>
			        	<div class="user_view_info">			        		
			        		<input type="text" id="begin_date" name="begin_date" value="${member.begin_date}" style="display:none;">
			        		<label for="begin_date">
			        			${member.begin_date}
			        		</label>
			        		<span class="user_view_link" id="btn_begin_date" style="padding-left:0.5rem;">
			        			<span>변경</span>
			        		</span>
			        	</div>
		        	</div>
		        	
		        	<div class="user_view_cols">
			        	<div class="user_view_selectionHeader">비밀번호</div>
			        	<div class="user_view_link"><span id="changePasswd" onclick="popupChangePasswd();">비밀번호 변경</span></div>
		        	</div>
		        	<c:if test="${member.lev != 1}">
		        	<div class="user_view_cols">
			        	<div class="user_view_selectionHeader">계정</div>
			        	<div class="user_view_link"><span onclick="handleDeleteMember('${member.uuid}');">계정 삭제</span></div>
		        	</div>
		        	</c:if>
	        	</div>
	        	<div class="user_profile_photo_area">
	        		<div class="user_profile_circle">
        				<img id="profileImage" src="<c:if test="${not empty member.profile}">${root}/upload/profile/${member.profile}</c:if>" width="112"  onError="this.src='${root}/upload/profile/default.png'">
	        			<label for="profile">
	        				<input type="file" accept="image/*" id="profile" name="profile" onchange="handleChangePhoto(event);">
	        			</label>
	        		</div>
	        		<div class="user_view_link">
	        			<span id="delProfilePhoto" onclick="popupDeletePhoto();">
	        				<c:if test="${not empty member.profile}">
	        					사진 삭제
	        				</c:if>
	        			</span>
	        		</div>
	        	</div>
        	</div>
        	</form>
        	
			<c:if test="${not empty member.lover}">
	        	<h4>연결 계정</h4>
	        	<div class="user_view_group">
	        		<div class="user_view_rows">
			        	<div class="user_view_cols">
				        	<div class="user_view_selectionHeader">Uid</div>
				        	<div class="user_view_info">${member.lover.uuid}</div>
			        	</div>
			        	<div class="user_view_cols">
				        	<div class="user_view_selectionHeader">이메일</div>
				        	<div class="user_view_info">${member.lover.email}</div>
			        	</div>
			        	<div class="user_view_cols">
				        	<div class="user_view_selectionHeader">이름</div>
				        	<div class="user_view_info">${member.lover.name}</div>
			        	</div>
			        	<div class="user_view_cols">
				        	<div class="user_view_selectionHeader">생일</div>
				        	<div class="user_view_info">${member.birth}</div>
			        	</div>
			        	<div class="user_view_cols">
				        	<div class="user_view_selectionHeader">최근접속</div>
				        	<div class="user_view_info">${member.lover.last_login}</div>
			        	</div>
			        	<div class="user_view_cols">
				        	<div class="user_view_selectionHeader">연결관리</div>
				        	<div class="user_view_link"><span onclick="handleDisconnect('${member.uuid}');">연결 해제</span></div>
			        	</div>
		        	</div>
		        	<div class="user_profile_photo_area">
		        		<div class="user_profile_circle">
	        				<img src="<c:if test="${not empty member.lover.profile}">${root}/upload/profile/${member.lover.profile}</c:if>" width="112"  onError="this.src='${root}/upload/profile/default.png'">
		        		</div>
		        	</div>
	        	</div>
        	</c:if>
		</div>
		
	</div>
	
	<script src="${pageContext.request.contextPath}/js/auth.js" charset="utf-8"></script>
	<script>
		const begin_date = document.querySelector("#begin_date");
		const btn_begin_date = document.querySelector("#btn_begin_date");
		const picker= new MaterialDatetimePicker({
			el: begin_date,
			format: 'YYYY-MM-DD',
			openedBy: 'focus'
		});
		btn_begin_date.addEventListener('click', function() {
			picker.open();
		}, false);
		begin_date.addEventListener('change', function(e) {
			const uuid = document.querySelector("#uuid").value;
			const val = e.target.value;
			e.target.nextElementSibling.innerText = val;
			$.post(contextPath + "/changeMemberDate", {uuid: uuid, begin_date: val});
		}, false);
		
		
		
		
		
		
		const birth = document.querySelector("#birth");
		const btn_birth = document.querySelector("#btn_birth");
		const _picker= new MaterialDatetimePicker({
			el: birth,
			format: 'YYYY-MM-DD',
			openedBy: 'focus'
		});
		btn_birth.addEventListener('click', function() {
			_picker.open();
		}, false);
		birth.addEventListener('change', function(e) {
			const uuid = document.querySelector("#uuid").value;
			const val = e.target.value;
			e.target.nextElementSibling.innerText = val;
			$.post(contextPath + "/changeMemberDate", {uuid: uuid, birth: val});
		}, false);
	</script>
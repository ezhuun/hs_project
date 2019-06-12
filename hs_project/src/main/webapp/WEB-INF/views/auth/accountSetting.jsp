<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/ssi/ssi.jsp" %>

<style>
	.user_view_container {
		box-sizing: border-box;
		padding-left: 2rem;
		color: #919191;
		max-width: 37.5rem;
	}
	
	.user_view_container h4{
		color:#525577;
	}
	
	.user_view_group {
		position: relative;
		display: flex;
	}
	
	.user_view_rows {
		flex: 1;
		margin: 0 0 1rem;
	}
	
	.user_view_cols {
		margin: 0 0 1.75rem;
	}
	
	.user_view_selectionHeader {
		margin: 0 0 0.75rem;
		font-size: 1rem;
		font-weight: 600;
	}
	
	.user_view_info {
		margin: 0 0 0.75rem;
		font-size: 0.875rem;
		word-break: break-all;
	}
	
	.user_view_link {
		color: #3CABFA;
		font-size: 0.875rem;
	}
	.user_view_link span{
		cursor: pointer;
	}
	
	.user_profile_photo_area {
		position: relative;
		display: flex;
		flex-direction: column;
		align-items: center;
		justify-content: flex-start;
	}
	
	.user_profile_circle {
		position: relative;
		color: #fff;
		width: 7rem;
		height: 7rem;
		display: flex;
		align-items: center;
		justify-content: center;
		border-radius: 100%;
		margin-bottom: .5rem;
		overflow: hidden;
		background-color: #18A0FB;
	}
	
	.user_profile_circle span {
		font-size: 2rem;
		font-weight: bold;
	}
	
	.user_profile_circle input {
		display: none;
	}
	
	.user_profile_circle label::after {
		content: '\270E';
		position: absolute;
		top: 0;
		left: 0;
		width: 7rem;
		height: 7rem;
		display: flex;
		align-items: center;
		justify-content: center;
		border-radius: 100%;
		font-size: 1.5rem;
		color: #fff;
		background-color: rgba(0, 0, 0, .2);
		opacity: 0;
	}
	
	.user_profile_circle label:hover::after {
		opacity: 1;
	}
	
	.user_profile_circle img {
		position: absolute;
		top: 0;
		left: 0;
	}
	
	@media (max-width: 768px) {
		.user_view_group {
			display: flex;
   			flex-direction: column;
   			align-items: flex-start;
   			justify-content: center;
		}
	}
</style>

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
	        	<h4>커플 계정</h4>
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
				        	<div class="user_view_selectionHeader">연결관리</div>
				        	<div class="user_view_link"><span onclick="handleDisconnect('${member.uuid}');">연결 해제</span></div>
			        	</div>
		        	</div>
		        	<div class="user_profile_photo_area">
		        		<div class="user_profile_circle">
		        			<c:if test="${not empty member.lover.profile}">
		        				<img src="${root}/upload/profile/${member.lover.profile}" width="112"  onError="this.src='${root}/upload/profile/default.png'">
		        			</c:if>
		        		</div>
		        	</div>
	        	</div>
        	</c:if>
		</div>
	</div>





	<script src="${pageContext.request.contextPath}/js/auth.js" charset="utf-8"></script>
	
	<script>	
		//사진삭제 완료
		const popupDeletePhoto = function(){
			const uuid = document.querySelector("#uuid").value;
			$.ajax({
				url: contextPath + "/deletePhoto",
				method: "post",
				type: "json",
				data: {uuid: uuid},
				success: function (data) {
					if(data == "1"){
						utils.alert('삭제되었습니다', contextPath+'/accountSetting');
					}else{
						utils.alert('삭제 실패', contextPath+'/accountSetting');
					}
				}
			});
		}
		
		//이름변경 완료
		const handleClickChangeName = function(){
			utils.popupFormInitHelp();
			const uuid = document.querySelector("#uuid").value;
			const newName = document.querySelector("#newName").value;
			
			if(newName == ''){
				utils.popupFormCreateHelp(0, "- 이름을 입력해주세요");
				return;
			}else if(newName.length < 2){
				utils.popupFormCreateHelp(0, " - 최소 2자리 이상 입력해주세요");
				return;
			}
			
			const param = {uuid: uuid, name: newName}
			$.ajax({
				url: contextPath + "/changeName",
				method: "post",
				type: "json",
				data: param,
				success: function (data) {
					if(data != "0"){
						document.querySelector("#currentName").innerText = data;
						utils.popupFormClose();
					}
				}
			});
			
		}
		const popupChangeName = function(){
			const currentName = document.querySelector("#currentName").innerText;
			const title = '이름 변경';
			let form = '<div>변경할 이름<input type="text" id="newName" name="newName" value="'+currentName+'" onkeypress="if(event.keyCode==13)handleClickChangeName();"></div>';
			const button = '<button onclick="handleClickChangeName();">확인</button>';
			
			utils.popupForm(title, form, button);
		}
	

		//비밀번호변경 작업중
		const handleClickChangePasswd = function(){
			utils.alert('작업중');
		}
		
		const popupChangePasswd = function(){
			const title = '비밀번호 변경';
			let form = '';
			form += '<div>현재 비밀번호<input type="password" id="currentPasswdCheck" name="currentPasswdCheck"></div>';
			form += '<div>비밀번호<input type="password" id="newPasswd" name="newPasswd"></div>';
			form += '<div>비밀번호 확인<input type="password" id="newPasswdCheck" name="newPasswdCheck"></div>';
			const button = '<button onclick="handleClickChangePasswd();">확인</button>';
			
			utils.popupForm(title, form, button);
		} 
	</script>
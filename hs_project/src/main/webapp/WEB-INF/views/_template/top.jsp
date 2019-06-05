<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

		<div class="left-menu-container">
			<div class="left-menu-top"><span class="fa fa-times" onclick="handleClickToggleClose();"></span><img src="${pageContext.request.contextPath}/images/h_logo_bk.png" /></div>
			<div class="left-menu-auth">
				<div class="auth-logout" onclick="location.href='${pageContext.request.contextPath}/logout';"><span class="fa fa-sign-out"></span>로그아웃</div>
				<div class="auth-setting" onclick="location.href='${pageContext.request.contextPath}/accountSetting';"><span class="fa fa-cog"></span>개인설정</div>
			</div>
			<div class="left-menu-items">
				<div class="nav-bar">
					<ul class="nav-menu">
						<li><a href="#">D-day</a></li>
						<li><a href="#">체크리스트</a>
							<ul>
								<li>서브메뉴1</li>
								<li>서브메뉴2</li>
								<li>서브메뉴2</li>
							</ul>
						</li>
						<li><a href="#">발자취</a>
							<ul>
								<li>서브메뉴1</li>
							</ul>
						</li>
					</ul>
				</div>
			</div>
		</div>
		

		<div class="header-top">
			<div class="container-inner">
				<ul class="login-menu">
					<li><a href="${pageContext.request.contextPath}/logout"><span class="fa fa-heartbeat"></span> 로그아웃</a></li>
					<li><a href="${pageContext.request.contextPath}/accountSetting"><span class="fa fa-cog"></span> 개인설정</a></li>
				</ul>
			</div>
		</div>
		
		<div class="header-wrap">
			<div class="m-header">
				<div class="left-menu-toggle"><span class="fa fa-bars" onclick="handleClickToggleOpen();"></span></div>
				<div class="section-logo"><a href="${pageContext.request.contextPath}/main"><img src="${pageContext.request.contextPath}/images/h_logo_bk.png" /></a></div>
			</div>
		

			<div class="header">
				<div class="container-inner">
	
					<div class="nav">
						<div class="section-logo"><a href="${pageContext.request.contextPath}/main"><img src="${pageContext.request.contextPath}/images/h_logo.png" /></a></div>
						<div class="nav-bar">
							<ul class="nav-menu">
								<li><a href="#">D-day</a></li>
								<li><a href="#">체크리스트</a>
									<ul>
										<li>서브메뉴1</li>
										<li>서브메뉴2</li>
										<li>서브메뉴2</li>
									</ul>
								</li>
								<li><a href="${pageContext.request.contextPath}/diary/list">다이어리</a>
									<ul>
										<li>서브메뉴1</li>
									</ul>
								</li>
								<li><a href="#">익명게시판</a>
									<ul>
										<li>서브메뉴1</li>
										<li>서브메뉴1</li>
									</ul>
								</li>
							</ul>
						</div>
					</div>
				</div>
			</div>
		</div>
		
	<script src="${pageContext.request.contextPath}/js/utils.js" charset="utf-8"></script>
	<script src="${pageContext.request.contextPath}/js/common.js" charset="utf-8"></script>
	
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/ssi/ssi.jsp"%>


<!-- 여기부터 -->
<div class="container-inner sideBorder boxsing bootstrap">
	<%-- <b># 파일 다운로드 방법</b><br>
		경로설정 = ${root}/download?dir=/resources/upload/profile&filename=test.jpg<br>
		<a href="${root}/downloadr?dir=/resources/upload/profile&filename=test.jpg">다운로드</a>
		<br><br> --%>
	
		<form class="form-horizontal" name="frm" method="post">
			<input type="hidden" name="diary_num" id="diary_num"
				value="${diarydto.diary_num }">
			<input type="hidden" id="filename" name="filename"
				value="${diarydto.filename }">
			
			<div class="se-section-content">
				<p class="title">${diarydto.title }</p>
				<div class="container">
					<span class="writer_date"> 
						<span class="profile"> <img src="#">
						<!-- 작성자 프로파일 -->
						</span> 
						<span class="uuid">${diarydto.uuid }</span> <i class="dot"> ・
					</i> <span class="date">${diarydto.regdate }</span>
					<!-- 작성날짜 -->
					</span>

				</div>
			</div>

			<hr>

			<div class="se-main-container">
				
				<div>${diarydto.content }</div>
			</div>
		</form>
		<hr>
	
		<!-- 댓글 -->
		<div class='row'>
			<div class="col-lg-12">
				<!-- /.panel -->
				<div class="panel panel-default">
					
					<!-- 댓글갯수 -->
					<div class="panel-heading">
						<i class="fa fa-comments fa-fw"></i>
							<span>댓글   ${drdto.rcount }</span>
							
						<!-- <button id='addReplyBtn' class='btn btn-primary btn-xs pull-right'>NewReply</button> -->
					</div>
					
					<!-- /.panel-heading 댓글의 목록,등록이 보여지는 곳-->
					<div class="panel-body">
						<!-- 댓글 list -->
						<ul class="replylist list-group" style="background-color: #F2F2F2;">
							<!-- li로 계속 댓글이 추가됨 -->
							<li class="left clearfix" data-rno="12">
								<div><!-- 내용까지 포함 -->
									<table>
										<tr> <!-- 1행 -->
											<td rowspan="2" class="imgtd" style="padding: 5px;">
												<div>
													<img src="${root }/images/diary/defaultprofile.jpg" width="50" height="50">
												</div>
											</td>
											
											<td style="text-align: left;"><span>name</span><span> 날짜</span><span> 수정/삭제</span>
											</td>
										</tr>
										
										<tr>
										<td colspan="3">
										  <p>  ceefeewgtentrrrrrrrrgggggggrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrhhh</p>
										  </td>
										</tr>
									</table>
								</div>
							</li>
						</ul>
						<!-- ./ end ul 댓글목록 -->
						
						<!-- 댓글등록 -->
						  <div class="replycreate" style="width: 100%">
						    <div class="form-group" style="display: flex">
						      <textarea name= "content" id="content" rows="2" style="width: 90%" ></textarea>
						      <div class="createbtn" style="flex:1; text-align: center;border-color: #ccc; background-color: #ccc;">
						        <a href="#" id="createbtn" style="display: inline-block;width: 100%;height: 50%;line-height: 50px;">등록</a></div> <!-- height와 line-height가 동일해야지 정가운데 배치 -->
						      <!-- <button style="flex:1" id='createbtn' class='btn btn-primary btn-xs pull-right'>등록</button> -->
						    </div>
						  </div>
					</div>
					<!-- 댓글페이지 -->
					<div class="panel-footer"></div>
				</div>
			</div>
		</div>
		
		
		<!-- 다이어리 글 관련버튼 -->
		<button type="button" onclick="location.href='./list'">목록</button>
		<button type="button" onclick="update()">수정</button>
		<button type="button" onclick="location.href='./create'">생성</button>
		<button type="button" class="btn btn-defulat" id="btnDelete">삭제</button>
</div>	





<!-- 자신의 js는 아래 script태그를 만들어서 사용 -->
<script>
	function update(){
		var url = "update";
		url += "?diary_num=${diarydto.diary_num}";
		location.href = url;
	}
	
</script>
<script>
	$(document).ready(function(){
		$("#btnDelete").click(function(){
			if(confirm("삭제하시겠습니까?")){
				document.frm.action = "./delete";
				document.frm.method="post";
				document.frm.submit();
			}
		})
	})
</script>

<!-- AJAX처리파일사용 -->
<script type="text/javascript" src="${root }/js/diaryreply.js"></script>

<script type="text/javascript">


	$(document).ready(function() {
		//댓글목록,생성,수정,삭제 처리(위에 댓글관련 영역의 id나 class를 이용하여)
		var diary_num = '<c:out value="${diary_num}"/>';
		var sno = '<c:out value="${sno}"/>';
		var eno = '<c:out value="${eno}"/>';
		var replyUL = $(".replylist");

		showReplyList();//댓글목록보여주는 함수 호출
		
		function showReplyList(){
			//ajax파일에서 목록을 보여주는 getList로 데이터를 전송(파라메터는 diary_num,sno,eno)
			replyService.getList(
				//첫번째 인자(param)에 들어갈 데이터를 JSON형식으로 전송
				{
					diary_num : diary_num,
					sno : sno,
					eno : eno
				},
				//두번째 인자(callback)에 들어갈 데이터, list는 js파일에서 가지고 온 데이터
				function (list){
					//console.log(list);
					var str = "";
					if(list == null || list.length == 0){
						str = "댓글이 없습니다."
						return;
					}
					for(var i=0, len = list.length || 0; i < len; i++){
						//1행1열이미지추가
						str += "<li class='list-group-item' id='"+list[i].r_num+"'  data-r_num='"+list[i].r_num+"'>"
							+ "<div id='divList'><table><tr><td rowspan='2' class='imgtd' style='padding: 5px'>"
							+ "<div><img src='${member.profile}' width='50' height='50'>"
							+ "</div></td>";
						//1행2열 이름,날짜,수정삭제 추가
						str += "<td style='text-align: left'>"
							+ "<span>"+ list[i].name +"</span>"
							+ "<span>"+ list[i].regdate +"</span>";
							if('${member.name}' == list[i].name){
								str += "<span> <a href='#' id='modifybtn'>수정</a> <a href='#' id='deletebtn'> 삭제</a></span>";
							}
						str	+= "</td></tr>";
						//2행 내용 추가
						str += "<tr><td colspan='3'><p>"
							+list[i].content
							//+ replaceAll(list[i].content,'\n', '<br>')
							+ "</p></td></tr></table></div></li>";
						
					}//for end
					
					replyUL.html(str);
		
					//댓글페이지 함수 호출
					showReplyPage();
				});//function list end, getList end	
			
		}//showReplyList end
		
		var nPage = '<c:out value="${nPage}"/>';
		var nowPage = '<c:out value="${nowPage}"/>';
		var replyPageFooter = $(".panel-footer");
		var param = "nPage=" + nPage;
			param += "&nowPage=" + nowPage;
			param += "&diary_num=" + diary_num;
		
		//댓글페이지 함수
		function showReplyPage(){
			replyService.getPage(param,
								function (paging){
									var str = "<div><small class='text-muted'>"
											+ paging 
											+ "</small></div>";
									
									replyPageFooter.html(str);	
			});	
		}
		
		var replycreate =$(".replycreate")
		var replycontent = replycreate.find("textarea[name='content']");
		var createbtn = $("#createbtn");
		
		//댓글 등록 처리
		createbtn.on("click",function(e){
			e.preventDefault();
			if(replycontent.val() == ''){
				alert("댓글을 입력하세요.")
				return;//else문이 필요없음
			}
			var reply = {
						content : replycontent.val(),
						diary_num : '<c:out value="${diary_num}"/>',
						name : '<c:out value="${member.name}"/>',
						uuid : '<c:out value="${member.uuid}"/>'
			}
			//console.log(reply);
			replyService.add(reply, function(create){
				alert(create);
				replycontent.val("") ;
				
				showReplyList();
			
			});//end add
		
		});//end createbtn
		
		var modifybtn = $("#modifybtn");
		
		//댓글 수정 처리 x------------------------------------------------------
		$(document).on("click","modifybtn" ,function(e){
		
		e.preventDefault();
		alert("수정입니까?");
			//id가 divList인 내부요소를 모두 삭제
			//해당 divList만 삭제해야됨
			//$("#divList *").remove();
			var r_num = $(this).data("r_num");//
			var name = $(this).data("name");
			var regdate = $(this).data("regdate");
			
			var str = "";
			str += "<table><tr><td>"
				+  "<span>" + name + "</span>"
				+  "<span>" + regdate + "</span>"
				+  "</td></tr>";
			str += "<tr><td>"
				+  "<div class='replyupdate' style='width: 100%'>"
				+  "<div class='form-group' style='display: flex'>"
				+  "<textarea name='updatecontent' rows='2' style='width: 90%'></textarea>"
				+  "<div class='updatebtn' style='flex:1; text-align: center;border-color: #ccc; background-color: #ccc;'>"
				+  "<a href='#' id='updatebtn' style='display: inline-block;width: 100%;height: 50%;line-height: 50px;'>수정</a>"
				+  "</div></div></div></td></tr></table>";
				
			$("#divList *").append(str);	
			
			var replycontent = replyupdate.find("textarea[name='updatecontent']");
			var reply = {
				r_num : replyupdate.data("r_num"),
				content : replycontent.val()
			};
			replyService.update(reply,function (update){
				alert(update);
				showReplyList();
			
			});//end update
			
		});//end modifybtn
		
		
	
	});
	
	//실행 o   등록버튼 실행 동적, 수정 클릭
	
	$(document).on("click","#modifybtn" ,function(e){
		e.preventDefault();
		alert("수정입니까?");
			
			//id가 divList인 내부요소를 모두 삭제
			//해당 divList만 삭제해야됨
			//$("#divList *").remove();
			
			//$(this).parents("#divList").remove();
			var r_num = $(this).parents("li").data("r_num");//
			var name = "${member.name}";
			var regdate = "${diary_reply.regdate}";
		
			//$("#divList *").remove();
			
			var str = "";
			str += "<table><tr><td>"
				+  "<span>" + name + "</span>"
				+  "<span>" + regdate + "</span>"
				+  "</td></tr>";
			str += "<tr><td>"
				+  "<div class='replyupdate' style='width: 100%'>"
				+  "<div class='form-group' style='display: flex'>"
				+  "<textarea name='updatecontent' rows='2' style='width: 90%'></textarea>"
				+  "<div class='updatebtn' style='flex:1; text-align: center;border-color: #ccc; background-color: #ccc;'>"
				+  "<a href='#' id='updatebtn' style='display: inline-block;width: 100%;height: 50%;line-height: 50px;'>수정</a>"
				+  "</div></div></div></td></tr></table>";
			$(this).parents("#divList").append(str);	
			//$("#divList *").append(str);	
			
			/* var replycontent = replyupdate.find("textarea[name='updatecontent']");
			var reply = {
				r_num : replyupdate.data("r_num"),
				content : replycontent.val()
			};
			replyService.update(reply,function (update){
				alert(update);
				showReplyList();
			
			});//end update */
			
		});//end modifybtn
	
		//수정버튼 클릭시 발생
		$(document).on("click","#updatebtn", function(){
			
			var replycontent = replyupdate.find("textarea[name='updatecontent']");
			var reply = {
				r_num : replyupdate.data("r_num"),
				content : replycontent.val()
			};
			replyService.update(reply,function (update){
				alert(update);
				showReplyList();
			
			});//end update 
			
		});
		
		
		//삭제 클릭시 발생
		$(document).on("click","#deletebtn",function(){
			alert("삭제하시겠습니까?");
			var r_num= $(this).parents("li").data("r_num");
			//var r_num = $(".replycreate").data("r_num");
			
			replyService.remove(r_num, function(result) {
			alert(result);
			
			showReplyList();
			
			});
		});
		

</script>

<style>
	.panel-body{
		padding: 0px;
	}
	.reply-contet{
		    padding: 10px;
		    border-width: 1px;
		    border-style: solid;
	}
</style>
<style>
.title {
	padding: 5px;
	font-size: 50px;
	text-align: center;
}

.se-main-container {
	text-align: center;
}

.bootstrap .container {
	padding-right: 15px;
	padding-left: 15px;
	margin-right: auto;
	margin-left: auto;
	padding: 20px;
}

.bootstrap p {
	margin: 0 0 20px;
}
</style>

<!-- 여기까지 -->
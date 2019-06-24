<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/ssi/ssi.jsp"%>
<%@ taglib prefix="util" uri="/ELFunctions" %>


<!-- 여기부터 -->
<div class="container-inner sideBorder boxsing">
<div class="bootstrap" style="width: 100%">
	<%-- <b># 파일 다운로드 방법</b><br>
		경로설정 = ${root}/download?dir=/resources/upload/profile&filename=test.jpg<br>
		<a href="${root}/downloadr?dir=/resources/upload/profile&filename=test.jpg">다운로드</a>
		<br><br> --%>
	
		<form class="form-horizontal" name="frm" method="post" >
			<input type="hidden" name="diary_num" id="diary_num" value="${diarydto.diary_num }">
			<input type="hidden" id="filename" name="filename" value="${diarydto.filename }">
			
			<div class="panel" id="topic">
				<h2 class="title" style="margin-top: 10px; margin-bottom: 30px; ">${diarydto.title }</h2>
					<span class="profile"> <img src="${diarydto.profile }"></span> 
					<span class="uuid">${diarydto.uuid }</span> 
					<span class="date">${diarydto.regdate }</span>
			</div>
			
			<div class="panel area" id="d_content">		
				<div>${diarydto.content }</div>
			</div>
		</form>
		
		<!-- 댓글 -->
		<div class='row'>
			<div class="col-lg-12">
				<!-- /.panel -->
				<div class="panel panel-default" >
					
					<!-- 댓글갯수 -->
					<div class="panel-heading">
						<i class="fa fa-comments fa-fw"></i>
							<c:set var="rcount" value="${util:rcount(diary_num,drinter) }"/>
							<strong>댓글</strong> 
							<c:if test="${rcount>0 }"><strong>${rcount}</strong></c:if> 
					</div>
					
					<!-- /.panel-heading 댓글의 목록,등록이 보여지는 곳-->
					<div class="panel-body">
						<!-- 댓글 list -->
						<ul class="replylist list-group">
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
						  <!-- 댓글페이지 -->
						  <div class="panel-footer"></div>
					</div>
					
					
				</div>
			</div>
		</div>
		
		
		<!-- 다이어리 글 관련버튼 -->
		<div align="right">
			<button type="button" class="btn btn-default" onclick="location.href='./create'">글쓰기</button>
			<button type="button" class="btn btn-default" onclick="update()">수정</button>
			<button type="button" class="btn btn-default" id="btnDelete">삭제</button>
			<button type="button" class="btn btn-default" onclick="location.href='./list'">목록</button>
		</div>
	</div>
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
var r_num_list = new Array;
var r_num = "";
var upstr = "";
var click = 0;//입력한 댓글의 수정을 누를때마다 수정창이 열리는것을 방지	
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
					console.log(list);
					var str = "";
					if(list == null || list.length == 0){
						str = ""
						
					}
					for(var i=0, len = list.length || 0; i < len; i++){
						//1행1열이미지추가
						str += "<li class='list-group-item' id='"+list[i].r_num+"'  data-r_num='"+list[i].r_num+"'>"
							+ "<div class='divList' id='"+list[i].r_num+"'><table id='tableList'><tr><td rowspan='2' class='imgtd' style='padding: 5px'>"
							+ "<div><img class='img-rounded'  src='${list.profile}' width='50' height='50'>"
							+ "</div></td>";
						//1행2열 이름,날짜,수정삭제 추가
						str += "<td style='text-align: left'>"
							+ "<span><strong>"+ list[i].name +"</strong></span>&nbsp;"
							+ "<span class='date'>"+ list[i].regdate +"</span>&nbsp;";
							if('${member.name}' == list[i].name){
								str += "<span class='updel'> <a href='#' class='modifybtn'  id='"+list[i].r_num+"'>수정</a> <a href='#' id='deletebtn'> 삭제</a></span>";
							}
						str	+= "</td></tr>";
						//2행 내용 추가
						str += "<tr><td colspan='3'><p>"
							+list[i].content
							//+ replaceAll(list[i].content,'\n', '<br>')
							+ "</p></td></tr></table></div></li><hr id='style'>";
						
					}//for end<\
					
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
									var str = //"<small class='text-muted'>"
											 paging ;
											//+ "</small>";
									
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
		
		//댓글 수정 처리
		var modifybtn = $(".modifybtn");
		
			
		$(document).on("click",".modifybtn" ,function(e){
			e.preventDefault();
			
		
			var r_num = $(this).parents("li").data("r_num");		
			var name = "${member.name}";			
			var upstr = "";
			r_num_list.push(r_num);
			//배열에 r_num을 계속 저장(append) 그전꺼랑 현재꺼를 수정취소
			//regdate, content등을 가지고 오기 위해서 read비동기통신으로 저장된 값을 가지고 옴
			//수정 클릭시 발생
			replyService.get(r_num,function(result){
		
				var regdate = result.regdate;			
				var beforecontent = result.content;
				
				
				upstr   += "<p>"
						+  "<span><strong>" + name + "</strong></span>"
						+  "<span>" + regdate + "</span>"
						+  "<span> <a href='#' class='cancelbtn' id='cancelbtn"+r_num+"'>수정취소</a> "
						+  "</p>";
					
				upstr	+=  "<div class='replyupdate' style='width: 100%'>"
						+  "<div class='form-group' style='display: flex'>"
						+  "<textarea name='updatecontent' rows='3' style='width: 90%'>"+beforecontent+"</textarea>"
						+  "<div class='updatebtn' style='flex:1; text-align: center;border-color: #ccc; background-color: #ccc;'>"
						+  "<a href='#' id='updatebtn' style='display: inline-block;width: 100%;height: 50%;line-height: 50px;'>수정</a>"
						+  "</div></div></div>";
					
	            	$("#"+r_num).append(upstr);
	            	//r_num_list.push(result.r_num);
	            	click++;
					 //값추가
					//console.log(r_num_list);
	            	
				});//end get 	
								
				$(this).parents("#tableList").remove();
			 	
			 	console.log("777888");
			 	console.log(r_num_list);


			 	if(r_num_list.length>0){//이미 선택한 수정창이 존재
			 		//그전 댓글수정창만 닫음
			 		if(r_num_list[1] !=null){
			 			alert("88888~");
			 			console.log(r_num_list[0]);
			 			console.log("#cancelbtn"+r_num_list[0]);
			 			$("#cancelbtn1"+r_num_list[0]).trigger("click");
			 			
			 		}
					//$("#cancelbtn").trigger("click");									
				} 
				
				
				
				
		});//end modifybtn
	
		//수정'버튼' 클릭시 발생
		$(document).on("click","#updatebtn", function(){
			
			alert(click);
			var replycontent = $(".replyupdate").find("textarea[name='updatecontent']");
						
			
			var reply = {
				r_num : $(this).parents("li").data("r_num"),
				content : replycontent.val()
			};
			
			
			replyService.update(reply,function (update){
				alert(update);
				showReplyList();
			
			});//end update  
			click =0;
		});
		
		//수정취소 클릭시 발생
		$(document).on("click",".cancelbtn", function(){
				showReplyList();
				console.log(upstr);
				console.log(r_num);
				$("#"+r_num).append(upstr);
				click=0;		
		});
		
		//삭제 클릭시 발생
		$(document).on("click","#deletebtn",function(){
			if(confirm("삭제하시겠습니까?")){
			var r_num= $(this).parents("li").data("r_num");
			//var r_num = $(".replycreate").data("r_num");
			
			replyService.remove(r_num, function(result) {
			alert(result);
			
			
			showReplyList();
			});
			}
		});
		
	
});//end page loading

		

</script>

<style>
.panel-body{
		padding: 0px;
		background-color: #f5f5f5;
	}
.reply-contet{
		    padding: 10px;
		    border-width: 1px;
		    border-style: solid;
	}
.panel-heading {
    color: #333;
    border-color: #ddd;
    background-color: rgb(255, 255, 255) !important; 
}
/* .title {
	padding: 5px;
	font-size: 50px;
	text-align: center;
} */


.bootstrap .container {
	padding-right: 15px;
	padding-left: 15px;
	margin-right: auto;
	margin-left: auto;
	padding: 20px;
}
#topic{
	border-top: 2px solid rbga(123,133,160,0.8) !important; 
	border-bottom: 2px solid rgba(123,133,160,0.8);
	
	padding: 10px 0px;
	margin: 20px;
}
.panel{
	border-style: none;
	border-top: 2px;
	height: 80%;
	text-align: left;
}
.title{
	width :100%;
	margin: 20px 0;
	text-align: left;
	font-size: 20px;
}
#d_content{
	text-align: center;
}
#replypanel{
	color: #333;
    border-color: #ddd;
}

.list-group-item{
	background-color: #f5f5f5 !important;
	border: 0px !important; 
	padding: 0px !important;
	/* //border-bottom :1px dashed !important;
	//border-top: 1px dashed !important; */
}
/*--hr태그 */
#style{
	border: 0.5px dashed !important; 
	margin-top: 10px;
    margin-bottom: 10px;
    color: gray;
}
.panel-footer{
padding: 0px !important;
}
.date{
	color:gray;
}
.updel{
	  
	    color: gray;
}
</style>

<!-- 여기까지 -->
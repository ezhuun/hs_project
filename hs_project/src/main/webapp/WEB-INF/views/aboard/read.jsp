<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/ssi/ssi.jsp" %>
<link rel="stylesheet" href="${root }/css/aboardRead.css" type="text/css"/>
	<!-- 여기부터 -->
	<div class="container-inner sideBorder boxsing">
		<div class="bootstrap">
		<form class="form-horizontal" name="frm" method="post" style="width: 80%;">
		<input type="hidden" name="a_num" id="a_num" value="${dto.a_num }">
		
			<div class="panel" id="topic">
				<h3 class="title" style="margin-top: 10px"> ${dto.title}</h3>
				<span class="name">${dto.a_name}</span>
				<span class="date">${dto.regdate}</span> 
				<span class="reply">조회수 : ${dto.viewcnt}</span>
			</div>	
		
			<div class="panel area">
				${dto.content}
			</div>
			<div class="btn-group btn-xs" style="float:right" > 
				<button type="button" class="btn btn-default btn-xs" onclick="location.href='./create'">등록</button>
				<button type="button" class="btn btn-default btn-xs" onclick="updateM();">수정</button>
				<button type="button" class="btn btn-default btn-xs" id="btndelete">삭제</button>
				<button type="button" class="btn btn-default btn-xs" onclick="listM();" id="showlist">목록</button>
			</div>
		</form>	
		<!-- 댓글시작 -->
	
		    
		  
			<div style="width:80%;">
        		<form id="commentForm" name="commentForm" >
        		<label for="comment"  style="margin-bottom:0" >comment</label>
        		<input type="hidden" name="a_num" value="${dto.a_num}"/>
        		<div class="sideBorder-comment">
        		<input type="text"id="r_name" name="r_name" style="width:15%; margin:1% 0;" placeholder="닉네임"  >  
        			<div style='display:flex;'>
        				<textarea style='width:831px; height:50px; ' placeholder="고운말을 사용해주세요." id="content" name="content" ></textarea>
						<button type="button" class="btn" id="commentInBtn">등록</button>
		            </div>
		        </div>                        
      	    	</form>
      	    </div>	
      	    
      	    <div class="commentList" style="width:80%" ></div>
      		<div class="rpaging"></div>        
		</div>
		
	</div>
		
			
	<!-- 자신의 js는 아래 script태그를 만들어서 사용 -->
	
	<script>
		$(document).ready(function(){
			$("#btndelete").click(function(){
				if(confirm("삭제하시겠습니까?")){
					document.frm.action = "./delete";
					document.frm.method = "post";
					document.frm.submit();
				}
			})
		})
	</script>
	
	<script type="text/javascript">
		function updateM(){
			var url = "update";
			url +="?a_num=${dto.a_num}";
			url += "&col=${param.col}";
			url += "&word=${param.word}";
			url += "&nowPage=${param.nowPage}"
  
			location.href=url;   	          
		}

		
		function listM(){
		
			var url = "list";
			url += "?col=${param.col}"; 
			url += "&word=${param.word}";
			url += "&nowPage=${param.nowPage}"
			
			location.href=url;
		
		}	
	</script>	

	<script type="text/javascript">
		//페이지 로딩시 댓글 목록 출력
		$(document).ready(function(){
			commentList(); 
		});
	
		var a_num = '<c:out value="${a_num}"/>';//게시글 번호
		var sno = '<c:out value="${sno}"/>';
		var eno = '<c:out value="${eno}"/>';
		var nPage = '<c:out value="${nPage}"/>';
		var nowPage = '<c:out value="${nowPage}"/>';
		var colx = '<c:out value="${col}"/>';
		var wordx = '<c:out value="${word}"/>';
		var rpaging = $(".rpaging");
		var click = 0;
	
		//댓글 등록 버튼 클릭
		$("#commentInBtn").on("click",(function(){
			//commentForm의 내용을 가져옴, serialize()로 받아오므로 json형식이 아니라 requestbody 쓸 수 없음
			var insertData = $("#commentForm").serialize(); 
			commentInsert(insertData); //Insert 함수호출(아래)
		}));
	
	
		//댓글 등록
		function commentInsert(insertData){
			$.ajax({
			    url : './aboardreply/create',
			    type : 'post',
			    data : insertData,
			    success : function(data){
			        if(data == "success") {   
			            commentList(); //댓글 작성 후 댓글 목록 reload
			            $('#r_name').val('');
			            $('#content').val('');
			        }
			    }
			});
		}
	
	
	
		//댓글 목록 
		function commentList(r_num){
			$.ajax({
			    url : './aboardreply/list/'+a_num+'/'+sno+'/'+eno+'.json',
			    type : 'get',
			    success : function(data){
			        var a =''; 
			        $.each(data, function(key, value){
			        	a += '<div class="panel commentArea" style="width:95%; margin:1% 2.5%;" id="'+value.r_num+'">';
			            a += '<span class="commentname" style="font-size:12px; padding-right:5px;">'+value.r_name+'</span>';
			            a += '<span class="commentdate" style="font-size:10px; color:gray;">'+value.regdate+'</span>';
			            a += '<a style="padding-left:3px" id="'+value.r_num+'" onclick="commentUpdate('+value.r_num+',\''+value.content+'\' ,\''+value.r_name+'\', \''+value.regdate+'\');">수정</a> ';
			            a += '<a onclick="commentDelete('+value.r_num+');">삭제</a> ';
			            a += '<div class="commentContent" style="font-size:14px; color:black" >'+value.content+'</div>';
			            a += '</div>';
			        });
			        
			        $(".commentList").html(a);    
			        showPaging(); //댓글목록 페이징
			        if(r_num){
			        	$('a[id="'+r_num+'"]').trigger("click"); 
			        }
			    }
			});
		}
		
		function showPaging(){
			var param = "nPage="+nPage;
				param += "&nowPage="+nowPage;
				param += "&a_num="+a_num;
				param += "&col="+colx;
				param += "&word="+wordx;
				
			$.ajax({
				type : 'get',
				url : "./aboardreply/page",
				data : param,
				contentType : "application/text; charset=utf-8",
				success : function(data) {
					
					var str = "<div><small class='text-muted'>"+data+"</small></div>";
					rpaging.html(str);		
					
				}
			});
		}
	
			
		//댓글 수정 - 댓글 내용 출력을 input 폼으로 변경 
		function commentUpdate(r_num, content,r_name, regdate){
			
			console.log("clicked: " + click);
			var a ='';
			a += '<span class="commentname" style="font-size:12px; margin-right:10px;">'+r_name+'</span>';
			a += '<span class="commentdate" style="font-size:10px; color:gray; magin-left:10px;">'+regdate+'</span>';
			a += '<span style="padding-left:5px; font-size:12px; cursor:pointer;" id="commentUpdateCancel">수정취소</span> ';	
			a += '<div style="display:flex;">';
			a += '<textarea style="width:816px; height:50px" name="content_'+r_num+'">'+content+'</textarea>';
			a += '<button class="btn" type="button" id="commentUpBtn" onclick="commentUpdateProc('+r_num+');">수정</button>';
			a += '</div>';
			
			click++;
			if(click>1){
				commentList(r_num);
				click = 0;
			}
			
			
			$("div#"+r_num+".commentArea").html(a);
			
			
			
			
		}
	
		//댓글 수정
		function commentUpdateProc(r_num){
			var updateContent = $('[name=content_'+r_num+']').val();
			var param = {'content' : updateContent, 'r_num' : r_num};
		
			$.ajax({
			    url : './aboardreply/update/'+r_num,
			    type : 'put',
			    data : JSON.stringify(param),
			    contentType:"application/json", 
			    success : function(data){
			        if(data == "success") commentList(r_num); //댓글 수정후 목록 출력 
			    }
			
			});
		
					
		}
		
		//댓글수정취소
		$(document).on("click","#commentUpdateCancel",function(){
			commentList();
		});
		
	
		 
		//댓글 삭제 
		function commentDelete(r_num){
			$.ajax({
			    url : './aboardreply/delete/'+r_num,
			    type : 'delete',
			    success : function(data){
			        if(data == "success") {
			        	commentList(); //댓글 삭제후 목록 출력 
			        }
			    }
			});
		}

	</script>
	
	<!-- 여기까지 -->
	
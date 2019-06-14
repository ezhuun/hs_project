<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/ssi/ssi.jsp" %>
	<style type="text/css">
	#topic{
	    border-top: 2px solid rgba(123, 133, 160, 0.8);
	    border-bottom: 2px solid rgba(123, 133, 160, 0.8);
	    width: 100%;
	    padding: 10px 0px;
	}
	
	.panel{
		border-style: none;
		border-top: 2px;
		hight: 80%;
	}
	
	.title{
		margin: 20px 0;
	}
	
	.reply{
    	font-size: 11px;
    	padding-left: 6px;
    	padding-top: 3px;
    	color: #999;
    	float:right;
	}
	
	.name, .date {
	    font-size: 11px;
	   	padding-left: 3px;
    	padding-top: 3px;
	    color: #999;
	    text-align: left;
	    letter-spacing: -1px;
	}
	
	.bootstrap{
	    display: flex;
	    flex-direction: column;
	    justify-content: center;
	    align-items: center;
	    
	}
	.area{
		min-height:400px;
	}

	
	#rcontent{
		max-width:90%;
		border-radius:unset;		
	}
	
	button{
		border-radius:unset !important;
	}
	
	.sideBorder-comment{
		border-top: 3px solid rgba(123, 133, 160, 0.8); 
		margin-top: 0;
		background-color:rgba(123, 133, 160, 0.2) 
	
	}
	
	#commentBtn{
		width:70px;
		background-color: #7b85a0; 
		margin-bottom:1%;
		color:white; 
	}

	
	</style>

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
				<button type="button" class="btn btn-default btn-xs" onclick="listM();">목록</button>
			</div>
		</form>	
		<!-- 댓글시작 -->
	
		    
		  
			<div style="width:80%;">
        		<form name="commentForm" >
        		<label for="comment"  style="margin-bottom:0" >comment</label>
        		<input type="hidden" name="a_num" value="${dto.a_num}"/>
        		<div class="sideBorder-comment">
        		<input type="text"id="r_name" name="r_name" style="width:15%; margin:1% 2%;" placeholder="닉네임"  >  
        			<div style='display:flex;'>
        				<textarea style='width:827px; margin:0 0 1% 2%' placeholder="고운말을 사용해주세요." ></textarea>
						<button type="button" class="btn" id="commentBtn">등록</button>
		            </div>
		        </div>                        
      	    	</form>
      	    </div>	
      	    
      	    <div class="commentList" style="width:80%" ></div>
      		<div>${rpaging }</div>        
		</div>
		
	</div>
		
	
		
		
	<!-- 자신의 js는 아래 script태그를 만들어서 사용 -->
	<script src="${root}/ckeditor/ckeditor.js"></script>
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
    <script>
	var a_num = '${dto.a_num}'; //게시글 번호
 
	$('[name=commenBtn]').click(function(){ //댓글 등록 버튼 클릭시 
    var insertData = $('[name=commentForm]').serialize(); //commentInsertForm의 내용을 가져옴
    commentInsert(insertData); //Insert 함수호출(아래)
});
 
 
 
//댓글 목록 
function commentList(){
    $.ajax({
        url : './aboardreply/list/'+a_num+'/1/5.json',
        type : 'get',
        success : function(data){
            var a =''; 
            $.each(data, function(key, value){
            	a += '<div class="panel commentArea" style="width:95%; margin:1% 2.5%;">';
                a += '<span class="commentInfo" style="font-size:12px; margin-right:10px;">'+value.r_name;
                a += '<span class="commentInfo" style="font-size:10px; color:gray; magin-left:10px;">'+value.regdate;
                a += '<a onclick="commentUpdate('+value.r_num+',\''+value.comment+'\');"> 수정 </a>';
                a += '<a onclick="commentDelete('+value.r_num+');"> 삭제 </a> ';
                a += '<div class="commentContent" style="font-size:14px; color:black"'+value.r_num+'">'+value.content +'</p>';
                a += '</div></div>';
            });
            
            $(".commentList").html(a);
        }
    });
}
 
//댓글 등록
function commentInsert(insertData){
    $.ajax({
        url : './aboardreply/create',
        type : 'post',
        data : insertData,
        success : function(data){
            if(data == 1) {
                commentList(); //댓글 작성 후 댓글 목록 reload
                $('[name=comment]').val('');
            }
        }
    });
}
 
//댓글 수정 - 댓글 내용 출력을 input 폼으로 변경 
function commentUpdate(r_num, comment){
    var a ='';
    
    a += '<div class="input-group">';
    a += '<input type="text" class="form-control" name="comment_'+r_num+'" value="'+content+'"/>';
    a += '<span class="input-group-btn"><button class="btn btn-default" type="button" onclick="commentUpdateProc('+r_num+');">수정</button> </span>';
    a += '</div>';
    
    $('.commentContent'+r_num).html(a);
    
}
 
//댓글 수정
function commentUpdateProc(r_num){
    var updateContent = $('[name=comment_'+r_num+']').val();
    
    $.ajax({
        url : './aboardreply/update',
        type : 'post',
        data : {'comment' : updateContent, 'r_num' : r_num},
        success : function(data){
            if(data == 1) commentList(a_num); //댓글 수정후 목록 출력 
        }
    });
}
 
//댓글 삭제 
function commentDelete(r_num){
    $.ajax({
        url : './aboardreply/delete/'+r_num,
        type : 'post',
        success : function(data){
            if(data == 1) commentList(r_num); //댓글 삭제후 목록 출력 
        }
    });
}
 
 
 
 
$(document).ready(function(){
    commentList(); //페이지 로딩시 댓글 목록 출력 
});
 
 
 
</script>

	

	
	<!-- 여기까지 -->
	
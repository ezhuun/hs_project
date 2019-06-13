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
		min-height:500px;
	}

	
	#rcontent{
		max-width:95%;
		border-radius:unset;		
	}
	
	button {
		border-radius:unset !important;
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
	
			<div> 
				<button type="button" class="btn btn-default btn-xs" onclick="location.href='./create'">등록</button>
				<button type="button" class="btn btn-default btn-xs" onclick="updateM();">수정</button>
				<button type="button" class="btn btn-default btn-xs" id="btndelete">삭제</button>
				<button type="button" class="btn btn-default btn-xs" onclick="listM();">목록</button>
			</div>
			
			
			<!-- 댓글시작 -->
			
			
			<div class="container">
		        <div class="commentList"></div>
		    </div>
	  
			<div class="panel" style="margin-top: 20px;">
        		<label for="comment">comment</label>
        			<div class="panel" style="display: flex;">
		                <input type="hidden" name="a_num" value="${dto.a_num}"/>
		                <input type="text" class="form-control" id="rcontent" placeholder="내용을 입력하세요." >
		                <button class="btn btn-default" type="button" >등록</button>
                    </div>
      	    </div>
      	    
		</form> 
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
	<script type="text/javascript" src="${root }/js/aboardreply.js"></script>
	<script type="text/javascript">
		$(document).ready(function () {
		  
		var a_num = '<c:out value="${a_num}"/>';
		var sno = '<c:out value="${sno}"/>';
		var eno = '<c:out value="${eno}"/>';
		var replyUL = $(".chat");
		  
		showList(); //댓글을 보여주기 위한
		
		function showList(){
		    replyService.getList({a_num:a_num,sno:sno,eno:eno}, function(list) {
		            
				var str="";
		     
		    	if(list == null || list.length == 0){
		     		return;
		     	}
		     
		     	for (var i = 0, len = list.length || 0; i < len; i++) {
		    	 	str +="<div><div class='header'><strong class='primary-font'>"+list[i].id+"</strong>"; 
		    	 	str +="<small class='pull-right text-muted'>"+list[i].regdate+"</small></div>";
		    	 	str +=replaceAll(list[i].content,'\n','<br>')+"</div></li>";
		     	}
		 
		     	replyUL.html(str);
		     
		     	showReplyPage();	 
		 
			});//end getList function 호출   
		     
		}//end showList	  
		
		function replaceAll(str, searchStr, replaceStr) {		
			
			return str.split(searchStr).join(replaceStr);
		
		}
		 
		var nPage = '<c:out value="${nPage}"/>'; //bbsController에서 받아오는 데이터
		var nowPage = '<c:out value="${nowPage}"/>';
		var colx = '<c:out value="${col}"/>';
		var wordx = '<c:out value="${word}"/>';
		var replyPageFooter = $(".panel-footer");
		
		 
		function showReplyPage(){
			var param = "nPage="+nPage;
			
			param += "&nowPage="+nowPage;
			param += "&a_num="+a_num;
			param += "&col="+colx;
			param += "&word="+wordx;
							 
			replyService.getPage(param, function(paging) {
		 
		 		console.log(paging);
		 
		    	var str ="<div><small class='text-muted'>"+paging+"</small></div>";
		    	replyPageFooter.html(str);
		  
			});
		}//end showReplyPage
		
		
		var modal = $(".modal");
		var modalInputContent = modal.find("textarea[name='content']");
		var modalInputId = modal.find("input[name='id']");
		var modalInputRegDate = modal.find("input[name='regdate']");
		var modalModBtn = $("#modalModBtn");
		var modalRemoveBtn = $("#modalRemoveBtn");
		var modalRegisterBtn = $("#modalRegisterBtn");
	
		//댓글 조회 클릭 이벤트 처리 
		$(".chat").on("click", "li", function(e){
		   
			var r_num = $(this).data("r_num"); //this = li
		   
		    //alert(r_num)
		    replyService.get(r_num, function(reply){
		   
				modalInputContent.val(reply.content); //var:데이터를 담는다는 의미
		    	modalInputId.closest("div").hide();
		    	modalInputRegDate.closest("div").hide();
		    	modal.data("r_num", reply.r_num);
		     
		    	modal.find("button[id !='modalCloseBtn']").hide();
		     
		     	if('${sessionScope.id}'==reply.id){
		        	modalModBtn.show();
		       		modalRemoveBtn.show();
		     	}
		     	
		     	$(".modal").modal("show");
		         
			});
		});
		
			 
		$("#modalCloseBtn").on("click", function(e){
		 
			modal.modal('hide');
		});
		
		
		modalModBtn.on("click", function(e){
		    var reply = {r_num:modal.data("r_num"), content: modalInputContent.val()};
		    //alert(reply.r_num);
		    replyService.update(reply, function(result){
		          
			    alert(result);
			    modal.modal("hide");
			    showList(); //갱신된 댓글 목록 가져오기
			      
		    });
		    
		});//modify 
		 
		 
		modalRemoveBtn.on("click", function (e){
		    
		    var r_num = modal.data("r_num");
		    
		    replyService.remove(r_num, function(result){
		          
		        alert(result);
		        modal.modal("hide");
		        showList();
		        
			});
		    
		});//remove
		
		$("#addReplyBtn").on("click", function(e){
			  
			if('${sessionScope.id}'==''){ //로그인이 안된상태
				
				if(confirm("로그인을 해야 댓글을 쓸수 있습니다.")) {
			        var url = "../member/login";
			       
			        url += "?col=${col}";
			        url += "&word=${word}";
			        url += "&nowPage=${nowPage}";
			        url += "&nPage=${nPage}";
			        url += "&a_num=${a_num}";
			        url += "&rurl=../a_num/read";
			   
			        location.href = url;
			    }
				
			}else{ //로그인이 된 상태
			 
				modalInputContent.val("");
				modalInputId.closest("div").hide();
				modalInputRegDate.closest("div").hide();
				modal.find("button[id !='modalCloseBtn']").hide();
				
				modalRegisterBtn.show();
  
				$(".modal").modal("show");
			  
			  
			}
		});
			 
			 
			modalRegisterBtn.on("click",function(e){
			  
				if(modalInputContent.val()==''){
					alert("댓글을 입력하세요")
					return ;
				}

				var reply = 
					{content: modalInputContent.val(),
			   		 id:'<c:out value="${sessionScope.id}"/>',
			      	 bbsno:'<c:out value="${a_num}"/>'};
				
				//alert(reply.content);
				
				//호출시작
				replyService.add(reply, function(result){
  
 					alert(result);
  
 					modal.find("input").val("");
  					modal.modal("hide");
  
  					//showList(1);
  					showList();
			    
				}); //end add //호출끝
			  
			}); //end modalRegisterBtn.on	
		
				 
	}); //end $(document).ready
</script>
	
	
	<!-- 여기까지 -->
	
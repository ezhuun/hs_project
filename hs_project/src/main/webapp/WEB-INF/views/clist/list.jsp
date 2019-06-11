<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/ssi/ssi.jsp" %>

<style>
.container-inner {
	/*transition*/
	-webkit-transition: .25s ease-in-out;
	-moz-transition: .25s ease-in-out;
	-o-transition: .25s ease-in-out;
	transition: .25s ease-in-out;
	font-family: helvetica neue, helvetica, arial, sans-serif;
	font-size: 18px;
	line-height: 18px;
	box-sizing: border-box;
	margin: 0;
}

h1 {
	text-align: center;
	padding: 50px 0;
	font-size: 30px;
	margin: 0;
	font-weight: 200;
	color: #454545;
}

h1 .fa-check {
	font-size: 30px;
	margin-right: 10px;
	color: #0eb0b7;
}

#todo-list {
	width: 500px;
	margin: 0 auto 50px auto;
	padding: 50px;
	background: white;
	position: relative;
	/*box-shadow*/
	-webkit-box-shadow: 0 1px 4px rgba(0, 0, 0, 0.3);
	-moz-box-shadow: 0 1px 4px rgba(0, 0, 0, 0.3);
	box-shadow: 0 1px 4px rgba(0, 0, 0, 0.3);
	/*border-radius*/
	-webkit-border-radius: 5px;
	-moz-border-radius: 5px;
	border-radius: 5px;
}

#todo-list:before {
	content: "";
	position: absolute;
	z-index: -1;
	/*box-shadow*/
	-webkit-box-shadow: 0 0 20px rgba(0, 0, 0, 0.4);
	-moz-box-shadow: 0 0 20px rgba(0, 0, 0, 0.4);
	box-shadow: 0 0 20px rgba(0, 0, 0, 0.4);
	top: 50%;
	bottom: 0;
	left: 10px;
	right: 10px;
	/*border-radius*/
	-webkit-border-radius: 100px / 10px;
	-moz-border-radius: 100px / 10px;
	border-radius: 100px / 10px;
}

.todo-wrap {
	display: block;
	position: relative;
	padding-left: 35px;
	/*box-shadow*/
	-webkit-box-shadow: 0 2px 0 -1px #ebebeb;
	-moz-box-shadow: 0 2px 0 -1px #ebebeb;
	box-shadow: 0 2px 0 -1px #ebebeb;
}

.todo-wrap:last-of-type {
	/*box-shadow*/
	-webkit-box-shadow: none;
	-moz-box-shadow: none;
	box-shadow: none;
}

input[type="checkbox"] {
	position: absolute;
	height: 0;
	width: 0;
	opacity: 0;
	top: -600px;
}

.todo {
	display: inline-block;
	font-weight: 200;
	padding: 10px 5px;
	height: 37px;
	position: relative;
}

.todo:before {
	content: '';
	display: block;
	position: absolute;
	top: calc(50% + 2px);
	left: 0;
	width: 0%;
	height: 1px;
	background: #cd4400;
	/*transition*/
	-webkit-transition: .25s ease-in-out;
	-moz-transition: .25s ease-in-out;
	-o-transition: .25s ease-in-out;
	transition: .25s ease-in-out;
}

.todo:after {
	content: '';
	display: block;
	position: absolute;
	z-index: 0;
	height: 18px;
	width: 18px;
	top: 9px;
	left: -25px;
	/*box-shadow*/
	-webkit-box-shadow: inset 0 0 0 2px #d8d8d8;
	-moz-box-shadow: inset 0 0 0 2px #d8d8d8;
	box-shadow: inset 0 0 0 2px #d8d8d8;
	/*transition*/
	-webkit-transition: .25s ease-in-out;
	-moz-transition: .25s ease-in-out;
	-o-transition: .25s ease-in-out;
	transition: .25s ease-in-out;
	/*border-radius*/
	-webkit-border-radius: 4px;
	-moz-border-radius: 4px;
	border-radius: 4px;
}

.todo:hover:after {
	/*box-shadow*/
	-webkit-box-shadow: inset 0 0 0 2px #949494;
	-moz-box-shadow: inset 0 0 0 2px #949494;
	box-shadow: inset 0 0 0 2px #949494;
}

.todo .fa-check {
	position: absolute;
	z-index: 1;
	left: -31px;
	top: 0;
	font-size: 1px;
	line-height: 36px;
	width: 36px;
	height: 36px;
	text-align: center;
	color: transparent;
	text-shadow: 1px 1px 0 white, -1px -1px 0 white;
}

:checked+.todo {
	color: #717171;
}

:checked+.todo:before {
	width: 100%;
}

:checked+.todo:after {
	/*box-shadow*/
	-webkit-box-shadow: inset 0 0 0 2px #0eb0b7;
	-moz-box-shadow: inset 0 0 0 2px #0eb0b7;
	box-shadow: inset 0 0 0 2px #0eb0b7;
}

:checked+.todo .fa-check {
	font-size: 20px;
	line-height: 35px;
	color: #0eb0b7;
}


/* Delete Items */

.delete-item {
	display: block;
	position: absolute;
	height: 36px;
	width: 36px;
	line-height: 36px;
	right: 0;
	top: 0;
	text-align: center;
	color: #d8d8d8;
	opacity: 0;
}

.todo-wrap:hover .delete-item {
	opacity: 1;
}

.delete-item:hover {
	color: #cd4400;
}


/* Add Items */

#add-todo {
	padding: 25px 0 0 0;
	font-size: 14px;
	font-weight: 200;
	color: #d8d8d8;
	display: inline-block;
	cursor: pointer;
}

#add-todo:hover {
	color: #6bc569;
	/*transition*/
	-webkit-transition: none;
	-moz-transition: none;
	-o-transition: none;
	transition: none;
}

#add-todo .fa-plus {
	font-size: 14px;
	/*transition*/
	-webkit-transition: none;
	-moz-transition: none;
	-o-transition: none;
	transition: none;
}

.input-todo {
	border: none;
	outline: none;
	font-weight: 200;
	position: relative;
	top: -1px;
	margin: 0;
	padding: 0;
	width: 100%;
}

.editing {
	height: 0;
	overflow: hidden;
}

.editing.todo-wrap {
	box-shadow: 0 0 400px rgba(0, 0, 0, .8), inset 0 0px 0 2px #ebebeb;
}

</style>


	<!-- 여기부터 -->
	
	<div class="container-inner sideBorder boxsing">
		<h1><i class="fa fa-check"></i>To Do Checklist</h1>
		<form id="todo-list">
		
		<c:forEach var="dto" items="${list}" varStatus="status">

			<span class="todo-wrap">
				<input type="checkbox" id="${dto.c_num}" class="checkItem"/>
				<label for="${dto.c_num}" class="todo">
					<i class="fa fa-check"></i>
					${dto.title}
				</label>
				<span class="delete-item" title="remove">
					<i class="fa fa-times-circle"></i>
				</span>
			</span>
		
		</c:forEach>

		  
		  <div id="add-todo">
		    <i class="fa fa-plus"></i>
		    Add an Item
		  </div>
		</form>
		
	</div>

	
	
	<script>
	$(".checkItem").click(function(){
		var currentId = $(this).attr("id");
		var checked = "";
		
		if($(this).is(":checked")){
			checked = "1";
		}else{
			checked = "0";
		}
		
		
		$.ajax({
			 url:"update", //(action url),
			 type:"post", //(get,post방식),
			 data:{"c_num":currentId, "checked":checked},
			 dataType:"json", //("html","xml","json","text","jsonp"),
			 success:function(data){
				 alert(data.title)
				 $("checked").text(data.title);
				 $("c_num").text(data.title);
				 
				 //전송에 성공하면 실행될 코드
			 },
			 error:function(xhr, status, errorThrown){
			       //전송에 실패하면 실행될 코드
				  $("#text").html("오류가 발생했습니다.<br>")
				  .append("오류명:"+errorThrown+"<br>")
				  .append("상태:"+status);
			       
			 	
			 }
			 
		});
		
	})
	
	
	// add items
	$('#add-todo').click(function () {
		var lastSibling = $('#todo-list > .todo-wrap:last-of-type > input').attr('id');
		var newId = Number(lastSibling) + 1;

		$(this).before('<span class="editing todo-wrap"><input type="checkbox" id="' + newId + '"/><label for="' + newId + '" class="todo"><i class="fa fa-check"></i><input type="text" class="input-todo" id="input-todo' + newId + '"/></label></div>');
		$('#input-todo' + newId + '').parent().parent().animate({
			height: "36px"
		}, 200)
		$('#input-todo' + newId + '').focus();

		$('#input-todo' + newId + '').enterKey(function () {
			//ajax 입력처리
			utils.alert('========추가========')

			$(this).trigger('enterEvent');
		})

		$('#input-todo' + newId + '').on('blur enterEvent', function () {
			var todoTitle = $('#input-todo' + newId + '').val();
			var todoTitleLength = todoTitle.length;
			if (todoTitleLength > 0) {
				$(this).before(todoTitle);
				$(this).parent().parent().removeClass('editing');
				$(this).parent().after('<span class="delete-item" title="remove"><i class="fa fa-times-circle"></i></span>');
				$(this).remove();
				$('.delete-item').click(function () {
					var parentItem = $(this).parent();
					parentItem.animate({
						left: "-30%",
						height: 0,
						opacity: 0
					}, 200);
					setTimeout(function () {
						$(parentItem).remove();
					}, 1000);
				});
			} else {
				$('.editing').animate({
					height: '0px'
				}, 200);
				setTimeout(function () {
					$('.editing').remove()
				}, 400)
			}
		})

	});

	// remove items 
	$('.delete-item').click(function () {
		//ajax
		utils.alert('=======삭제========');
		var parentItem = $(this).parent();
		parentItem.animate({
			left: "-30%",
			height: 0,
			opacity: 0
		}, 200);
		setTimeout(function () {
			$(parentItem).remove();
		}, 1000);
	});

	// Enter Key detect
	$.fn.enterKey = function (fnc) {
		return this.each(function () {
			$(this).keypress(function (ev) {
				var keycode = (ev.keyCode ? ev.keyCode : ev.which);
				if (keycode == '13') {
					fnc.call(this, ev);
				}
			})
		})
	}
	</script>
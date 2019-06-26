console.log("*****Reply Module........");

//이름없는 함수안에 함수가 정의되어 있음, replyService는 JSON객체를 결과값으로 가짐
//함수실행의 결과가 들어감
var replyService = (function() {

	function add(reply, callback, error) {
		console.log("add reply...............");

		$.ajax({
			type : 'post',			//post는 create를 의미
			url : './reply/create',//replycontroller에서 해당 url과 동일한 곳으로 매핑이 되서 이동
			data : JSON.stringify(reply), //reply는 json객체로 json형식으로 된것을 문자열로 형식으로 변경하고
			contentType : "application/json; charset=utf-8",// 그 문자열은 json임을 알려줌
			success : function(result, status, xhr) {//result는 컨트롤러에서 return값이 들어옴
				alert(result);
				if (callback) {
					callback(result);
				}
			},
			error : function(xhr, status, er) {
				if (error) {
					error(er);
				}
			}
		});
					
	}

	function getList(param, callback, error) {

		var diary_num = param.diary_num;
		var sno = param.sno;
		var eno = param.eno;
		
		//, 비동기 통신, path variable
		$.getJSON("./reply/list/" + diary_num + "/" + sno + "/" + eno + ".json", //요청 url, .json = >json형식으로 데이터를 보내겠다
																			 //replycontroller에서 해당 url과 동일한 곳으로 매핑이 되서 이동
																			//.json을 지우면 요청의 응답값은 xml로 이동됨
		//data에는 컨트롤러에서 댓글의 목록이 들어있는 변수 list에 대한 정보가 들어가 있음
		function(data) {//data는 replycontroller의 url로 매핑된 곳의 결과가 data로 들어옴, 요청했을때 처리한 결과를 .json형식으로 받아서 data로 들어감
			// alert(data);
			if (callback) {//callback은 read.jsp에 있는 두번째 인자를 의미
				callback(data); // 댓글 목록만 가져오는 경우, getList안에 두번째 파라메터(function(list))에 list안으로 data가 들어감
				// callback(data.replyCnt, data.list); //댓글 숫자와 목록을 가져오는 경우
			}
		});
	}

	function getPage(param, callback, error) {
		/*var nPage = param.nPage;
		var nowPage = param.nowPage;
		var col = param.col;
		var word = param.word;
		var bbsno = param.bbsno;*/
		console.log(param)
		$.ajax({
			type : 'get',
			url : "./reply/page",
			data : param,
			contentType : "application/text; charset=utf-8",
			success : function(result, status, xhr) {
				if (callback) {
					callback(result);
				}
			},
			error : function(xhr, status, er) {
				if (error) {
					error(er);
				}
			}
		});
	}

	function remove(r_num, callback, error) {
		$.ajax({
			type : 'delete',
			url : './reply/' + r_num,
			success : function(deleteResult, status, xhr) {
				if (callback) {
					callback(deleteResult);
				}
			},
			error : function(xhr, status, er) {
				if (error) {
					error(er);
				}
			}
		});
	}

	function update(reply, callback, error) {
		console.log("rnum: " + reply.r_num);
		$.ajax({
			type : 'put',
			url : './reply/' + reply.r_num,
			data : JSON.stringify(reply),
			contentType : "application/json; charset=utf-8",
			success : function(result, status, xhr) {
				if (callback) {
					callback(result);
				}
			},
			error : function(xhr, status, er) {
				if (error) {
					error(er);
				}
			}
		});
	}

	function get(r_num, callback, error) {
		$.get("./reply/" + r_num + ".json", function(result) {//결과는 json으로 받겠다는 뜻
			if (callback) {
				callback(result);
			}
		}).fail(function(xhr, status, err) {
			if (error) {
				error();
			}
		});
	};
	
	function rcount(diary_num,callback,error){
		console.log("diary_num : "+diary_num);
		$.ajax({
			type : 'get',
			url : './reply/rcount/'+diary_num,
			success : function(result, status, xhr) {
				if (callback) {
					callback(result);
				}
			},
			error : function(xhr, status, er) {
				if (error) {
					error(er);
				}
			}
		});	
		
	}
	
	
	//JSON 함수명을 리턴, key=함수이름 => 함수가 실행됨
	//이름없는 함수를 실행한 결과는 함수이름인데 그 뒤에()를 붙였기 때문에 replyService =  add();식으로 값을 가짐
	return {
		add : add,
		get : get,
		getList : getList,
		getPage : getPage,
		remove : remove,
		update : update,
		rcount  : rcount
	};
})();//=> 함수명뒤에 붙음 = 함수호출
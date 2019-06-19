console.log("*****Reply Module........");

//이름없는 함수안에 함수가 정의되어 있음, replyService는 JSON객체를 결과값으로 가짐
//함수실행의 결과가 들어감
var replyService = (function() {

	function add(reply, callback, error) {
		console.log("add reply...............");

		$.ajax({
			type : 'post',			//post는 create를 의미
			url : './aboardreply/create',//replycontroller에서 해당 url과 동일한 곳으로 매핑이 되서 이동
			data : JSON.stringify(reply), //reply는 json객체로 json형식으로 된것을 문자열로 형식으로 변경하고
			contentType : "application/json; charset=utf-8",// 그 문자열은 json임을 알려줌
			success : function(result, status, xhr) {//result는 컨트롤러에서 return값이 들어옴
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

		var a_num = param.a_num;
		var sno = param.sno;
		var eno = param.eno;

		$.getJSON("./aboardreply/list/" + a_num + "/" + sno + "/" + eno + ".json",
			
			function(data) {
			
			if (callback) {
				callback(data); 
				}
		});
	}

	function getPage(param, callback, error) {

		$.ajax({
			type : 'get',
			url : "./aboardreply/page",
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
			url : './aboardreply/' + r_num,
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
		console.log("r_num: " + reply.r_num);
		$.ajax({
			type : 'put',
			url : './aboardreply/update' + reply.r_num,
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
		$.get("./aboardreply/" + r_num + ".json", function(result) {//결과는 json으로 받겠다는 뜻
			if (callback) {
				callback(result);
			}
		}).fail(function(xhr, status, err) {
			if (error) {
				error();
			}
		});
	};
	
	//JSON 함수명을 리턴, key=함수이름 => 함수가 실행됨
	//이름없는 함수를 실행한 결과는 함수이름인데 그 뒤에()를 붙였기 때문에 replyService =  add();식으로 값을 가짐
	return {
		add : add,
		get : get,
		getList : getList,
		getPage : getPage,
		remove : remove,
		update : update
	};
})();//=> 함수명뒤에 붙음 = 함수호출
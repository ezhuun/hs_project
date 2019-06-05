<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/ssi/ssi.jsp" %>

<style>
.accordion {
  background-color: #eee;
  color: #444;
  cursor: pointer;
  padding: 18px;
  width: 100%;
  border: none;
  text-align: left;
  outline: none;
  font-size: 15px;
  transition: 0.4s;
}

.active, .accordion:hover {
  background-color: #ccc; 
}

.panel {
  padding: 0 18px;
  display: none;
  background-color: white;
  overflow: hidden;
}
</style>

	<!-- 여기부터 -->
	
	<div class="container-inner sideBorder boxsing">
		<h2>Accordion</h2>
		
		<c:forEach var="dto" items="${list}">
		
			<button class="accordion">${dto.title}</button>
			<div class="panel">
			  <p>${dto.content}</p>
			</div>
		
		</c:forEach>		
	</div>


	
	<!-- 자신의 js는 아래 script태그를 만들어서 사용 -->
	<script>
	var acc = document.getElementsByClassName("accordion");
	var i;
	
	for (i = 0; i < acc.length; i++) {
	  acc[i].addEventListener("click", function() {
	    this.classList.toggle("active");
	    var panel = this.nextElementSibling;
	    if (panel.style.display === "block") {
	      panel.style.display = "none";
	    } else {
	      panel.style.display = "block";
	    }
	  });
	}
	</script>
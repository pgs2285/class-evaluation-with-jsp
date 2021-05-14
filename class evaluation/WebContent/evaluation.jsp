<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
      
<%@ page import="evaluation2.Evaluationreturn"%>   
<%@ page import="java.io.PrintWriter"%>
<%@ page import=" java.sql.ResultSet"%>
<%@ page import="evaluation2.EvaluationDTO"%>
<%@ page import="evaluation2.EvaluationDAO"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="java.net.URLEncoder"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content ="width=device-withd,initial-scale = 1,shrink-to-fit=no">

<title>군산대학교 강의평가 사이트</title>
<!--  부트트랩 CSS -->
<link rel = "stylesheet" href="./css/bootstrap.min.css">
<!--  custom CSS -->
<link rel = "stylesheet" href="./css/custom.css">
</head>
<body>
<%
	request.setCharacterEncoding("UTF-8");
	String searchType="최신순";
	String search="";		
	int pageNumber=0;
	if(request.getParameter("searchType")!=null){
		searchType=request.getParameter("searchType");
	}
	if(request.getParameter("search")!=null){
		search=request.getParameter("search");
	}
	if(request.getParameter("pageNumber")!=null){
		try{
		pageNumber=Integer.parseInt(request.getParameter("pageNumber"));
	
		} catch(Exception e){
			System.out.println("오류");
		}
	}
%>
<nav class="navbar navbar-expand-lg navbar-light bg-light"> 
	<a class = "navbar-brand" href="index.jsp">군산대학교 강의평가</a>
	<button class="navbar-toggler" type="button" data-togglr ="collapse" data-target="#navbar">
		<span class="navbar-toggler-icon"></span>
	</button>	
		<div id="navbar" class="collapse navbar-collapse">
			<ul class = "navbar-nav mr-auto">
			
				<li class = "nav-item active">
					<a class = "nav-link" href="index.jsp">메인화면</a>
				</li>
				
				<li class = "nav-item dropdown">
					<a class ="nav-link dropdown-toggle"  id="dropdown" data-toggle="dropdown">
						회원관리
					</a>
					<div class = "dropdown-menu" aria-labelledby="dropdown">
						<a class ="dropdown-item" href="#"> 로그인</a>
						<a class ="dropdown-item" href="#"> 회원가입</a>
						<a class ="dropdown-item" href="#"> 로그아웃</a>						
					</div>					
				</li>
					
			<li class = "nav-item dropdown">
					<a class ="nav-link dropdown-toggle"  id="dropdown" data-toggle="dropdown">
						메뉴
					</a>
					<div class = "dropdown-menu" aria-labelledby="dropdown">
						<a class ="dropdown-item" href="./clalist.jsp"> 강의 종류</a>
						<a class ="dropdown-item" href="./evaluation.jsp"> 강의 평가</a>
						<a class ="dropdown-item" href="./insert.jsp"> 강의 추가</a>						
					</div>					
				</li>
				
			</ul>
		
		</div>	
</nav>
 <section class ="container">
 	<form method="get" action="./evaluation.jsp" class = "form-inline mt-3">
 		<select name ="seachType" class = "form-control mx-1 mt-2">
 			<option value="최신순"<% if(searchType.equals("최신순"))out.println("selected"); %>> 최신순 </option>
 			</select>
 		<input type="text" name ="search" class = "form-control mx-1 mt-2" placeholder ="내용을 입력하세요">
 		<button type ="submit" class="btn btn-primary mx-1 mt-2"> 검색 </button>
 		<a class="btn btn-primary mx-1 mt-2" data-toggle="modal" href="#registerModal">등록하기</a>
 	</form>
 <%
 	ArrayList<EvaluationDTO> evaluationList=new ArrayList<EvaluationDTO>();
 	evaluationList = new EvaluationDAO().getList(searchType,search,pageNumber);
 	System.out.println(evaluationList.size());
 	if(evaluationList!=null)
 		
 		for(int i =0; i < evaluationList.size();i++){
 			
 			
 			
 			EvaluationDTO evaluation = evaluationList.get(i);
 %>
  
		
 <div class="card bg-light mt-3">
 	<div class ="card-header bg-light">
 		<div class ="row">
 			<div class="col-8 text-left">
 				<%= evaluation.getLectureName() %>&nbsp;<small><%=evaluation.getProfessorName() %></small>
 			</div>
 			<div class="col-4 text-right">
 				점수 <span style="color:red;"> <%=evaluation.getScore() %></span>
 			</div>		
 		</div>
 	</div> 
 	<div class="card-body">
 		<h5 class="card-title">
 			<%= evaluation.getEvaluationTitle() %>&nbsp;
 		</h5>
 		<p class="card-text"><%=evaluation.getEvaluationContent() %> </p>
 	</div>
 </div>
 <%
 	}
 	
 %>
 	
 </section>
 <ul class ="pagination jstify-content-center mt-3">
 	<li class="page-item">
 	<%
 	if(pageNumber<=0){
 	%>
 	<a class="page-link disabled">이전</a>
 	<%
 	} else{
 	%>
  	
 	<%} %>
 	</li>
 </ul>

 <div class ="modal fade" id="registerModal" tabindex="-1" role ="dialog" aria-labelledby="modal" aria-hidden ="true">
 	<div class ="modal-dialog">
 		<div class ="modal-content">
 			<div class ="modal-header">
 				<h6 class ="modal-title" id="modal">평가등록</h6>
 				<button type="button" class="close" data-dismiss="modal" aria-label="Close">
 					<span aria-hidden = "true">&times;</span>
 				</button>
 			</div>
 			<div class = "modal-body">
 				<form action = "./evaluationRegisterAction.jsp" method="post">
 					<div class="form-row">
 						<div class="form-group col-sm-4">
 							<label>강의코드</label>
 							<input type="text" name="lecturecode" class="form-control" maxlength="20"> 							
 						</div>					
 						<div class="form-group col-sm-4">
 							<label>강의명</label>
 							<input type="text" name="lectureName" class="form-control" maxlength="20"> 							
 						</div>
 						<div class ="form-group col-sm-4">
 						<label>교수</label>
 							<input type="text" name="professorName" class="form-control" maxlength="20"> 							
 						
 						</div>
 					</div>
 					<div class="form-row">
 						<div class ="form group col-sm-4">
 							<label>수강평점</label>
 							<select name="score" class="form-control">
 								<option value ="5" selected> 5 </option>
 								<option value ="4" selected> 4 </option>
 								<option value ="3" selected> 3 </option>
 								<option value ="2" selected> 2 </option>
 								<option value ="1" selected> 1 </option>
 							</select>
 						</div>
 					</div>
 					<div class ="form-group">
 						<label>제목</label> 						
 						<input type="text" name = "evaluationTitle" class="form-control" maxlength="30"> 						
 					</div>
 					<div class ="form-group">
 						<label>내용</label> 							
 						<textarea type="text" name = "evaluationContent" class="form-control" maxlength="200" style ="height:180px"></textarea> 						
 					</div>
 					<div class="modal-footer">
 						<button type="submit" class="btn btn-primary">등록하기</button>
 					</div>
 				</form>
 			
 			</div>			
 		</div>
 	</div>
 </div>
 			
	
 <!--  제이쿼리 자바스크립트 -->
 <script src ="./js/jquery.min.js"></script>
 <script src ="./js/pooper.js"></script>
 <script src ="./js/bootstrap.min.js"></script>
 
</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
      
<%@ page import="evaluation2.Evaluationreturn"%>   
<%@ page import="java.io.PrintWriter"%>
<%@ page import=" java.sql.ResultSet"%>
<%@ page import="evaluation.clalistDTO"%>
<%@ page import="evaluation.clalistDAO"%>
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
	String search="";		
	int pageNumber=0;
	
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
 	<form method="get" action="./clalist.jsp" class = "form-inline mt-3">
 		<input type="text" name ="search" class = "form-control mx-1 mt-2" placeholder ="내용을 입력하세요">
 		<button type ="submit" class="btn btn-primary mx-1 mt-2"> 검색 </button>
 	</form>
 <%
 	ArrayList<clalistDTO> evaluationList=new ArrayList<clalistDTO>();
 	evaluationList = new clalistDAO().getList(search,pageNumber);
 	System.out.println(evaluationList.size());
 	if(evaluationList!=null)
 		
 		for(int i =0; i < evaluationList.size();i++){
 			

 			
 			clalistDTO evaluation = evaluationList.get(i);
 %>
  
		
 <div class="card bg-light mt-3">
 	<div class ="card-header bg-light">
 		<div class ="row">
 			<div class="col-12 text-left">
 				■강의명: <%=evaluation.getIrum() %>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
 				■교수명: <%=evaluation.getProf() %>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
 				■과목코드:<%=evaluation.getCod() %>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
 				■학점:<%= evaluation.getNum() %>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
 				 ■강의실: <%=evaluation.getRoom() %>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
 			</div>
 				
 		</div>
 	</div> 
 </div>
 <%
 	}
 	
 %>
 	</section>
	
 <!--  제이쿼리 자바스크립트 -->
 <script src ="./js/jquery.min.js"></script>
 <script src ="./js/pooper.js"></script>
 <script src ="./js/bootstrap.min.js"></script>
 
</body>
</html>
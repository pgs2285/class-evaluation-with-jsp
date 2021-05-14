<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="evaluation2.EvaluationDTO"%>   
<%@ page import="evaluation2.EvaluationDAO"%>  
<%@ page import="java.io.PrintWriter"%>

<%
	request.setCharacterEncoding("UTF-8");
	String lecturecode=null;
	String lectureName=null;
	String professorName=null;
	int score=0;
	String evaluationTitle=null;
	String evaluationContent=null;
	
	if(request.getParameter("lecturecode")!=null){
		lecturecode = request.getParameter("lecturecode");	
	}
	if(request.getParameter("lectureName")!=null){
		lectureName = request.getParameter("lectureName");	
	}
	if(request.getParameter("professorName")!=null){
		professorName = request.getParameter("professorName");	
	}
	if(request.getParameter("score")!=null){
		score = Integer.parseInt(request.getParameter("score"));	
	}
	if(request.getParameter("evaluationTitle")!=null){
		evaluationTitle = request.getParameter("evaluationTitle");	
	}
	if(request.getParameter("evaluationContent")!=null){
		evaluationContent = request.getParameter("evaluationContent");	
	}
	
	if(lecturecode == null){
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('입력안된 정보가 있습니다1');");
		script.println("history.back();");
		script.println("</script>");
		script.close();
		return;
	}
	
	if(lectureName==null){
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('입력안된 정보가 있습니다2');");
		script.println("history.back();");
		script.println("</script>");
		script.close();
		return;
	}
	if(professorName==null){
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('입력안된 정보가 있습니다3');");
		script.println("history.back();");
		script.println("</script>");
		script.close();
		return;
	}
	if(evaluationTitle==null){
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('입력안된 정보가 있습니다4');");
		script.println("history.back();");
		script.println("</script>");
		script.close();
		return;
	}
	if(evaluationContent==null){
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('입력안된 정보가 있습니다5');");
		script.println("history.back();");
		script.println("</script>");
		script.close();
		return;
	}
	
	EvaluationDAO evaluationDAO = new EvaluationDAO();
	int result = evaluationDAO.write(new EvaluationDTO(lecturecode,lectureName,professorName,score,evaluationTitle,evaluationContent,0));
	
	if(result == -1){
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('강의 입력에 실패했습니다.');");
		script.println("history.back();");
		script.println("</script>");
		script.close();
		return;
	}
	else{
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("location.href = 'index.jsp'");
		script.println("</script>");
		script.close();		
	}
	
	
%>	


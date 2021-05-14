<%@ page language="java" contentType="text/html; charset=UFT-8"
    pageEncoding="UTF-8"%>
<%@ page import="evaluation.listDTO"%>   
<%@ page import="evaluation.listDAO"%>   
<%@ page import="java.io.PrintWriter"%>
<%

	request.setCharacterEncoding("UTF-8");
	String code = null;
	String prof = null;
	String irum = null;
	String num = null;
	String room = null;
	if(request.getParameter("cod")!=null){
		code = (String)request.getParameter("cod");
	}
	if(request.getParameter("prof")!=null){
		prof = (String)request.getParameter("prof");
	}
	if(request.getParameter("irum")!=null){
		irum = (String)request.getParameter("irum");
	}
	if(request.getParameter("num")!=null){
		num = (String)request.getParameter("num");
	}
	if(request.getParameter("room")!=null){
		room = (String)request.getParameter("room");
	}
	if(code == null|| prof==null||irum==null||num==null||room==null){
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('no informaiton');");
		script.println("history.back();");
		script.println("</script>");
		script.close();
		return;
	}
	listDAO ListDAO = new listDAO();
	int result = ListDAO.list(code,prof,irum,num,room);
	
	PrintWriter script = response.getWriter();
	script.println("<script>");
	script.println("alert('successfully added, go back to previous page');");
	script.println("history.back();");
	script.println("</script>");
	script.close();
	
%>

 

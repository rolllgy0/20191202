<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입 성공</title>
</head>
<body>
<%
	Connection conn = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	
	try {
		Class.forName("com.mysql.cj.jdbc.Driver");
		String url = "jdbc:mysql://localhost:3306/munggu?characterEncoding=UTF-8&serverTimezone=UTC";
		
		conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/munggu?characterEncoding=UTF-8&serverTimezone=UTC", "root", "1234");
		String sql = "insert into member(id, password) values (?,?)";
		
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, request.getParameter("id"));
		pstmt.setString(2, request.getParameter("password"));
		pstmt.executeUpdate();
	} catch (Exception e) {
		e.printStackTrace();
	}finally{
		if(rs!=null) rs.close();
		if(pstmt!=null) pstmt.close();
		if(conn!=null) conn.close();
	}
%>
회원가입 되었습니다.<br/>
<a href="memberForm.jsp">돌아가기</a>
</body>
</html>
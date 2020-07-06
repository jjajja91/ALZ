<%@page import="alz.user.mapper.UserMapper"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!-- 객체를 생성해서 request영역에 저장 -->
<jsp:useBean id="user" scope="request" class="alz.user.domain.UserDTO"/> <!-- 클래스를 불러올 때 패키지명을 포함시키는 것을 잊지 말 것! -->
<jsp:setProperty name="user" property="*"/> <!-- setProperty로 각 값에 대한 프로퍼티를 설정한다. -->

<%@page import="alz.user.domain.UserDTO"%> <!-- 클래스를 불러올 때 패키지명을 포함시키는 것을 잊지 말 것! -->

<%--
//DB연결 객체 생성
UserMapper userMapper = new UserMapper();
userMapper.insert(user);
--%>

<!-- jsp:useBean을 쓰면 import도 필요없어진다. -->
<%--@ page import = "com.codechobo.User"--%> <!-- 클래스를 불러올 때 패키지명을 포함시키는 것을 잊지 말 것! -->

<%--
<!-- jsp:setProperty를 사용하면 아래의 항목들이 필요없게 된다. -->
String userid = request.getParameter("userid");
String password = request.getParameter("password");
String name = request.getParameter("name");
String email = request.getParameter("email");
--%>

<%--       
//jsp:useBean으로 인스턴스를 생성하여 request 영역에 담아줬으므로 이 부분은 필요없게 된다.
	User users = new User(); 
	request.setAttribute("memberInfo", memberInfo);

// jsp:setProperty를 사용하면 아래의 항목들이 필요없게 된다.
// 객체에 값을 저장
	user.setuserid(userid);
	user.setpassword(password);
	user.setname(name);
	user.setemail(email);
--%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<jsp:forward page = "/userInfo.jsp" />   <!-- useObject.jsp로 forwarding -->
</body>
</html>
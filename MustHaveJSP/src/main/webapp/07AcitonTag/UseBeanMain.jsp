<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>액션태그 -UserBean</title>
</head>
<body>
	<h2>userBean 액션태그</h2>
	<h3>자바빈즈 생성하기</h3>
	<jsp:useBean id="person" class="common.Person" scope ="request" />
	
	<h3>setProperty 액션 태그로 자바빈즈 속성 지정하기</h3>
	<jsp:setProperty name="person" property = "name" value ="임꺽정" />
	<jsp:setProperty name="person" property = "age" value ="41" />
	
	<h3>getProperty 액션 태그로 자바빈즈 속성 읽기</h3>
	<ul>
	<li><jsp:getProperty name="person" property = "name"  /></li>
	<li><jsp:getProperty name="person" property = "age"  /></li>
	</ul>
	
<!-- 	<!-- 자바빈즈, 세터와 게터 이용하기  -->  
<%-- 	<%  --%>
<!-- // 	common.Person person =(common.Person) request.getAttribute("person"); -->
<!-- // 	if (person == null){ -->
<!-- // 	person= new common.Person(); -->
<!-- // 	request.setAttribute("person" , person); -->
<!-- // 	} -->
	
<!-- // 	person.setName("임"); -->
<!-- // 	out.print(person.getName()); -->
<%-- 	%> --%>

	
	
	
</body>
</html>
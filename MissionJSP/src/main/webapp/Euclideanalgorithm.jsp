<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<<<<<<< HEAD
    
 
=======
<%!
public int maxValue(String num1, String num2){
	
	int result=Euclidean(Integer.parseInt(num1), Integer.parseInt(num2));
	return result;
	
}

public int Euclidean(int n1, int n2){
	
	if (n2==0) return n2;
	else return  Euclidean(n2, n1%n2);
}
public int minValue(String num1, String num2){
	int result=Integer.parseInt(num1)*Integer.parseInt(num2)/Euclidean(Integer.parseInt(num1), Integer.parseInt(num2));
	return result;
}
%>
<%

pageContext.setAttribute("num1",request.getParameter("num1"));
pageContext.setAttribute("num2",request.getParameter("num2"));

if (request.getMethod().equals("POST")) {
	
	out.print(" 최대공약수, 최대공배수 출력을 어떻게 할 수 있을까");
}
%>

>>>>>>> a4290fd2dfd78250661774cdc70bd958ce275709
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Euclidean algorithm</title>
</head>
<body>
	<h2>최대공약수, 최소공배수 구하기</h2>
	
<<<<<<< HEAD
	<form name=inputvalue>
	숫자 1 :<input type="text" name="num1" value="" /> <br />
	숫자 2 :<input type="text" name="num2" value="" /> <br />
	최대공약수 :<input type="text" name="maxval" value=""  /> <br />
	최소공배수 :<input type="text" name="minval" value="" /> <br />
	<input type ="submit" value ="선택" />
	</form>
	<%
	int n1=Integer.parseInt("num1");
	int n2=Integer.parseInt("num2");
	int maxval=0;
	int minval=0;
	if (n1>=n2){
		if (n1%n2==0) {maxval=n2; minval=n1*n2/maxval;}
	}
	else {
		if (n2%n1==0) {maxval=n1; minval=n1*n2/maxval;}
	}

=======
	<% 
	try{
		
>>>>>>> a4290fd2dfd78250661774cdc70bd958ce275709
	%>
 	<form method="post">
        <table>
            <tr><td>숫자1</td><td><input type="text" name="num1" value="<%= pageContext.getAttribute("num1") != null ? pageContext.getAttribute("num1") : "" %>" /></td></tr> 
            <tr><td>숫자2</td><td><input type="text" name="num2" value="<%= pageContext.getAttribute("num2") != null ? pageContext.getAttribute("num2") : ""%>" /></td></tr> 
            <tr><td>최대공약수</td><td><input type="text" name="maxval" value="<%= pageContext.getAttribute("maxval") != null ? pageContext.getAttribute("maxval") : "" %>" /></td></tr> 
            <tr><td>최소공배수</td><td><input type="text" name="minval" value="<%= pageContext.getAttribute("minval") != null ? pageContext.getAttribute("minval") : "" %>" /></td></tr> 
        </table>
        <input type="submit" value="선택"/>
    </form>
	<% 
	
	}
    catch(Exception e){
    out.print(e.getMessage());
   }
   %>    
</body>
</html>

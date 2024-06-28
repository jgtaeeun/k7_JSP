<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%!
public int maxValue(int num1, int num2){
	
	int result=Euclidean(num1, num2);
	return result;
	
}


public int Euclidean(int n1, int n2){
	
	if (n2==0) return n1;
	else return  Euclidean(n2, n1%n2);
}

%>
<%

pageContext.setAttribute("num1",request.getParameter("num1")) ;
pageContext.setAttribute("num2",request.getParameter("num2"));


if (request.getMethod().equals("POST") && request.getParameter("num1")!=null && request.getParameter("num2")!=null ){//post로 요청될 때

	
	int num1 = Integer.parseInt((String)pageContext.getAttribute("num1"));
	int num2 = Integer.parseInt((String)pageContext.getAttribute("num2"));
	int maxVal=0 ;
	int minVal =0;
	if ( num1 !=0 &&  num2 !=0){
		if (num1 >=num2 ) {
			maxVal = maxValue(num1, num2);
			
			
			minVal = (int) num1 * num2 / maxVal ;
				
			
		
		}else {
			maxVal = maxValue(num2, num1);
		
			
			minVal = (int) num1 * num2 / maxVal ;
			
			
		}
		pageContext.setAttribute("maxVal", maxVal);
		pageContext.setAttribute("minVal", minVal );
	}
	
	else {
		pageContext.setAttribute("maxVal", 0);
		pageContext.setAttribute("minVal", 0);
		out.print("연산 과정 중 에러 발생");
	}

	
}
%>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Euclidean algorithm</title>
</head>
<body>
	<h2>최대공약수, 최소공배수 구하기</h2>

	<% 
	try{

	%>
 	<form method="post">
        <table>
            <tr><td>숫자1</td><td><input type="text" name="num1" value="<%= pageContext.getAttribute("num1") != null ? pageContext.getAttribute("num1") : "" %>" /></td></tr> 
            <tr><td>숫자2</td><td><input type="text" name="num2" value="<%= pageContext.getAttribute("num2") != null ? pageContext.getAttribute("num2") : ""%>" /></td></tr> 
            <tr><td>최대공약수</td><td><input type="text" name="maxval" value="<%= pageContext.getAttribute("maxVal")!= null ? pageContext.getAttribute("maxVal") : ""%>" /></td></tr> 
            <tr><td>최소공배수</td><td><input type="text" name="minval" value="<%= pageContext.getAttribute("minVal") != null ? pageContext.getAttribute("minVal") : ""%>" /></td></tr> 
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
	

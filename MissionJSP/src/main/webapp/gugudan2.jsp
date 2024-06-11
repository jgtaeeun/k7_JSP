<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%! public int multi(int num1, int num2){
		return num1 * num2;
} 
	public int[][] mul(){
		int a[][] =new int [8][9];   //구구단 저장할 배열
		
		int idx_a=0; int idx_b=0;
		for (int j=2 ; j<=9 ; j++){
			for (int k=1 ; k<=9 ; k++){
					a[idx_a][idx_b] = multi(j, k);
					idx_b+=1;
			}
			idx_a+=1;
			idx_b=0;
		}
		
		return a;
	}
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>구구단</title>
</head>
<body>
	
	
	<% 
		int col;
		int r[][]= null;
		
		int idx_a=2; int idx_b=1;
		col= Integer.parseInt(request.getParameter("col"));
		
		switch(col){
		case 1: //1열로 2단부터 9단 출력    gugudna1_1.jsp의 ver 가져오기
			r= mul();
			idx_a=2; idx_b=1;
			for (int i=0 ; i< r.length ; i++){
				for (int j=0 ; j< r[0].length ; j++){
					out.print(idx_a + "*"+idx_b+ "="+r[i][j] + "<br />");
					idx_b+=1;
				}
				out.print("<br />");
				idx_a+=1;
				idx_b=1;
			}
			break;
			
		case 2: //2열로 2단부터 9단 출력
			r= mul();
			idx_a=2; idx_b=1;
			
			for (int i=0 ; i< r.length ; i=i+2){
				for (int j=0 ; j<  r[0].length ; j++) {
					out.print(idx_a + "*"+idx_b+ "="+r[i][j]+" " +(idx_a+1) + "*"+idx_b+ "="+ r[i+1][j]+"<br />");
					idx_b+=1;
				}
				out.print("<br />");
				idx_a+=2;
				idx_b=1;
			}
			
			
			break;
		
		case 3://3열로 2단부터 9단 출력
			r= mul();
			idx_a=2; idx_b=1;
			
			for (int i=0 ; i< r.length-2 ; i=i+3){
				for (int j=0 ; j<  r[0].length ; j++) {
					out.print(idx_a + "*"+idx_b+ "="+r[i][j]+" " +(idx_a+1) + "*"+idx_b+ "="+ r[i+1][j]+(idx_a+2) + "*"+idx_b+ "="+ r[i+2][j]+"<br />");
					idx_b+=1;
				}
				out.print("<br />");
				idx_a+=3;
				idx_b=1;
			}
			for (int i=r.length-2 ; i <r.length ; i=i+3){
				for (int j=0 ; j<  r[0].length ; j++) {
					out.print(idx_a + "*"+idx_b+ "="+r[i][j]+" " +(idx_a+1) + "*"+idx_b+ "="+ r[i+1][j]+"<br />");
					idx_b+=1;
				}
				out.print("<br />");
			}
			break;
			
		case 4://4열로 2단부터 9단 출력
			r= mul();
			idx_a=2; idx_b=1;
			
			for (int i=0 ; i< r.length ; i=i+4){
				for (int j=0 ; j<  r[0].length ; j++) {
					out.print(idx_a + "*"+idx_b+ "="+r[i][j]+" " +(idx_a+1) + "*"+idx_b+ "="+ r[i+1][j]+(idx_a+2) + "*"+idx_b+ "="+ r[i+2][j]+(idx_a+3) + "*"+idx_b+ "="+ r[i+3][j]+"<br />");
					idx_b+=1;
				}
				out.print("<br />");
				idx_a+=4;
				idx_b=1;
			}
		
			
			break;
		
		case 5://5열로 2단부터 9단 출력
			r= mul();
			idx_a=2; idx_b=1;
			
			for (int i=0 ; i< r.length-3 ; i=i+5){
				for (int j=0 ; j<  r[0].length ; j++) {
					out.print(idx_a + "*"+idx_b+ "="+r[i][j]+" " +(idx_a+1) + "*"+idx_b+ "="+ r[i+1][j]+(idx_a+2) + "*"+idx_b+ "="+ r[i+2][j]+(idx_a+3) + "*"+idx_b+ "="+ r[i+3][j]+"<br />");
					idx_b+=1;
				}
				out.print("<br />");
				idx_a+=5;
				idx_b=1;
			}
		
			for (int i=r.length-2 ; i <r.length ; i=i+3){
				for (int j=0 ; j<  r[0].length ; j++) {
					out.print(idx_a + "*"+idx_b+ "="+r[i][j]+" " +(idx_a+1) + "*"+idx_b+ "="+ r[i+1][j]+"<br />");
					idx_b+=1;
				}
				out.print("<br />");
			}
			break;
			
		case 6://6열로 2단부터 9단 출력
		case 7://7열로 2단부터 9단 출력
		case 8://8열로 2단부터 9단 출력
		default : out.println("입력값이 없습니다.<br />"); 
			
		}
	
	%>
		
	
	

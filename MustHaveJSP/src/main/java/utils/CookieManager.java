package utils;

import jakarta.servlet.http.Cookie;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

public class CookieManager {

	public static void makeCookie(HttpServletResponse response, String cName, String cValue, int cTime) {
	
	    Cookie cookie = new Cookie(cName, cValue);  // 쿠키 생성
	    cookie.setPath("/");  // 경로를 컨텍스트 루트로 설정
	    cookie.setMaxAge(cTime);  // 유지 기간을 1시간으로 설정
	    response.addCookie(cookie);  // 응답 헤더에 쿠키 추가
	  
	}
	
	public static String readCookie(HttpServletRequest request, String cName) {
		String cookieValue = "";
		
		Cookie[] cookies = request.getCookies();  // 요청 헤더의 모든 쿠키 얻기
	    if (cookies!=null) {
	        for (Cookie c : cookies) {  // 쿠키 각각의
	            String cookieName = c.getName();  // 쿠키 이름 얻기
	           
	            if( cookieName.equals(cName) )
	            	cookieValue =  c.getValue();
	        }
	    }
	    return cookieValue;
	}
	
	public static void deleteCookie(HttpServletResponse response, String cName) {
		makeCookie(response,  cName, "", 0);
	}
}

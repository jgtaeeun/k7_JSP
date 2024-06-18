package common;
import java.sql.Connection;
import java.sql.DriverManager;

import jakarta.servlet.ServletContext;

public class JDBConnect {
	public Connection con;
	
	public JDBConnect() {
		try {
				Class.forName("com.mysql.cj.jdbc.Driver");
				
				String url="jdbc:mysql://localhost:3306/musthave";
				String id="scott";
				String pwd="tiger";
				con=DriverManager.getConnection(url, id, pwd);
				
				System.out.println("DB연결 성공 (기본생성자)");
		}
		catch(Exception e){
			e.printStackTrace();
		}
	}
	
	
	public JDBConnect(String MySQLDriver,String MySQLURL,String MySQLId,String MySQLPwd ) {
		try {
				Class.forName(MySQLDriver);
				con=DriverManager.getConnection(MySQLURL, MySQLId, MySQLPwd);
				
				System.out.println("DB연결 성공 (인수 생성자 1)");
		}
		catch(Exception e){
			e.printStackTrace();
		}
	}
	
	public JDBConnect(ServletContext application ) {
		try {
				Class.forName(application.getInitParameter("MySQLDriver"));
				
				String url=  application.getInitParameter("MySQLURL");
				String id =  application.getInitParameter("MySQLId");
				String pwd =  application.getInitParameter("MySQLPwd");
				con=DriverManager.getConnection(url, id, pwd);
				
				System.out.println("DB연결 성공 (인수 생성자 2)");
		}
		catch(Exception e){
			e.printStackTrace();
		}
	}
	
	public void close() {
		try {
		
			if( con != null) con.close();
			
			System.out.println("JDBC 자원 해제");
		}
		catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	public Connection getCon() {
		return con;
	}
}

package fileupload;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Collection;
import java.util.Date;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.Part;

public class FileUtil {
	//요청 객체 내에 전송되어 온 파일을 디스크에 저장하고 파일명을 리턴
	public static String uploadFile(HttpServletRequest req, String sDirectory) throws IOException, ServletException {
		
			//Part 객체를 통해 서버로 전송된 파일명 읽어오기 
			Part part = req.getPart("ofile");					
			 
			//Part 객체의 헤더값 중 content-disposition 읽어오기 
	        String partHeader = part.getHeader("content-disposition");
	        //출력결과 => form-data; name="attachedFile"; filename="파일명.jpg"
	        System.out.println("partHeader="+ partHeader);
	         
	        //헤더값에서 파일명 잘라내기
	        String[] phArr = partHeader.split("filename=");
	        String originalFileName = phArr[1].trim().replace("\"", "");
			
			//전송된 파일이 있다면 디렉토리에 저장
			if (!originalFileName.isEmpty()) {				
				part.write(sDirectory+ File.separator +originalFileName);
			}
			 
			//원본 파일명 반환
			return originalFileName;			
		}
	public static String renameFile(String sDirectory, String fileName) {
		//원본파일의 확장자 잘라내기
		String ext = fileName.substring(fileName.lastIndexOf("."));
		//날짜 및 시간을 통해 파일명 생성
		String now = new SimpleDateFormat("yyyyMMdd_HmsS").format(new Date());
		//"날짜_시간.확장자" 형태의 새로운 파일명 생성
		String newFileName = now + ext;  

		//기존 파일명을 새로운 파일명으로 변경
		File oldFile = new File(sDirectory + File.separator + fileName);
	    File newFile = new File(sDirectory + File.separator + newFileName);
	    oldFile.renameTo(newFile);
	    
	    //변경된 파일명 반환
	    return newFileName;
	}
	//파일을 2개이상 첨부할 때
	public static ArrayList<String> multipleFile(HttpServletRequest req, String sDirectory) throws IOException, ServletException {
		ArrayList<String> listFileName = new 	ArrayList<>();
		//Part 객체를 통해 서버로 전송된 파일명 읽어오기 
		Collection <Part> parts = req.getParts();					
		 
		for (Part part : parts) {
			if (!part.getName().equals("ofile")) continue;
		
			//Part 객체의 헤더값 중 content-disposition 읽어오기 
			String partHeader = part.getHeader("content-disposition");
		
			
         
        //헤더값에서 파일명 잘라내기
			String[] phArr = partHeader.split("filename=");
			String originalFileName = phArr[1].trim().replace("\"", "");
		
		//전송된 파일이 있다면 디렉토리에 저장
			if (!originalFileName.isEmpty()) {				
				part.write(sDirectory+ File.separator +originalFileName);
			}
			listFileName.add(originalFileName);
		}
		//원본 파일명 반환
		return listFileName;		
		
	}	
}

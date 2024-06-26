package fileupload;

import java.sql.Statement;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.List;
import java.util.Vector;




import common.JDBConnect;

public class MyFileDAO extends JDBConnect{
	
	
	public int insertFile(MyFileDTO dto) {
		PreparedStatement pt = null;
		int applyResult = 0;
		
		try {
			String query = "insert into myfile (title, cate, ofile, sfile) " +
							" values (? ,?,  ?, ?)";
			pt=getCon().prepareStatement(query);
			pt.setString(1, dto.getTitle());
			pt.setString(2, dto.getCate());
			pt.setString(3, dto.getOfile());
			pt.setString(4, dto.getSfile());
			applyResult = pt.executeUpdate();
			pt.close();
		}
		catch(Exception e) {
			System.out.println("insert 중 예외 발생");
			e.printStackTrace();
		}
		return applyResult;
	}
	
	public List<MyFileDTO> myFileList() {
        List<MyFileDTO> fileList = new Vector<MyFileDTO>();

        String query = "SELECT * FROM myfile ORDER BY idx DESC";
        Statement stmt  = null;
        ResultSet rs = null;
        try {
        	stmt = con.createStatement();   
            rs = stmt.executeQuery(query);   

            while (rs.next()) {   
                MyFileDTO dto = new MyFileDTO();
                dto.setIdx(rs.getString(1));
                dto.setTitle(rs.getString(2));
                dto.setCate(rs.getString(3));
                dto.setOfile(rs.getString(4));
                dto.setSfile(rs.getString(5));
                dto.setPostdate(rs.getString(6));
                
                fileList.add(dto);  
            }
        }
        catch (Exception e) {
            System.out.println("SELECT 시 예외 발생");
            e.printStackTrace();
        }        
        
        return fileList;  
    }
}

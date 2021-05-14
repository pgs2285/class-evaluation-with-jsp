package evaluation2;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import folder.DatabaseUtil;

public class Evaluationreturn {

		public ResultSet evalist(){
			
			 String SQL = "select * from evaluation"; 
			 try {
				 Connection conn = DatabaseUtil.getConnection();
				 PreparedStatement pstmt = conn.prepareStatement(SQL);
				
				 return pstmt.executeQuery();
			 }
			 catch(Exception e) {
				 e.printStackTrace();
			 }
			return null;
			
		}
}

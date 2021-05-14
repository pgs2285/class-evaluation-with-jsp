package evaluation;

import java.sql.Connection;
import java.sql.PreparedStatement;

import folder.DatabaseUtil;

public class listDAO {

		public int list(String cod,String irum,String prof,String num,String room){
			 String SQL = "insert into cla values(?,?,?,?,?)"; 
			 try {
				 Connection conn = DatabaseUtil.getConnection();
				 PreparedStatement pstmt = conn.prepareStatement(SQL);
				 pstmt.setString(1, cod);
				 pstmt.setString(2, irum);
				 pstmt.setString(3, prof);
				 pstmt.setString(4, num);
				 pstmt.setString(5, room);
				 
				 return pstmt.executeUpdate();
			 }
			 catch(Exception e) {
				 e.printStackTrace();
			 }
			 return -1;
		}
}

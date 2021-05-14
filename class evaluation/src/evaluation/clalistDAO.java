package evaluation;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import folder.DatabaseUtil;

public class clalistDAO {
	
	public ArrayList <clalistDTO> getList(String search,int pageNumber){
		
		ArrayList<clalistDTO> evaluationList = null;
		String SQL="";
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs =null;
		
		try {
			SQL ="select * from cla where concat(cod,irum,prof) LIKE "+
			"?";
			
			
			conn = DatabaseUtil.getConnection();
			pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1, "%" + search + "%");
			rs = pstmt.executeQuery();
			evaluationList = new ArrayList<clalistDTO>();
			while(rs.next()) {
				clalistDTO evaluation = new clalistDTO(
						rs.getString(1),
						rs.getString(2),
						rs.getString(3),
						rs.getString(4),
						rs.getString(5),
						rs.getInt(6)
						);
				evaluationList.add(evaluation);
				}
		}
		catch(Exception e) {
			e.printStackTrace();
		}
		return evaluationList;
	}
}

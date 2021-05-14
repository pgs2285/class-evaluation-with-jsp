package evaluation2;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import folder.DatabaseUtil;

public class EvaluationDAO {
	public int write(EvaluationDTO evaluationDTO) {
		String SQL = "insert into evaluation values(?,?,?,?,?,?,NULL)";
		Connection conn = null;
		PreparedStatement pstmt =null;
		
		
		try {
			conn = DatabaseUtil.getConnection();
			pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1, evaluationDTO.getLecturecode());
			pstmt.setString(2, evaluationDTO.getLectureName());
			pstmt.setString(3, evaluationDTO.getProfessorName());
			pstmt.setInt(4, evaluationDTO.getScore());
			pstmt.setString(5, evaluationDTO.getEvaluationTitle());
			pstmt.setString(6, evaluationDTO.getEvaluationContent());
			return pstmt.executeUpdate();
		}
		catch(Exception e) {
			e.printStackTrace();
		}
		return -1;
	}
	
	public ArrayList <EvaluationDTO> getList(String searchType,String search,int pageNumber){
		
		ArrayList<EvaluationDTO> evaluationList = null;
		String SQL="";
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs =null;
		
		try {
			if(searchType.equals("ÃÖ½Å¼ø")) {
				SQL ="select * from evaluation where concat(lectureName,professorName,evaluationTitle,evaluationContent) LIKE "+
			"? order by evaluationID desc";
			}
			
			conn = DatabaseUtil.getConnection();
			pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1, "%" + search + "%");
			rs = pstmt.executeQuery();
			evaluationList = new ArrayList<EvaluationDTO>();
			while(rs.next()) {
				EvaluationDTO evaluation = new EvaluationDTO(
						rs.getString(1),
						rs.getString(2),
						rs.getString(3),
						rs.getInt(4),
						rs.getString(5),
						rs.getString(6),
						rs.getInt(7)
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

package evaluation2;

public class EvaluationDTO {
	String lecturecode;
	String lectureName;
	String professorName;
	int score;
	String evaluationTitle;
	String evaluationContent;
	int evaluationID;
	
	public EvaluationDTO(String lecturecode, String lectureName, String professorName, int score,
			String evaluationTitle, String evaluationContent, int evaluationID) {
		super();
		this.lecturecode = lecturecode;
		this.lectureName = lectureName;
		this.professorName = professorName;
		this.score = score;
		this.evaluationTitle = evaluationTitle;
		this.evaluationContent = evaluationContent;
		this.evaluationID = evaluationID;
	}
	public int getEvaluationID() {
		return evaluationID;
	}
	public void setEvaluationID(int evaluationID) {
		this.evaluationID = evaluationID;
	}
	public String getLecturecode() {
		return lecturecode;
	}
	public void setLecturecode(String lecturecode) {
		this.lecturecode = lecturecode;
	}
	public String getLectureName() {
		return lectureName;
	}
	public void setLectureName(String lectureName) {
		this.lectureName = lectureName;
	}
	public String getProfessorName() {
		return professorName;
	}
	public void setProfessorName(String professorName) {
		this.professorName = professorName;
	}
	public int getScore() {
		return score;
	}
	public void setScore(int score) {
		this.score = score;
	}
	public String getEvaluationTitle() {
		return evaluationTitle;
	}
	public void setEvaluationTitle(String evaluationTitle) {
		this.evaluationTitle = evaluationTitle;
	}
	public String getEvaluationContent() {
		return evaluationContent;
	}
	public void setEvaluationContent(String evaluationContent) {
		this.evaluationContent = evaluationContent;
	}
	
	public EvaluationDTO() {
		
	}
	
		
	
}

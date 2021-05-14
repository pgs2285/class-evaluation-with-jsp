package evaluation;

public class clalistDTO {
	String num;
    String room;
	String cod; 
    String irum;    
    String prof;
    int score;
    
    public clalistDTO(String cod, String irum, String prof, String num, String room, int score) {
		super();
		this.cod = cod;
		this.irum = irum;
		this.prof = prof;
		this.score = score;
		this.num = num;
		this.room = room;
	}
    

	public String getCod() {
		return cod;
	}
	public void setCod(String cod) {
		this.cod = cod;
	}
	public String getIrum() {
		return irum;
	}
	public void setIrum(String irum) {
		this.irum = irum;
	}
	public String getProf() {
		return prof;
	}
	public void setProf(String prof) {
		this.prof = prof;
	}
	public String getNum() {
		return num;
	}
	public void setNum(String num) {
		this.num = num;
	}
	public String getRoom() {
		return room;
	}
	public void setRoom(String room) {
		this.room = room;
	}
	
}	

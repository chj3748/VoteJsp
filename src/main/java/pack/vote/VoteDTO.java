package pack.vote;

public class VoteDTO {
	private int id;
	private String voter;
	private String candidate;
	
	
	public VoteDTO(int id, String voter, String candidate) {
		super();
		this.id = id;
		this.voter = voter;
		this.candidate = candidate;
	}


	public VoteDTO(String voter, String candidate) {
		super();
		this.voter = voter;
		this.candidate = candidate;
	}


	public int getId() {
		return id;
	}


	public void setId(int id) {
		this.id = id;
	}


	public String getVoter() {
		return voter;
	}


	public void setVoter(String voter) {
		this.voter = voter;
	}


	public String getCandidate() {
		return candidate;
	}


	public void setCandidate(String candidate) {
		this.candidate = candidate;
	}
	
	
}

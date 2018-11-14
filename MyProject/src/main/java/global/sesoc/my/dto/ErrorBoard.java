package global.sesoc.my.dto;

public class ErrorBoard {
	private int boardnum;
	private String userid;
	private String title;
	private String content;
	private String hitcount;
	private String regdate;
	private String originalfile;
	private String savedfile;
	private int answered;
	
	public ErrorBoard() {
		super();
		// TODO Auto-generated constructor stub
	}

	public ErrorBoard(int boardnum, String userid, String title, String content, String hitcount, String regdate,
			String originalfile, String savedfile, int answered) {
		super();
		this.boardnum = boardnum;
		this.userid = userid;
		this.title = title;
		this.content = content;
		this.hitcount = hitcount;
		this.regdate = regdate;
		this.originalfile = originalfile;
		this.savedfile = savedfile;
		this.answered = answered;
	}

	public int getBoardnum() {
		return boardnum;
	}

	public void setBoardnum(int boardnum) {
		this.boardnum = boardnum;
	}

	public String getUserid() {
		return userid;
	}

	public void setUserid(String userid) {
		this.userid = userid;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public String getHitcount() {
		return hitcount;
	}

	public void setHitcount(String hitcount) {
		this.hitcount = hitcount;
	}

	public String getRegdate() {
		return regdate;
	}

	public void setRegdate(String regdate) {
		this.regdate = regdate;
	}

	public String getOriginalfile() {
		return originalfile;
	}

	public void setOriginalfile(String originalfile) {
		this.originalfile = originalfile;
	}

	public String getSavedfile() {
		return savedfile;
	}

	public void setSavedfile(String savedfile) {
		this.savedfile = savedfile;
	}

	public int getAnswered() {
		return answered;
	}

	public void setAnswered(int answered) {
		this.answered = answered;
	}

	@Override
	public String toString() {
		return "ErrorBoard [boardnum=" + boardnum + ", userid=" + userid + ", title=" + title + ", content=" + content
				+ ", hitcount=" + hitcount + ", regdate=" + regdate + ", originalfile=" + originalfile + ", savedfile="
				+ savedfile + ", answered=" + answered + "]";
	}
	
	
	}

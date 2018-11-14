package global.sesoc.my.dto;

public class Reply {
		private int replynum;
		private int boardnum;
		private String userid;
		private String replytext;
		private String regdate;
		private int bestreply;
		
		public Reply() {
			super();
			// TODO Auto-generated constructor stub
		}

		public Reply(int replynum, int boardnum, String userid, String replytext, String regdate, int bestreply) {
			super();
			this.replynum = replynum;
			this.boardnum = boardnum;
			this.userid = userid;
			this.replytext = replytext;
			this.regdate = regdate;
			this.bestreply = bestreply;
		}

		public int getReplynum() {
			return replynum;
		}

		public void setReplynum(int replynum) {
			this.replynum = replynum;
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

		public String getReplytext() {
			return replytext;
		}

		public void setReplytext(String replytext) {
			this.replytext = replytext;
		}

		public String getRegdate() {
			return regdate;
		}

		public void setRegdate(String regdate) {
			this.regdate = regdate;
		}

		public int getBestreply() {
			return bestreply;
		}

		public void setBestreply(int bestreply) {
			this.bestreply = bestreply;
		}

		@Override
		public String toString() {
			return "Reply [replynum=" + replynum + ", boardnum=" + boardnum + ", userid=" + userid + ", replytext="
					+ replytext + ", regdate=" + regdate + ", bestreply=" + bestreply + "]";
		}
		
		
		
		}

package global.sesoc.my.dto;

public class Member {
		private String userid;
		private String userpwd;
		private String username;
		private String emailID;
		private String emailDomain;
		private int point;
		private char verify;
		
		public Member() {
			super();
			// TODO Auto-generated constructor stub
		}

		public Member(String userid, String userpwd, String username, String emailID, String emailDomain, int point,
				char verify) {
			super();
			this.userid = userid;
			this.userpwd = userpwd;
			this.username = username;
			this.emailID = emailID;
			this.emailDomain = emailDomain;
			this.point = point;
			this.verify = verify;
		}

		public String getUserid() {
			return userid;
		}

		public void setUserid(String userid) {
			this.userid = userid;
		}

		public String getUserpwd() {
			return userpwd;
		}

		public void setUserpwd(String userpwd) {
			this.userpwd = userpwd;
		}

		public String getUsername() {
			return username;
		}

		public void setUsername(String username) {
			this.username = username;
		}

		public String getEmailID() {
			return emailID;
		}

		public void setEmailID(String emailID) {
			this.emailID = emailID;
		}

		public String getEmailDomain() {
			return emailDomain;
		}

		public void setEmailDomain(String emailDomain) {
			this.emailDomain = emailDomain;
		}

		public int getPoint() {
			return point;
		}

		public void setPoint(int point) {
			this.point = point;
		}

		public char getVerify() {
			return verify;
		}

		public void setVerify(char verify) {
			this.verify = verify;
		}

		@Override
		public String toString() {
			return "Member [userid=" + userid + ", userpwd=" + userpwd + ", username=" + username + ", emailID="
					+ emailID + ", emailDomain=" + emailDomain + ", point=" + point + ", verify=" + verify + "]";
		}
}

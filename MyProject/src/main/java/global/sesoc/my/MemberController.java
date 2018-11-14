package global.sesoc.my;

import javax.mail.MessagingException;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import global.sesoc.my.dao.MemberRepository;
import global.sesoc.my.dto.Member;
import global.sesoc.my.util.MailHandler;

@Controller
public class MemberController {
		
		@Autowired
		MemberRepository repository;
		@Autowired
		JavaMailSender mailSender;
	
		//아이디 중복 검사
		@ResponseBody
		@RequestMapping(value="idCheck", method=RequestMethod.GET)
		public int idCheck(String userid) {
			Member memberCheck=repository.idCheck(userid);
			if(memberCheck==null) {
				return 0;
			} else {
				return 1;
			}
		}
		
		//회원가입 처리
		@RequestMapping(value="/join", method=RequestMethod.POST)
		public String insertMember(Member member, HttpSession session) throws Exception {
			System.out.println(member);
			int result = repository.insertMember(member);
			if(result==1) {
				/*session.setAttribute("loginId", member.getUserid());
				session.setAttribute("loginName", member.getUsername());*/
				
				MailHandler sendMail = new MailHandler(mailSender);
				sendMail.setSubject("이메일 인증");
				sendMail.setText(new StringBuffer().append("<h1>메일인증</h1>")
						.append("<a href='http://localhost:8888/my/loginForm?emailID="+member.getEmailID()
						+"&emailDomain="+member.getEmailDomain()+"' target='_blenk'> 이메일 인증 확인</a>").toString());
				sendMail.setFrom("radiostar243@google.com", "radiostar243");
				sendMail.setTo(member.getEmailID()+"@"+member.getEmailDomain());
				sendMail.send();
				
				return "index";
			}
			else {
				System.out.println("회원가입실패");
				return "index";
			}
		}
		
		//로그인 처리 요청
		@RequestMapping(value="login", method=RequestMethod.POST)
		public String login(Member member, boolean saveid, HttpServletResponse response, HttpSession session, Model model) {
			//아이디 저장하기
			if(saveid == true) {
				Cookie cookie = new Cookie("saveid", member.getUserid());
				cookie.setMaxAge(7*24*60*60);
				response.addCookie(cookie);
			} else {
				Cookie cookie = new Cookie("saveid", null);
				cookie.setMaxAge(0);
				response.addCookie(cookie);
			}
			//DB에서 해당 사용자가 있는지 여부체크
			Member m = repository.login(member);
			if(m.getVerify()=='n') {
				return "noEmail";
			}
			if(m !=null) {
				session.setAttribute("loginId", m.getUserid());
				session.setAttribute("loginName", m.getUsername());
			}
			return "redirect:/";
		}
		
		//로그아웃		
		@RequestMapping(value="logout", method=RequestMethod.GET)
		public String logout(HttpSession session) {			
			session.invalidate();
			return "redirect:/";
		}
		
		//링크를 첨부한 메일발송
		@RequestMapping(value="mailChecking", method=RequestMethod.POST)
		public String mailChecking(Member member) throws Exception{
			return "index";
		}		
		
		//링크를 눌렀을 때 처리
		/*@RequestMapping(value="verify", method=RequestMethod.GET)
		public String signSuccess(@RequestParam String emailID, @RequestParam String emailDomain) {
			System.out.println("이메일 인증 기능 처리");
			Member member = new Member();
			member.setEmailID(emailID);
			member.setEmailDomain(emailDomain);
			int verifyResult = repository.verify(member);
			System.out.println(verifyResult);
			return "index";
		}*/
		
		
}

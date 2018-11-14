package global.sesoc.my;



import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.stereotype.Repository;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import global.sesoc.my.dao.MemberRepository;
import global.sesoc.my.dto.Member;

/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {
	
	@Autowired
	MemberRepository repository;
	
	//Home 화면
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home() {
		return "index";
	}
	
	@RequestMapping(value="returnHome", method=RequestMethod.GET)
	public String returnHome() {
		return "index";
	}
	
	//Join 화면 요청
	@RequestMapping(value="joinForm", method=RequestMethod.GET)
	public String JoinForm() {
		return "join";
	}
	
	//errorBoard 화면 요청
	@RequestMapping(value="errorBoard", method=RequestMethod.GET)
	public String errorBoard() {
		return "errorBoard";
	}
	
	//myPage 화면 요청
	@RequestMapping(value="ranking", method=RequestMethod.GET)
	public String myPage(Model model) {
		List<Member> memberList = repository.ranking();
		model.addAttribute("memberList", memberList);
		return "ranking";
	}
	
	//로그인 화면 요청
	@RequestMapping(value="loginForm", method=RequestMethod.GET)
	public String loginForm(
			@RequestParam(value="emailID", defaultValue="") String emailID, 
			@RequestParam(value="emailDomain", defaultValue="") String emailDomain) {
		System.out.println("이메일 인증 기능 처리");
		if(emailDomain != null&&emailID != null) {
			Member member = new Member();
			member.setEmailID(emailID);
			member.setEmailDomain(emailDomain);
			int verifyResult = repository.verify(member);
			System.out.println(verifyResult);
		}
		return "login";
		}
			
	//joinTest
	@RequestMapping(value="/joinTest", method=RequestMethod.GET)
	public String joinTest() {
		return "joinTest";
	}
			
	//streaming
	@RequestMapping(value="/streaming", method=RequestMethod.GET)
	public String streaming() {
		return "streaming";
	}
}

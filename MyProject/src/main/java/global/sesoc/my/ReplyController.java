package global.sesoc.my;

import java.awt.image.RescaleOp;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import global.sesoc.my.dao.BoardRepository;
import global.sesoc.my.dao.MemberRepository;
import global.sesoc.my.dto.ErrorBoard;
import global.sesoc.my.dto.Reply;

@Controller
public class ReplyController {
		
		@Autowired
		BoardRepository repository;
		@Autowired
		MemberRepository mrepository;
		
		@ResponseBody
		@RequestMapping(value="replyInsert", method=RequestMethod.POST)
		public Reply replyWrite(@RequestBody Reply reply) {
			int result = repository.replyInsert(reply);
			return reply;
		}
		
		@ResponseBody
		@RequestMapping(value="answeredCheck", method=RequestMethod.GET)
		public int answeredCheck(int boardnum) {
			ErrorBoard board = repository.selectOne(boardnum);
			System.out.println("현재 board의 답변여부::"+board.getAnswered());
			int result = board.getAnswered();
			return result;
		}		
		
		@ResponseBody
		@RequestMapping(value="delAuthority", method=RequestMethod.GET)
		public String delAuthority(int replynum) {
			Reply reply = repository.replySelectOne(replynum);
			String result = reply.getUserid();
			return result;
		}
		
		@ResponseBody
		@RequestMapping(value="recAuthority", method=RequestMethod.GET)
		public String recAuthority(int boardnum) {
			ErrorBoard board = repository.selectOne(boardnum);
			String userid = board.getUserid();
			return userid;
		}
		
		@ResponseBody
		@RequestMapping(value="replyAll", method=RequestMethod.GET)
		public List<Reply> replyAll(int boardnum){
			List<Reply> result = repository.replyAll(boardnum);
			return result;
		}
		
		@ResponseBody
		@RequestMapping(value="replyDelete", method=RequestMethod.GET)
		public int replyDelete(int replynum) {
			int result = repository.replyDelete(replynum);
			System.out.println(result);
			return result;
		}
		
		/*@RequestMapping(value="updateForm", method=RequestMethod.GET)
		public String updateForm(int replynum, int boardnum, Model model) {
			
			List<Reply> replyList = repository.replyList(boardnum);
			ErrorBoard board = repository.selectOne(reply.getBoardnum());			
			model.addAttribute("replyList", replyList);
			model.addAttribute("board", board);
			model.addAttribute("replynum", replynum);
			return "board/replyUpdate";
		}
		
		@RequestMapping(value="/replyUpdate", method=RequestMethod.GET)
		public String replyUpdate(Reply reply,RedirectAttributes rttr ) {
			Reply reply = repository.replySelectOne(replynum);			
			repository.replyUpdate(reply);
			rttr.addAttribute("boardnum", reply.getBoardnum());
			return "redirect:detail";
		}*/
		
		@ResponseBody
		@RequestMapping(value="pointGet", method=RequestMethod.POST)
		public int pointGet(@RequestBody Reply reply, Model model) {			
			String userid = reply.getUserid();
			int boardnum = reply.getBoardnum();
			ErrorBoard board = repository.selectOne(boardnum);
			int result1 = mrepository.pointGet(userid);
			int result2 = repository.bestreply(reply);
			int result3 = repository.answered(board);
			
			int result = result1+result2+result3;
			return result;
		}
}

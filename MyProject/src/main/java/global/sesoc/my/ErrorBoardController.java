package global.sesoc.my;

import java.io.FileInputStream;
import java.io.IOException;
import java.net.URLEncoder;
import java.nio.file.Files;
import java.nio.file.Paths;
import java.text.DateFormat;
import java.util.Date;
import java.util.List;
import java.util.Locale;

import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import global.sesoc.my.dao.BoardRepository;
import global.sesoc.my.dto.ErrorBoard;
import global.sesoc.my.util.FileService;
import global.sesoc.my.util.PageNavigator;
import global.sesoc.my.dto.Reply;

@Controller
public class ErrorBoardController {
		@Autowired
		BoardRepository repository;
		final String uploadPath = "/uploadpath";
	
		//board 전체 select
		@RequestMapping(value="/listboard", method=RequestMethod.GET)
		   public String listboard(Model model,
		         @RequestParam(value="searchItem",defaultValue="title")String searchItem, 
		         @RequestParam(value="searchWord",defaultValue="")String searchWord,
		         @RequestParam(value="currentPage",defaultValue="1")int currentPage) {
		      
		      int totalRecordCount = repository.getTotalBoard(searchItem, searchWord);		      
		      
		      PageNavigator navi = new PageNavigator(currentPage, totalRecordCount);
		      List<ErrorBoard> list = repository.select(searchItem, searchWord, navi.getStartRecord(), navi.getCountPerPage()); 
		      
		    //이미지를 보여주기 위함
		      
		      for (ErrorBoard board : list) {
		    	  if(board.getOriginalfile() != null) {
						String fullPath = uploadPath+"/"+board.getSavedfile();
						try {
							String type = Files.probeContentType(Paths.get(fullPath));
							
							if(type != null && type.contains("image")) {
								
								model.addAttribute("mime", type);
							}
						} catch (IOException e) {
							e.printStackTrace();
						}
					} 
			}
		      
		      model.addAttribute("list", list);
		      model.addAttribute("navi", navi);
		      model.addAttribute("searchItem", searchItem);
		      model.addAttribute("searchWord", searchWord);
		      model.addAttribute("currentPage", currentPage);
		      	      
		      return "errorBoard";
		   }
		
		//글쓰기 폼 요청
		@RequestMapping(value="writeForm", method=RequestMethod.GET)
		public String writeForm(Locale locale, Model model) {
			Date date = new Date();
			DateFormat dateFormat = DateFormat.getDateTimeInstance(DateFormat.LONG, DateFormat.LONG, locale);
			
			String formattedDate = dateFormat.format(date);
			
			model.addAttribute("serverTime", formattedDate );
			return "writeForm";
		}
		
		//글쓰기 처리 요청
		@RequestMapping(value="write", method=RequestMethod.POST)
		public String writeBoard(ErrorBoard board, HttpSession session, MultipartFile upload) {

			String userid = (String)session.getAttribute("loginId");
			
			String savedFile = null;
			String originalFile = null;
			if(!upload.isEmpty()) {
			savedFile = FileService.saveFile(upload, uploadPath);
			originalFile= upload.getOriginalFilename();
			}
			
			board.setUserid(userid);
			board.setSavedfile(savedFile);
			board.setOriginalfile(originalFile);
						
			repository.insert(board);
			return "redirect:listboard";
		}
		
		//boardDetail 요청(글 자세히 보기)
		@RequestMapping(value="detail", method=RequestMethod.GET)
		public String detail(int boardnum, Model model, Reply reply) {			
			ErrorBoard board = repository.selectOne(boardnum);
			List<Reply> replyList = repository.replyAll(boardnum);
			model.addAttribute("replyList", replyList);
			
			
			if(board.getOriginalfile() != null) {
				String fullPath = uploadPath+"/"+board.getSavedfile();
				try {
					String type = Files.probeContentType(Paths.get(fullPath));
					System.out.println(type);
					if(type != null && type.contains("image")) {
						model.addAttribute("mime", type);
					}
				} catch (IOException e) {
					e.printStackTrace();
				}
			}
			
			model.addAttribute("board", board);
			repository.updateHitCount(boardnum);
			return "errorBoardDetail";
		}
		
		//업로드파일 삭제처리
		@RequestMapping(value="fileDelete", method=RequestMethod.GET)
		public String fileDelete(int boardnum, Model model) {
			ErrorBoard fileDelete = repository.selectOne(boardnum);
			String fullPath = uploadPath+"/"+fileDelete.getSavedfile();
			 FileService.deleteFile(fullPath);
			 fileDelete.setOriginalfile(null);
			 fileDelete.setSavedfile(null);
			 repository.update(fileDelete);
			 model.addAttribute("board", fileDelete);
			 model.addAttribute("boardnum", boardnum);
			return "redirect:errorBoardUpdate";
		}
		
		//글 삭제 처리
		@RequestMapping(value="delete", method=RequestMethod.GET)
		public String delete(int boardnum) {
			 ErrorBoard board = repository.selectOne(boardnum);
			 if(board.getOriginalfile() != null) {
				 String fullPath = uploadPath+"/"+board.getSavedfile();
				 FileService.deleteFile(fullPath);
			 }
			repository.delete(boardnum);
			repository.replyAllDelete(boardnum);
			return "redirect:listboard";
		}
		
		//update 폼 요청
		@RequestMapping(value="errorBoardUpdate", method=RequestMethod.GET)
		public String updateForm(int boardnum, Model model) {
			ErrorBoard board = repository.selectOne(boardnum);
			model.addAttribute("board", board);
			return "errorBoardUpdate";
		}
		
		
		
		//update 처리 요청	
		@RequestMapping(value="boardUpdate", method=RequestMethod.POST)
		public String update(ErrorBoard board, MultipartFile upload) throws Exception{
			
			String savedFile = null;
			String originalFile = null;
			ErrorBoard boardDelete = repository.selectOne(board.getBoardnum());
			
			if(!upload.isEmpty()&&boardDelete.getOriginalfile() != null) {
				System.out.println("1번경우"+boardDelete.getOriginalfile());
				String fullPath = uploadPath+"/"+boardDelete.getSavedfile();
				FileService.deleteFile(fullPath);
				
				savedFile = FileService.saveFile(upload, uploadPath);
				originalFile= upload.getOriginalFilename();
				board.setSavedfile(savedFile);
				board.setOriginalfile(originalFile);
			}
			
			else if(!upload.isEmpty()&&boardDelete.getOriginalfile() == null) {								
				System.out.println("2번 경우"+boardDelete.getOriginalfile());
				savedFile = FileService.saveFile(upload, uploadPath);
				originalFile= upload.getOriginalFilename();
				board.setSavedfile(savedFile);
				board.setOriginalfile(originalFile);
			}
			
			repository.update(board);
			return "redirect:listboard";
		}
		
		@RequestMapping(value="/download", method=RequestMethod.GET)
		public String download(int boardnum, HttpServletResponse response) {
			ErrorBoard board = repository.selectOne(boardnum);
			String originalfile = board.getOriginalfile();
			String fullPath = uploadPath + "/" + board.getSavedfile();
			System.out.println(originalfile);
			//header에 다운로드할 정보를 포함
			
			try {				
				response.setHeader("Content-Disposition", " attachment;filename="+URLEncoder.encode(originalfile, "UTF-8"));				
			} catch (Exception e) {
				e.printStackTrace();
			}
			//stream을 통해 실제 다운로드 실시
			FileInputStream fin = null;
			ServletOutputStream fileout = null;
			
			try {
				fin = new FileInputStream(fullPath);
				fileout = response.getOutputStream();
				
				FileCopyUtils.copy(fin, fileout);
				fin.close();
				fileout.close();
			} catch (Exception e) {
				e.printStackTrace();
			}
			return null;
		}		
}

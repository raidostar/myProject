package global.sesoc.my.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import global.sesoc.my.dto.ErrorBoard;
import global.sesoc.my.dto.Reply;

@Repository
public class BoardRepository {
		@Autowired
		SqlSession session;
				
		public List<ErrorBoard> select(String searchItem, String searchWord, int startRecord, int countPerPage){
			RowBounds rb = new RowBounds(startRecord, countPerPage);
			
			BoardMapper mapper = session.getMapper(BoardMapper.class);
			
			Map<String, Object> map = new HashMap<String, Object>();
			map.put("searchItem", searchItem);
			map.put("searchWord", searchWord);
			/*map.put("srow", srow);
			map.put("erow", erow);*/
			List<ErrorBoard> list = mapper.select(map, rb);
			return list;
		}
		
		public int insert(ErrorBoard board) {
			BoardMapper mapper = session.getMapper(BoardMapper.class);
			int result = mapper.insert(board);
			return result;
		}

		public ErrorBoard selectOne(int boardnum) {
			BoardMapper mapper = session.getMapper(BoardMapper.class);
			ErrorBoard board = mapper.selectOne(boardnum);
			return board;
		}

		public int delete(int boardnum) {
			BoardMapper mapper = session.getMapper(BoardMapper.class);
			int result = mapper.delete(boardnum);
			return result;
		}
		
		public int update(ErrorBoard board) {
			BoardMapper mapper = session.getMapper(BoardMapper.class);
			int result = mapper.update(board);
			return result;
		}

		public int updateHitCount(int boardnum) {
			BoardMapper mapper = session.getMapper(BoardMapper.class);
			int result = mapper.updateHitcount(boardnum);
			return result;
		}

		public int getTotalBoard(String searchItem, String searchWord) {
		      BoardMapper mapper = session.getMapper(BoardMapper.class);
		      
		      Map<String, String> map = new HashMap<String, String>();
		      map.put("searchItem", searchItem);
		      map.put("searchWord", searchWord);
		      int total = mapper.getTotalBoard(map);
		      
		      return total;
		   }

		public int answered(ErrorBoard board) {
			BoardMapper mapper = session.getMapper(BoardMapper.class);
			int result = mapper.answered(board);
			return result;
		}
		
		public List<Reply> replyAll(int boardnum) {
			ReplyMapper mapper = session.getMapper(ReplyMapper.class);
			List<Reply> list = mapper.replyAll(boardnum);
			return list;
		}

		public int replyInsert(Reply reply) {
			ReplyMapper mapper = session.getMapper(ReplyMapper.class);
			int result = mapper.replyInsert(reply);
			return result;
		}
		
		public int replyDelete(int replynum) {
			ReplyMapper mapper = session.getMapper(ReplyMapper.class);
			int result = mapper.replyDelete(replynum);
			return result;
		}
		
		public int replyUpdate(Reply reply) {
			ReplyMapper mapper = session.getMapper(ReplyMapper.class);
			int result = mapper.replyUpdate(reply);
			return result; 
		}
		
		public Reply replySelectOne(int replynum) {
			ReplyMapper mapper = session.getMapper(ReplyMapper.class);
			Reply reply = mapper.replySelectOne(replynum);
			return reply;
		}	
		
		public int replyAllDelete(int boardnum) {
			ReplyMapper mapper = session.getMapper(ReplyMapper.class);
			int result = mapper.replyAllDelete(boardnum);
			return result;
		}
		
		public int bestreply(Reply reply) {
			ReplyMapper mapper = session.getMapper(ReplyMapper.class);
			int result = mapper.bestreply(reply);
			return result;
		}
}

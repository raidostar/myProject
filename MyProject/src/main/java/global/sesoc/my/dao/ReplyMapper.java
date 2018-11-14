package global.sesoc.my.dao;

import java.util.List;

import global.sesoc.my.dto.Reply;

public interface ReplyMapper {
	public int replyInsert(Reply reply);
	public int replyUpdate(Reply reply);
	public int replyDelete(int replynum);
	public Reply replySelectOne(int replynum);
	public List<Reply> replyAll(int boardnum);
	public int replyAllDelete(int boardnum);
	public int bestreply(Reply reply);
}

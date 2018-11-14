package global.sesoc.my.dao;

import java.util.List;

import global.sesoc.my.dto.Member;
import global.sesoc.my.dto.Reply;

public interface MemberMapper {
	public int insertMember(Member member);
	public int updateMember(Member member);
	public Member selectOneMember(Member member);
	public Member idCheck(String userid);
	public int pointGet(String userid);
	public List<Member> ranking();
	public int verify(Member member);
}

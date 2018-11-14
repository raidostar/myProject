package global.sesoc.my.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import global.sesoc.my.dto.Member;
import global.sesoc.my.dto.Reply;

@Repository
public class MemberRepository {
		@Autowired
		SqlSession session;
		
				//회원가입
				public int insertMember(Member member) {
					//sqlSession필요
					MemberMapper mapper = session.getMapper(MemberMapper.class);
					int result = mapper.insertMember(member);
					System.out.println("회원가입여부를 가림::"+result);
					return result;
				}
				//회원정보수정
				public int update(Member member) {
					MemberMapper mapper = session.getMapper(MemberMapper.class);
					int result = mapper.updateMember(member);					
					return result;
				}
				//아이디 중복 체크
				public Member idCheck(String userid) {
					MemberMapper mapper = session.getMapper(MemberMapper.class);
					Member idCheck= mapper.idCheck(userid);
					return idCheck;
				}
				//로그인
				public Member login(Member member) {
					MemberMapper mapper = session.getMapper(MemberMapper.class);
					Member m= mapper.selectOneMember(member);					
					return m;
				}
				//포인트 획득
				public int pointGet(String userid) {					
					MemberMapper mapper = session.getMapper(MemberMapper.class);					
					int result = mapper.pointGet(userid);					
					return result;
				}
				public List<Member> ranking(){
					MemberMapper mapper = session.getMapper(MemberMapper.class);
					List<Member> result = mapper.ranking();
					return result;
				}
				public int verify(Member member) {
					MemberMapper mapper = session.getMapper(MemberMapper.class);
					int result = mapper.verify(member);
					return result;
				}
}

package global.sesoc.my.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;

import global.sesoc.my.dto.ErrorBoard;

public interface BoardMapper {
	//글 전체 조회+검색
	public List<ErrorBoard> select(Map<String, Object> map, RowBounds rb);
	//글 하나 조회
	public ErrorBoard selectOne(int boardnum);
	//조회수 증가
	public int updateHitcount(int boardnum);
	//글 입력
	public int insert(ErrorBoard board);
	//글 삭제
	public int delete(int boardnum);
	//글 수정
	public int update(ErrorBoard board);
	//글 전체 개수 조회
	public int getTotalBoard(Map<String, String> map);
	//답글 채택 시 answered 1로 변경
	public int answered(ErrorBoard board);	
}

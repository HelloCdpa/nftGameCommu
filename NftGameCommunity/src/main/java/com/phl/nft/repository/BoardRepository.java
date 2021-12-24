package com.phl.nft.repository;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.phl.nft.dto.BoardDTO;
import com.phl.nft.dto.CateDTO;


@Repository
public class BoardRepository {
	@Autowired
	private SqlSessionTemplate sql;

	public void saveFile(BoardDTO board) {
		sql.insert("Board.boardSave", board);
		

	}

	public List<BoardDTO> boardFindAll() {
		return sql.selectList("boardFindAll");
	}

	public int boardCount() {
		return sql.selectOne("Board.boardCount");
	}

	public List<BoardDTO> boardPagingList(int pagingStart) {
		return sql.selectList("Board.boardPagingList", pagingStart);
	}

	public List<BoardDTO> boardPagingList1(Map<String, Integer> pagingParam) {
		return sql.selectList("Board.boardPagingList1", pagingParam);
	}

	public void boardDelete(long b_number) {
		sql.delete("Board.boardDelete", b_number);
	}


	public BoardDTO boardDetail(long b_number) {
		sql.update("Board.hitsUpdate",b_number);
		return sql.selectOne("Board.boardDetail",b_number);
	}

	
	
	
	public void boardUpdate(BoardDTO board) {
		sql.update("Board.boardUpdate", board);
	}

	public List<BoardDTO> search(Map<String, String> searchParam) {
		return sql.selectList("Board.search", searchParam);
	}

	public void cateSave(CateDTO cate) {
		sql.insert("cate.cateSave",cate);
		
	}
	
	
	public void updatePoint(String id, int point) {
	    Map<String, Object> map = new HashMap<String, Object>();
	    map.put("id", id);
	    map.put("point", point);
	    sql.update("Member.updatePoint", map);
	    }

	public void boardPoint(String m_id, int p_point, String p_type) {
		Map<String, Object> map = new HashMap<String, Object>();
		 map.put("m_id", m_id);
		 map.put("p_point", p_point);
		 map.put("p_type", p_type);
		sql.insert("point.pointSave",map);
		
	}

	public List<BoardDTO> findCate(int cate_number) {
		return sql.selectList("Board.cateFind", cate_number);
	}

	public CateDTO cateName(int cate_number) {
		return sql.selectOne("cate.cateName", cate_number);
	}

	
	public List<BoardDTO> catePagingList(Map<String, Integer> pagingParam) {
		return sql.selectList("Board.catePagingList", pagingParam);
	}

	public List<BoardDTO> catePagingList1(Map<String, Integer> pagingParam) {
		return sql.selectList("Board.catePagingList1", pagingParam);
	}
	
	public int cateBoardCount(int cate_number) {
		return sql.selectOne("Board.cateBoardCount",cate_number);
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
}

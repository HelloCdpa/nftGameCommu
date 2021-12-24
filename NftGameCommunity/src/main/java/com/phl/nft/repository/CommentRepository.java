package com.phl.nft.repository;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.phl.nft.dto.CommentDTO;


@Repository
public class CommentRepository {
	@Autowired
	private SqlSessionTemplate sql;

	public void commentSave(CommentDTO comment) {
		sql.insert("Comment.commentSave", comment);
	}

	public List<CommentDTO> commentFindAll(long b_number) {
		return sql.selectList("Comment.commentFindAll",b_number);
	}

	public void commentPoint(String m_id, int p_point, String p_type) {
		Map<String, Object> map = new HashMap<String, Object>();
		 map.put("m_id", m_id);
		 map.put("p_point", p_point);
		 map.put("p_type", p_type);
		sql.insert("point.pointSave",map);
	}
}

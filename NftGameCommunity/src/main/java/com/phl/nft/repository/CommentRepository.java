package com.phl.nft.repository;

import java.util.List;

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
}

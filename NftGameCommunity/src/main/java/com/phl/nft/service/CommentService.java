package com.phl.nft.service;

import java.util.List;

import com.phl.nft.dto.CommentDTO;


public interface CommentService {
	public void commentSave(CommentDTO comment);
	public List<CommentDTO> commentFindAll(long b_number);
	void commentDelete(CommentDTO comment);
}
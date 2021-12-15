package com.phl.nft.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.phl.nft.dto.CommentDTO;
import com.phl.nft.repository.CommentRepository;


@Service
public class CommentServiceImpl implements CommentService {
	@Autowired
	private CommentRepository cr;
	
	@Override
	public void commentSave(CommentDTO comment) {
		cr.commentSave(comment);
	}

	@Override
	public List<CommentDTO> commentFindAll(long b_number) {
		return cr.commentFindAll(b_number);
	}
	@Override
	public void commentDelete(CommentDTO comment) {
		// TODO Auto-generated method stub
		
	}


}

package com.phl.nft.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.phl.nft.dto.CommentDTO;
import com.phl.nft.service.CommentServiceImpl;



@Controller
@RequestMapping("/comment/*")
public class CommentController {
	
	@Autowired
	private CommentServiceImpl cs;
	
	@RequestMapping(value="commentSave", method=RequestMethod.POST)
	public @ResponseBody List<CommentDTO> commentSave(@ModelAttribute CommentDTO comment){
		
		cs.commentSave(comment);
		
		List<CommentDTO> commentList = cs.commentFindAll(comment.getB_number());
		return commentList;
	}
	
	
	@RequestMapping(value="commentDelete", method=RequestMethod.POST)
	public @ResponseBody List<CommentDTO> commentDelete(@ModelAttribute CommentDTO comment){
		
		cs.commentDelete(comment);
		
		List<CommentDTO> commentList = cs.commentFindAll(comment.getB_number());
		return commentList;
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	

}

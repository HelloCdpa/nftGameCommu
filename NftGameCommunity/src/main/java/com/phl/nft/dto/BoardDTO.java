package com.phl.nft.dto;

import java.sql.Timestamp;

import org.springframework.web.multipart.MultipartFile;

import lombok.Data;

@Data
public class BoardDTO {
	private String b_title,b_contents,m_id;
	private long b_number; 
	private Timestamp b_date;
	private int b_hits, cate_number, b_like;
	private MultipartFile b_file;
	private String b_filename; 
}

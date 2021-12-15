package com.phl.nft.dto;

import java.sql.Timestamp;


import lombok.Data;

@Data
public class CommentDTO {
	
	private long c_number, b_number;
	private String c_contents, m_id;
	Timestamp c_date;
	
	
}

package com.phl.nft.dto;

import java.sql.Timestamp;

import lombok.Data;

@Data
public class PointDTO {
	private long p_number;
	private int p_point;
	private Timestamp p_pointdate;
	private String m_id, p_type;


	
	
}

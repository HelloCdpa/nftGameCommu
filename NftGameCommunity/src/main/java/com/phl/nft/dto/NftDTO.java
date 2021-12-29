package com.phl.nft.dto;

import java.sql.Timestamp;

import org.springframework.web.multipart.MultipartFile;

import lombok.Data;

@Data
public class NftDTO {

	private long nft_number, nft_price;
	private MultipartFile nft_file;
	private String nft_filename, nft_name, nft_intro ;
	private Timestamp nft_date;
	private String m_id;
	private boolean nft_sell;
	
	
}

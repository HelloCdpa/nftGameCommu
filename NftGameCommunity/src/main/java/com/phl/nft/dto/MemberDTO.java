package com.phl.nft.dto;

import org.springframework.web.multipart.MultipartFile;

import lombok.Data;

@Data
public class MemberDTO {
	private String m_id, m_password, m_name, m_email, m_phone, m_likegame ;
	private long m_number;
	private MultipartFile m_profile;
	private String m_profilename;
	private long m_point;
	
	
}

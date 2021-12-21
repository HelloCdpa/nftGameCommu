package com.phl.nft.repository;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.phl.nft.dto.NftDTO;

@Repository
public class NftRepository {

	@Autowired
	SqlSessionTemplate sql;
	
	public int nftSave(NftDTO nft) {
		return sql.insert("nft.nftSave", nft);
	}

	public List<NftDTO> nftFindAll(NftDTO nft) {
		return sql.selectList("nft.nftFindAll");
	}

	public NftDTO nftDetail(long nft_number) {
		return sql.selectOne("nft.nftDetail", nft_number);
	}

	

}

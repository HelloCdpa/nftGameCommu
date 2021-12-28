package com.phl.nft.repository;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

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

	public void nftDelete(long nft_number) {
		sql.delete("nft.nftDelete", nft_number);
	}

	public void nftUpdate(NftDTO nft) {
		sql.update("nft.nftUpdate", nft);
	}

	public String nftBuyCheck(long nft_price, String m_id) {
		Map<String, Object> map = new HashMap<String, Object>();
		 map.put("nft_price", nft_price);
		 map.put("m_id", m_id);
		return sql.selectOne("Member.pointCheck",map);
	}

	public void nftBuy(long nft_number, String m_id) {
		Map<String, Object> map = new HashMap<String, Object>();
		 map.put("nft_number", nft_number);
		 map.put("m_id", m_id);
		 sql.selectOne("nft.nftBuy",map);		
	}
	
	public void memberPointBuy(long nft_price, String m_id) {
		Map<String, Object> map = new HashMap<String, Object>();
		 map.put("nft_price", nft_price);
		 map.put("m_id", m_id);
		 sql.selectOne("Member.memberPointBuy",map);	
		
	}

	public void pointBuyView(long nft_price, String m_id, String type) {
		Map<String, Object> map = new HashMap<String, Object>();
		 map.put("type", type);
		 map.put("m_id", m_id);
		 map.put("nft_price", nft_price);
		 sql.selectOne("point.pointSave",map);	
		
	}


	

}

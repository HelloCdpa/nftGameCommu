package com.phl.nft.service;

import java.io.IOException;
import java.util.List;

import com.phl.nft.dto.NftDTO;

public interface NftService {

	public int nftSave(NftDTO nft) throws IllegalStateException, IOException;

	public List<NftDTO> nftFindAll(NftDTO nft);

	public NftDTO nftDetail(long nft_number);

	public void nftDelete(long nft_number);

	public void nftUpdate(NftDTO nft);

	public String nftBuyCheck(long nft_price, String m_id);

	void nftBuy(long nft_number, long nft_price, String m_id);

	List<NftDTO> mynft(String m_id);

}

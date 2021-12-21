package com.phl.nft.service;

import java.io.IOException;
import java.util.List;

import com.phl.nft.dto.NftDTO;

public interface NftService {

	int nftSave(NftDTO nft) throws IllegalStateException, IOException;

	List<NftDTO> nftFindAll(NftDTO nft);

	NftDTO nftDetail(long nft_number);

	void nftDelete(long nft_number);

	void nftUpdate(NftDTO nft);

}

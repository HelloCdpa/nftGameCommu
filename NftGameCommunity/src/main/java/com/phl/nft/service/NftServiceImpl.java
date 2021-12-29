package com.phl.nft.service;

import java.io.File;
import java.io.IOException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.phl.nft.dto.NftDTO;
import com.phl.nft.repository.NftRepository;

@Service
public class NftServiceImpl implements NftService {

	@Autowired
	NftRepository nr;
	
	
	@Override
	public int nftSave(NftDTO nft) throws IllegalStateException, IOException{
		MultipartFile nft_file = nft.getNft_file();
		String nft_filename = nft_file.getOriginalFilename();
		nft_filename = System.currentTimeMillis() + "-" + nft_filename;
		System.out.println("nft_filename: " + nft_filename);
		// 파일 저장하기 
		String savePath = "D:\\development_Phl\\source\\spring\\NftGameCommunity\\src\\main\\webapp\\resources\\nft\\"+nft_filename;
		if(!nft_file.isEmpty()) {
			nft_file.transferTo(new File(savePath));
		}
		
		nft.setNft_filename(nft_filename);
		
		
		return nr.nftSave(nft);
	}

	@Override
	public List<NftDTO> nftFindAll(NftDTO nft) {
		
		return nr.nftFindAll(nft);
	}
	@Override
	public NftDTO nftDetail(long nft_number) {
		
		return nr.nftDetail(nft_number);
	}
	
	@Override
	public void nftDelete(long nft_number) {
		nr.nftDelete(nft_number);
	}

	@Override
	public void nftUpdate(NftDTO nft) {
		nr.nftUpdate(nft);
		
	}
	@Override
	public String nftBuyCheck(long nft_price, String m_id) {
		String result = nr.nftBuyCheck(nft_price,m_id);
		if (result!=null) {
			return "ok";
		}else {
		 return "no";
		 }
	}
	@Override
	public void nftBuy(long nft_number, long nft_price, String m_id) {
		 nr.nftBuy(nft_number,m_id);
		 nr.memberPointBuy(nft_price,m_id);
		 nr.pointBuyView(nft_price,m_id,"포인트 차감");
	}
	@Override
	public List<NftDTO> mynft(String m_id) {
		return nr.mynft(m_id);
	}

	
	
	
	
	
	
	
	
}

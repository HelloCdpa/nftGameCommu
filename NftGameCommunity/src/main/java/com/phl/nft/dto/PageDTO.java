package com.phl.nft.dto;


import lombok.Data;

@Data
public class PageDTO {
	private int page;
	private int maxPage;
	private int startPage;
	private int endPage;
}

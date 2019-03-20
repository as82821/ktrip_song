package com.ktds.ktrip.domain;

import java.util.List;

public class guideDataVO {
	List<ApplyVO> applyList;
	ItemVO item;
	
	public List<ApplyVO> getApplyList() {
		return applyList;
	}
	public void setApplyList(List<ApplyVO> applyList) {
		this.applyList = applyList;
	}
	public ItemVO getItem() {
		return item;
	}
	public void setItem(ItemVO item) {
		this.item = item;
	}
}

package com.util;

import java.util.List;

public class Page {
	private int size=5;
	//数据的总条数
	private int totalCount;
	//数据的总页数
	private int totalPage;
	//当前页码
	private int currPageNo=1;
	public int getSize() {
		return size;
	}
	public void setSize(int size) {
		this.size = size;
	}
	public int getTotalCount() {
		return totalCount;
	}
	public void setTotalCount(int totalCount) {
		this.totalCount = totalCount;
		if(totalCount % size == 0){
			this.totalPage = totalCount/size;
		}else{
			this.totalPage = totalCount/size+1;
		}
//		this.totalPage= totalCount % size == 0
//				?totalCount/size
//				:totalCount/size+1;
	}
	public int getTotalPage() {
		return totalPage;
	}
	public void setTotalPage(int totalPage) {
		this.totalPage = totalPage;
	}
	public int getCurrPageNo() {
		return currPageNo;
	}
	public void setCurrPageNo(int currPageNo) {
		this.currPageNo = currPageNo;
	}
	
	
	
}

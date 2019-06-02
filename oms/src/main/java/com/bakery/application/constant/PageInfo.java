package com.bakery.application.constant;
/**
* @author 作者 E-mail:
* @version 创建时间：2019年4月13日 下午9:27:22
* 类说明
*/
public class PageInfo {
	private Integer pageSize;  //每页条数
	
	private Integer pageNum;   //当前页
	
	private long total;  //总条数
	
	private Integer pageTotal;  //总页数
	
	public Integer getPageSize() {
		return pageSize;
	}

	public void setPageSize(Integer pageSize) {
		this.pageSize = pageSize;
	}

	public Integer getPageNum() {
		return pageNum;
	}

	public void setPageNum(Integer pageNum) {
		this.pageNum = pageNum;
	}


	public Integer getPageTotal() {
		return pageTotal;
	}

	public long getTotal() {
		return total;
	}

	public void setTotal(long total) {
		this.total = total;
	}

	public void setPageTotal(Integer pageTotal) {
		this.pageTotal = pageTotal;
	}

	
	
	

}

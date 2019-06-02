package com.bakery.application.constant;
/**
* @author 作者 E-mail:
* @version 创建时间：2019年4月13日 下午9:44:17
* 类说明
*/
public class ResDataDTO<T> {
	private T data; //返回数据
	
	private PageInfo pageInfo;
	
	public ResDataDTO(T data,PageInfo pageInfo){
		this.data=data;
		this.pageInfo=pageInfo;
	}
	
	public ResDataDTO(T data){
		this.data=data;
	}

	public ResDataDTO(){
	}
	
	
	public T getData() {
		return data;
	}

	public void setData(T data) {
		this.data = data;
	}

	public PageInfo getPageInfo() {
		return pageInfo;
	}

	public void setPageInfo(PageInfo pageInfo) {
		this.pageInfo = pageInfo;
	}
	
}

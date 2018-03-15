package com.che.common.web;

import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.ToString;
/**
 * 分页通用 请求实体
 * @author Administrator
 *
 */
@Data
@EqualsAndHashCode(callSuper=false)
@ToString
public class PageReq extends WebReq{
	private Integer pageNum = 1;
	private Integer pageSize = 10;
	public PageReq(){
	}
	public PageReq(Integer pageNum, Integer pageSize) {
		this.pageNum = pageNum;
		this.pageSize = pageSize;
	}
}

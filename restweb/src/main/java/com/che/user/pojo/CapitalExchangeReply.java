package com.che.user.pojo;

import java.math.BigDecimal;
import java.util.Date;

import lombok.Data;

@Data
public class CapitalExchangeReply {
	/** 交易的用户Id*/
    private Long uid;
    /** 支付中心交易号*/
    private String pay_center_billno;
    /** 支付类型 交易类型 0:余额 1:支付宝 2：微信*/
    private Integer pay_type;
    /** 交易资金	 */
    private BigDecimal money;
    /** 流入流出	针对用户的角度 0：流入+ 1：流出-*/
    private Integer inout;
    /** 交易描述 	*/
    private String desc;
    /** 创建时间	*/
    private Date create_time;
    /** 创建时间 字符型	*/
    private String createTimeStr;
}

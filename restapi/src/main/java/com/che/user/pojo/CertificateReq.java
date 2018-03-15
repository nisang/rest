package com.che.user.pojo;

import com.che.common.web.Req;

import lombok.Data;
import lombok.EqualsAndHashCode;

/**
 * @author karlhell
 *
 */
@Data
@EqualsAndHashCode(callSuper=false)
public class CertificateReq extends Req {

	/**
	 * 
	 */
	private static final long serialVersionUID = -853245348331265973L;
	
	/*认证类型:1个人，2企业*/
    private Integer certificationType = 1;
    /*名字*/
    private String name;
    /*城市*/
    private String city;
    /*身份证号码*/
    private String idNumber;
    /*身份证正面照url*/
    private String frontUrl;
    /*身份证反面照url*/
    private String backUrl;
    /*手持照url*/
    private String handheUrl;

    /*营业执照号*/
    private String enterpriseNumber;
    /*营业执照url*/
    private String enterpriseUrl;
    /*组织机构照url*/
    private String organizationUrl;
    /*委托书url*/
    private String attorneyUrl;
    /** 真实图像 */
    private String realheader;
    
}

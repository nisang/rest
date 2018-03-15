//package com.che.kuaiche;
//
//import com.che.common.util.Md5Encrypt;
//import com.che.user.pojo.ValidateReq;
//
//import junit.framework.Test;
//import junit.framework.TestCase;
//import junit.framework.TestSuite;
//
//public class AppTest {
//	
//	public static final String appkey = "352D78C483D7925D89963D4A5FEB777A";
//	public static void main(String[] args) {
//		//1.短信签名
//		ValidateReq req =new ValidateReq();
//		req.setToken("2724e3aif3ieghh4a175");
//		req.setTime("20170207153502346");
//		req.setMobile("17602113506");
//		System.out.println(Md5Encrypt.md5(appkey + req.getToken() + req.getTime() + req.getMobile()));
//		
//		//md5(mobile+smsCode+loginType)
//		System.out.println(Md5Encrypt.md5("17602113506" + "336374" + "1"));
//		
//		System.out.println(Md5Encrypt.md5("kc12345678" + "7c4a8d09ca3762af61e59520943dc26494f8941b" + "2"));
//	}
//
//}

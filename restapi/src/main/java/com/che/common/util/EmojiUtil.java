package com.che.common.util;

import org.apache.commons.lang3.StringUtils;

public class EmojiUtil {
	
	public static String parse(String param){
		//过滤emoji表情
		try{
			if(StringUtils.isEmpty(param))
				return param;
			param = param.replaceAll("[\ud83c\udc00-\ud83c\udfff]|[\ud83d\udc00-\ud83d\udfff]|[\u2600-\u27ff]", "");
		}catch(Exception ex){
			ex.printStackTrace();
		}
		return param;
	}

}

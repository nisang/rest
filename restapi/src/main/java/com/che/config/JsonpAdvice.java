package com.che.config;

import org.springframework.core.MethodParameter;
import org.springframework.core.annotation.Order;
import org.springframework.http.MediaType;
import org.springframework.http.converter.json.MappingJacksonValue;
import org.springframework.http.server.ServerHttpRequest;
import org.springframework.http.server.ServerHttpResponse;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.servlet.mvc.method.annotation.AbstractJsonpResponseBodyAdvice;

@Order(2)
@ControllerAdvice(basePackages = "com.che")
public class JsonpAdvice extends AbstractJsonpResponseBodyAdvice{
	
	public JsonpAdvice() {
        super("callback", "jsonp"); //指定jsonpParameterNames  
    }

}

package com.che.core;

import java.lang.reflect.Method;
import java.util.Comparator;
import java.util.Set;

import javax.servlet.http.HttpServletRequest;

import org.springframework.web.method.HandlerMethod;
import org.springframework.web.servlet.handler.AbstractHandlerMethodMapping;

public class CP_AbstractHandlerMethodMapping extends AbstractHandlerMethodMapping{


	@Override
	protected HandlerMethod getHandlerInternal(HttpServletRequest request) throws Exception {
		HandlerMethod handlerMethod = super.getHandlerInternal(request);
		if(handlerMethod == null){
			System.out.println("请求无法到达");
		}
		return handlerMethod;
	}

	@Override
	protected boolean isHandler(Class beanType) {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	protected Object getMappingForMethod(Method method, Class handlerType) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	protected Set getMappingPathPatterns(Object mapping) {
		
		return null;
	}

	@Override
	protected Object getMatchingMapping(Object mapping, HttpServletRequest request) {
		return null;
	}

	@Override
	protected Comparator getMappingComparator(HttpServletRequest request) {
		// TODO Auto-generated method stub
		return null;
	}

}

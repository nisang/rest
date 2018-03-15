package com.che.websocket.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.context.annotation.Bean;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.socket.TextMessage;

import com.che.common.web.Constants;
import com.che.common.web.Reply;
import com.che.core.ChatMessageHandler;

/**
 * http://www.cnblogs.com/1995hxt/p/5125615.html
 * http://www.myexception.cn/web/1775480.html
 * @author Administrator
 *
 */
@Controller
@RequestMapping("/websocker")
public class WebsocketController {
	
	@Bean
	public ChatMessageHandler infoHandler() {
		return new ChatMessageHandler();
	}
	@RequestMapping(value="/login",method={RequestMethod.POST,RequestMethod.GET})
	@ResponseBody
	public ModelAndView login(HttpServletRequest request, HttpServletResponse response) throws Exception {
		ModelAndView view = new ModelAndView("login");
		return view;
	}

	@RequestMapping(value="/tologin",method={RequestMethod.POST,RequestMethod.GET})
	@ResponseBody
	public ModelAndView tologin(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String username = request.getParameter("username");
		HttpSession session = request.getSession(false);
		session.setAttribute(Constants.SESSION_USERNAME, username);
		ModelAndView view = new ModelAndView("ws");
		String serverName = request.getServerName();
		String path = request.getContextPath();
		int serverPort = request.getServerPort();
		view.addObject("server",serverName+":"+serverPort+""+path);
		return view;
	}
	
	
	@RequestMapping(value="/clientlogin",method={RequestMethod.POST,RequestMethod.GET})
	@ResponseBody
	public Reply clientlogin(HttpServletRequest request, String username,String passwd) throws Exception {
		HttpSession session = request.getSession(false);
		session.setAttribute(Constants.SESSION_USERNAME, username);
		Reply reply = new Reply();
		reply.setMessage("登录成功");
		return reply;
	}
	
	@RequestMapping(value="/send",method={RequestMethod.POST,RequestMethod.GET})
	@ResponseBody
	public String send(HttpServletRequest request) {
		String username = request.getParameter("username");
		infoHandler().sendMessageToUser(username, new TextMessage("你好，测试！！！！"));
		return "";
	}

}

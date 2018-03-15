package com.che.websocket.service;

import org.apache.commons.lang3.StringUtils;
import org.springframework.context.annotation.Bean;
import org.springframework.stereotype.Service;
import org.springframework.web.socket.TextMessage;

import com.che.core.ChatMessageHandler;

@Service
public class WebsockerServiceImpl implements WebsockerService{

	@Bean
	public ChatMessageHandler infoHandler() {
		return new ChatMessageHandler();
	}
	@Override
	public void sendMessageToAllUser(String message) {
		if(StringUtils.isEmpty(message)) {
			return;
		}else{
			infoHandler().sendMessageToUsers(new TextMessage(message));
		}
	}
}

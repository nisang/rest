package com.che.config;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.annotation.PropertySource;
import org.springframework.context.support.PropertySourcesPlaceholderConfigurer;

/**
 * 
 * 配置载入并初始化
 * @author karlhell
 * "classpath:dev.properties","classpath:test.properties","classpath:preline.properties","classpath:prod.properties"
 * 
 */
@Configuration
@PropertySource(value={"classpath:test.properties"},ignoreResourceNotFound=true)
public class PropertyConfig {

	@Bean
	public static PropertySourcesPlaceholderConfigurer propertySourcesPlaceholderConfigurer() {
	    return new PropertySourcesPlaceholderConfigurer();
	}
	
}
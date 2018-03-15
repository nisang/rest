package com.che.run;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.EnableAutoConfiguration;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.builder.SpringApplicationBuilder;
import org.springframework.boot.context.embedded.ConfigurableEmbeddedServletContainer;
import org.springframework.boot.context.embedded.EmbeddedServletContainerCustomizer;
import org.springframework.boot.web.support.SpringBootServletInitializer;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.ImportResource;
import org.springframework.context.annotation.PropertySource;
import org.springframework.context.support.PropertySourcesPlaceholderConfigurer;

//@ComponentScan("com.che")
//@EnableAutoConfiguration
//@SpringBootApplication
//public class Application implements CommandLineRunner,EmbeddedServletContainerCustomizer {
//	public void run(String... args) throws Exception {
//		while (true) {
//			
//		}
//	}
//	public static void main(String[] args) throws Exception {
//		SpringApplication.run(Application.class, args);
//	}
//	public void customize(ConfigurableEmbeddedServletContainer container){
//		container.setPort(9099);
//	}
//	
//
//}
@SuppressWarnings("deprecation")
@ComponentScan("com.che")
@EnableAutoConfiguration
@SpringBootApplication
@ImportResource({"classpath:applicationContext.xml"})
public class Application extends SpringBootServletInitializer implements EmbeddedServletContainerCustomizer{

	private static Class<Application> applicationClass = Application.class;
    @Override
    protected SpringApplicationBuilder configure(SpringApplicationBuilder application) {
        return application.sources(Application.class);
    }

    public static void main(String[] args) throws Exception {
        SpringApplication.run(Application.class, args);
    }
//	@Bean
//	public Filter initializeHttpPutHandler() {
//		return new HttpPutFormContentFilter();
//	}
//	
//	@Bean
//	public CharacterEncodingFilter initializeCharacterEncodingFilter() {
//		CharacterEncodingFilter filter = new CharacterEncodingFilter();
//		filter.setEncoding("UTF-8");
//		filter.setForceEncoding(true);
//		return filter;
//	}

    /**
     * 自定义使用端口
     */
	public void customize(ConfigurableEmbeddedServletContainer container) {
		container.setPort(9098);
	}

	@Bean
	public static PropertySourcesPlaceholderConfigurer propertySourcesPlaceholderConfigurer() {
	    return new PropertySourcesPlaceholderConfigurer();
	}
}
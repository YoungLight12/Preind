package com.example.dogacat.service.email;

import java.util.Properties;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.annotation.PropertySource;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.JavaMailSenderImpl;



@Configuration
@PropertySource("classpath:email.properties")
public class EmailConfig {
	
	@Value("${spring.mail.transport.protocol}")
	private String protocol;
	
	@Value("${spring.mail.properties.mail.smtp.auth}")
	private boolean auth;
	
	@Value("${spring.mail.properties.mail.smtp.starttls.enable}")
	private boolean starttls;
	
	@Value("${spring.mail.debug}")
	private boolean debug;
	
	@Value("${spring.mail.host}")
	private String host;
	
	@Value("${spring.mail.port}")
	private int port;
	
	@Value("${spring.mail.username}")
	private String username;
	
	@Value("${spring.mail.password}")
	private String password;
	
	@Value("${spring.mail.default.encoding}")
	private String encoding;
	
	@Bean
	public JavaMailSender javaMailSender() {
		JavaMailSenderImpl mailSenderImpl = new JavaMailSenderImpl();
		Properties properties = new Properties();
		
		properties.put("mail.transport.protocal", protocol);
		properties.put("mail.smtp.auth", auth);
		properties.put("mail.smtp.starttls.enable", starttls);
		properties.put("mail.smtp.debug", debug);
		
		mailSenderImpl.setHost(host);
		mailSenderImpl.setUsername(username);
		mailSenderImpl.setPassword(password);
		mailSenderImpl.setPort(port);
		mailSenderImpl.setJavaMailProperties(properties);
		mailSenderImpl.setDefaultEncoding(encoding);
		
		return mailSenderImpl;
	}
}

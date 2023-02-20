package com.example.dogacat.interceptor;

import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.InterceptorRegistration;
import org.springframework.web.servlet.config.annotation.InterceptorRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

@Configuration	// 스프링의 환경설정 클래스
public class WebMvConfig implements WebMvcConfigurer {
	
	@Override
	public void addInterceptors(InterceptorRegistry registry) {	
		InterceptorRegistration reg = registry.addInterceptor(new LoginInterceptor());
		reg.addPathPatterns("/homepage/**");
		reg.addPathPatterns("/member/*");
	}
}

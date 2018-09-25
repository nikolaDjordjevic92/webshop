package com.webshop.spring;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.EnableAutoConfiguration;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.autoconfigure.domain.EntityScan;
import org.springframework.context.annotation.ComponentScan;

@ComponentScan
@EnableAutoConfiguration
@SpringBootApplication
@EntityScan(basePackages = "com.webshop.spring.model")
public class WebstoreApplication {

	public static void main(String[] args) {
		SpringApplication.run(WebstoreApplication.class, args);
	}
}
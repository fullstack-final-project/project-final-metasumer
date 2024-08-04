package com.spring_boot_final.metasumer;

import org.mybatis.spring.annotation.MapperScan;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.autoconfigure.security.servlet.SecurityAutoConfiguration;
import org.springframework.context.annotation.ComponentScan;

@SpringBootApplication(exclude = {SecurityAutoConfiguration.class}) 
@ComponentScan(basePackages = {"com.spring_boot_final.metasumer"})
@MapperScan(basePackages = {"com.spring_boot_final.metasumer"})
public class SpringBootProjectFinalApplication {

	public static void main(String[] args) {
		SpringApplication.run(SpringBootProjectFinalApplication.class, args);
	}

}

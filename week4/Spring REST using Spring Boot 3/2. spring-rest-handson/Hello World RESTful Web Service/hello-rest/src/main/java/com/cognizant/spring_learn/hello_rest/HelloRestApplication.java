package com.cognizant.spring_learn.hello_rest;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.context.annotation.ComponentScan;

@SpringBootApplication
@ComponentScan("com.cognizant.spring_learn") // ✅ Ensures controller gets picked up
public class HelloRestApplication {

    public static void main(String[] args) {
        SpringApplication.run(HelloRestApplication.class, args);
        System.out.println("Spring Boot app started on port 8083");
    }
}

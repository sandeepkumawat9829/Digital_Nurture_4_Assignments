package com.cognizant.spring_learn;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.context.annotation.ComponentScan;

@SpringBootApplication
@ComponentScan("com.cognizant.spring_learn") // Important for scanning model/controller
public class CountryRestApplication {

    public static void main(String[] args) {
        SpringApplication.run(CountryRestApplication.class, args);
        System.out.println("✅ Country Web Service is running at http://localhost:8083/country");
    }
}

package com.cognizant.spring_learn;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.context.annotation.ComponentScan;

@SpringBootApplication
@ComponentScan("com.cognizant.spring_learn")
public class CountryCodeRestApplication {
    public static void main(String[] args) {
        SpringApplication.run(CountryCodeRestApplication.class, args);
        System.out.println("✅ CountryCodeRest is running on http://localhost:8083/countries/IN");
    }
}


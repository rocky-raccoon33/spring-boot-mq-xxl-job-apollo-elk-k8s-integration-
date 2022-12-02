package com.example.app;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.context.annotation.ComponentScan;

@ComponentScan(basePackages = "com.example")
@SpringBootApplication
public class AppApplication {

    private static Logger logger = LoggerFactory.getLogger(AppApplication.class);

    public static void main(String[] args) {
        
        SpringApplication.run(AppApplication.class, args);
        logger.info("Application started...");
    }
}

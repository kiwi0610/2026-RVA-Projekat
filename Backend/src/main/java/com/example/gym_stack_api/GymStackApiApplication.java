package com.example.gym_stack_api;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;

@SpringBootApplication
public class GymStackApiApplication {

	public static void main(String[] args) {
		SpringApplication.run(GymStackApiApplication.class, args);

        System.out.println("\n----------------------------------------------------------");
        System.out.println("Aplikacija je pokrenuta! Klikni na link ispod:");
        System.out.println("http://localhost:8080/api/shop/all");
        System.out.println("----------------------------------------------------------\n");
	}

}

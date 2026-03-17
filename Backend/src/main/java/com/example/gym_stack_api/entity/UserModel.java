package com.example.gym_stack_api.entity;

import jakarta.persistence.*;
import lombok.Data;

@Entity
@Table(name = "user")
@Data
public class UserModel {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "user_id") // OVO JE KLJUČNO: Povezuješ 'id' sa 'user_id' iz baze
    private Long id;

    private String first_name;
    private String last_name;
    private String email;
    private String password;
    private String address;
    private String city;
    private String phone_number;
}

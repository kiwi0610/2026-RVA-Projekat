package com.example.gym_stack_api.repository;

import com.example.gym_stack_api.entity.UserModel;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface UserRepository extends JpaRepository<UserModel, Long> {
    UserModel findByEmail(String email); // Ova linija omogućava pretragu po emailu
}
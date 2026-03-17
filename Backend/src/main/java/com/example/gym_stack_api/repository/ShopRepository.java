package com.example.gym_stack_api.repository;

import com.example.gym_stack_api.entity.ShopModel;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface ShopRepository extends JpaRepository<ShopModel,Long> {

}

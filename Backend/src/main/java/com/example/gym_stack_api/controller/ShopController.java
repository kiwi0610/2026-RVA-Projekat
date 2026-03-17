package com.example.gym_stack_api.controller;

import com.example.gym_stack_api.entity.ShopModel;
import com.example.gym_stack_api.repository.ShopRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("/api/shop")
@CrossOrigin(origins = "http://localhost:5173")
public class ShopController {

    @Autowired
    private ShopRepository repository;

    @GetMapping("/all")
    public List<ShopModel> getAll(){
        return repository.findAll();
    }

    @GetMapping("/{id}")
    public ShopModel getItemById(@PathVariable Long id){
        return repository.findById(id).orElse(null);
    }
}
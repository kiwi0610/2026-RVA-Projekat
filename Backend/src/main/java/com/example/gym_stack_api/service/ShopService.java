package com.example.gym_stack_api.service;

import com.example.gym_stack_api.entity.ShopModel;
import com.example.gym_stack_api.repository.ShopRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class ShopService {

    @Autowired
    private ShopRepository repository;

    //Metoda koja vraca proizvode
    public List<ShopModel> getAllProducts(){
        return repository.findAll();
    }


}

package com.example.gym_stack_api.controller;

import com.example.gym_stack_api.entity.Order;
import com.example.gym_stack_api.entity.OrderItem;
import com.example.gym_stack_api.repository.OrderItemRepository;
import com.example.gym_stack_api.repository.OrderRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.Date;

@RestController
@RequestMapping("/api/orders")
@CrossOrigin(origins = "http://localhost:5173")
public class OrderController {

    @Autowired
    private OrderRepository orderRepository;

    @Autowired
    private OrderItemRepository orderItemRepository;

    @PostMapping
    public ResponseEntity<?> createOrder(@RequestBody OrderRequest orderRequest) {
        try {
            Order novaPorudzbina = new Order();
            novaPorudzbina.setUserId(orderRequest.getUserId());
            novaPorudzbina.setTotalPrice(orderRequest.getTotalPrice());
            novaPorudzbina.setOrderDate(new Date());
            novaPorudzbina.setStatus("PENDING");
            novaPorudzbina.setAmount(orderRequest.getItems().size());

            Order sacuvanOrder = orderRepository.save(novaPorudzbina);

            for (ItemRequest item : orderRequest.getItems()) {
                OrderItem stavka = new OrderItem();
                stavka.setOrderId(sacuvanOrder.getId());
                stavka.setItemId(item.getItemId());
                stavka.setAmount(item.getAmount());
                stavka.setPrice(item.getPrice());

                // IZRAČUNAJ TOTAL (cena * količina):
                stavka.setTotal(item.getPrice() * item.getAmount());

                orderItemRepository.save(stavka);
            }

            return ResponseEntity.ok("Porudžbina je uspešno upisana u bazu!");
        } catch (Exception e) {
            e.printStackTrace();
            return ResponseEntity.internalServerError().body("Greška: " + e.getMessage());
        }
    }
}
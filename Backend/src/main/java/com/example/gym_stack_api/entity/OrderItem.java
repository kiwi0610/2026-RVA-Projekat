package com.example.gym_stack_api.entity;

import jakarta.persistence.*;
import lombok.Data;

@Entity
@Table(name = "order_items")
@Data
public class OrderItem {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @Column(name = "order_id")
    private Long orderId;

    @Column(name = "item_id")
    private Long itemId;

    @Column(name = "amount")
    private Integer amount;

    @Column(name = "price")
    private Double price;

    // DODAJ OVO POLJE:
    @Column(name = "total")
    private Double total;
}
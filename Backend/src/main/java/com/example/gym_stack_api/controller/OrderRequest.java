package com.example.gym_stack_api.controller;

import java.util.List;

public class OrderRequest {
    private Long userId;
    private Double totalPrice;
    private List<ItemRequest> items;

    // Getteri i Setteri
    public Long getUserId() { return userId; }
    public void setUserId(Long userId) { this.userId = userId; }
    public Double getTotalPrice() { return totalPrice; }
    public void setTotalPrice(Double totalPrice) { this.totalPrice = totalPrice; }
    public List<ItemRequest> getItems() { return items; }
    public void setItems(List<ItemRequest> items) { this.items = items; }
}
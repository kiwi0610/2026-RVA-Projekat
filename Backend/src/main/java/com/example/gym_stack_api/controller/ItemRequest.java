package com.example.gym_stack_api.controller;

public class ItemRequest {
    private Long itemId;
    private Integer amount;
    private Double price;

    // Getteri i Setteri
    public Long getItemId() { return itemId; }
    public void setItemId(Long itemId) { this.itemId = itemId; }
    public Integer getAmount() { return amount; }
    public void setAmount(Integer amount) { this.amount = amount; }
    public Double getPrice() { return price; }
    public void setPrice(Double price) { this.price = price; }
}
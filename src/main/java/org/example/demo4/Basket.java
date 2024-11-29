package org.example.demo4;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.HashMap;
import java.util.LinkedHashMap;
import java.util.Map;
@Data
@AllArgsConstructor
@NoArgsConstructor
public class Basket {

    private Map<Product,Integer>map= new LinkedHashMap<>();
    private Map<String, OrderItem> orderItems = new HashMap<>();
    public void addOrderItem(OrderItem orderItem) {
        String productId = String.valueOf(orderItem.getProduct().getId());

        // If the product already exists in the basket, update the quantity
        if (orderItems.containsKey(productId)) {
            OrderItem existingItem = orderItems.get(productId);
            existingItem.setQuantity(existingItem.getQuantity() + orderItem.getQuantity());
        } else {
            // Otherwise, add the new item
            orderItems.put(productId, orderItem);
        }
    }

}

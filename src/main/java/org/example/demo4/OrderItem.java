package org.example.demo4;


import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class OrderItem {
    private Product product;
    private int quantity;
    private int orderId;


    public OrderItem(Product product, int quantity) {
        this.product = product;
        this.quantity = quantity;
    }


    public Product getProduct() {
        return product;
    }

    public int getQuantity() {
        return quantity;
    }


    public double getTotalPrice() {
        return product.getPrice() * quantity;
    }
}

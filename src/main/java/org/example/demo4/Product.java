package org.example.demo4;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.Date;
@Data
@NoArgsConstructor
@AllArgsConstructor
public class Product {
    private int id=idGen++;
    private String name;
    private double price;
    private static Integer idGen=1;

    public Product(String name, double price, int category_Id, String imageUrl) {
        this.name = name;
        this.price = price;
        this.category_Id = category_Id;
        this.imageUrl = imageUrl;
    }

    private int category_Id;
    private String imageUrl;

}

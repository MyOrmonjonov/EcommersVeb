package org.example.demo4;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.List;
@AllArgsConstructor
@Data
@NoArgsConstructor
public class User {
    private Integer userId=idGen++;
    private String name;
    private String phone;
    private String email;
    private String image;
    private static Integer idGen=0;
    private String role;

    public User(String name, String phone, String email, String image, String password,String role) {
        this.name = name;
        this.phone = phone;
        this.email = email;
        this.image = image;
        this.password = password;
        this.role=role;
    }
    public User(String name, String password,String role,String phone) {
        this.name = name;
        this.password = password;
        this.role=role;
        this.phone=phone;
    }

    private String password;

    private List<Order> orders;

}

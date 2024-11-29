package org.example.demo4;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@NoArgsConstructor
@AllArgsConstructor
@Data
public class Admin {
    private String name;
    private String login;
    private String password;
    private String role="Admin";
}

package com.example.jwt_authentication.controller;

import com.example.jwt_authentication.util.JwtUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.HashMap;
import java.util.Map;

@RestController
public class AuthController {

    @Autowired
    private JwtUtil jwtUtil;

    @GetMapping("/authenticate")
    public Map<String, String> authenticate(Authentication authentication) {
        Map<String, String> response = new HashMap<>();

        if (authentication == null) {
            response.put("error", "Authentication object is null");
            return response;
        }

        String username = authentication.getName();
        String token = jwtUtil.generateToken(username);
        response.put("token", token);
        return response;
    }
}

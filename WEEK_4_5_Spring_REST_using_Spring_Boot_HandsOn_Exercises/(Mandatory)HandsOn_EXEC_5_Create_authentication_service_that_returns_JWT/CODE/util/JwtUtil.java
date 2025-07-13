package com.example.jwt_authentication.util;
import io.jsonwebtoken.Jwts;
import io.jsonwebtoken.SignatureAlgorithm;
import io.jsonwebtoken.security.Keys;
import org.springframework.stereotype.Component;

import java.security.Key;

@Component
public class JwtUtil {

    private final String secret = "my-secret-key-which-should-be-long-enough-for-hmac";

    public String generateToken(String username) {
        Key key = Keys.hmacShaKeyFor(secret.getBytes());

        return Jwts.builder()
                .setSubject(username)
                .signWith(key, SignatureAlgorithm.HS256)
                .compact();
    }
}

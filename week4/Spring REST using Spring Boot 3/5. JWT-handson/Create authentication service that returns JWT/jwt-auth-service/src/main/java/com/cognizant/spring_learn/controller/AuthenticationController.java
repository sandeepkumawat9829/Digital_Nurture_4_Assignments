package com.cognizant.jwt_auth_service.controller;

import io.jsonwebtoken.Jwts;
import io.jsonwebtoken.SignatureAlgorithm;
import jakarta.servlet.http.HttpServletRequest; // ✅ Correct import
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.Base64;
import java.util.Date;

@RestController
public class AuthenticationController {

    private final String SECRET_KEY = "secret123"; // Don't hardcode in real apps

    @GetMapping("/authenticate")
    public ResponseEntity<?> authenticate(HttpServletRequest request) {
        String authHeader = request.getHeader("Authorization");

        if (authHeader != null && authHeader.startsWith("Basic ")) {
            String base64Credentials = authHeader.substring("Basic ".length());
            byte[] credDecoded = Base64.getDecoder().decode(base64Credentials);
            String credentials = new String(credDecoded);
            String[] values = credentials.split(":", 2);

            String username = values[0];
            String password = values[1];

            if ("user".equals(username) && "pwd".equals(password)) {
                String token = Jwts.builder()
                        .setSubject(username)
                        .setIssuedAt(new Date())
                        .setExpiration(new Date(System.currentTimeMillis() + 600000)) // 10 min
                        .signWith(SignatureAlgorithm.HS256, SECRET_KEY)
                        .compact();

                return ResponseEntity.ok("{\"token\":\"" + token + "\"}");
            }
        }

        return ResponseEntity.status(401).body("Unauthorized");
    }
}

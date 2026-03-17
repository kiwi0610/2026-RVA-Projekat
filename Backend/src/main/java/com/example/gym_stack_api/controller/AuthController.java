package com.example.gym_stack_api.controller;

import com.example.gym_stack_api.entity.UserModel;
import com.example.gym_stack_api.repository.UserRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.web.bind.annotation.*;

@RestController
@RequestMapping("/api/auth")
@CrossOrigin(origins = "http://localhost:5173")
public class AuthController {

    @Autowired
    private UserRepository userRepository;

    BCryptPasswordEncoder encoder = new BCryptPasswordEncoder();

    @PostMapping("/register")
    public ResponseEntity<?> register(@RequestBody UserModel user) {
        if (userRepository.findByEmail(user.getEmail()) != null) {
            return ResponseEntity.badRequest().body("Email je zauzet");
        }
        // HEŠOVANJE:
        String hashed = encoder.encode(user.getPassword());
        user.setPassword(hashed);

        userRepository.save(user);
        return ResponseEntity.ok("Korisnik uspešno registrovan");
    }

    @PostMapping("/login")
    public ResponseEntity<?> login(@RequestBody LoginRequest request) {
        UserModel user = userRepository.findByEmail(request.getEmail());

        // PROVERA HEŠA:
        if (user != null && encoder.matches(request.getPassword(), user.getPassword())) {
            return ResponseEntity.ok(user);
        }
        return ResponseEntity.status(401).body("Pogrešan email ili lozinka");
    }

    @PutMapping("/{id}")
    public ResponseEntity<?> updateUser(@PathVariable Long id, @RequestBody UserModel userDetails) {
        BCryptPasswordEncoder encoder = new BCryptPasswordEncoder();

        return userRepository.findById(id).map(user -> {
            // Klasični podaci
            user.setCity(userDetails.getCity());
            user.setAddress(userDetails.getAddress());
            user.setPhone_number(userDetails.getPhone_number());

            // Logika za lozinku: Menja je samo ako je korisnik poslao nešto novo
            if (userDetails.getPassword() != null && !userDetails.getPassword().isEmpty()) {
                user.setPassword(encoder.encode(userDetails.getPassword()));
            }

            UserModel updatedUser = userRepository.save(user);
            return ResponseEntity.ok(updatedUser);
        }).orElse(ResponseEntity.notFound().build());
    }

}
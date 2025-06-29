package com.sahasra.springtest;

import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

import java.util.Optional;

import static org.junit.jupiter.api.Assertions.*;

@SpringBootTest(classes = SpringTestApplication.class)
public class UserIntegrationTest {

    @Autowired
    private UserRepository userRepository;

    @Test
    public void testFullFlow() {
        // Step 1: Create a new user
        User newUser = new User();
        newUser.setName("TestUser");

        // Step 2: Save the user to H2 in-memory DB
        User savedUser = userRepository.save(newUser);
        Long savedId = savedUser.getId(); // Get the auto-generated ID

        // Step 3: Retrieve the user using the saved ID
        Optional<User> result = userRepository.findById(savedId);

        // Step 4: Assertions to check correctness
        assertNotNull(result.orElse(null), "User should not be null");
        assertEquals("TestUser", result.get().getName());
    }
}

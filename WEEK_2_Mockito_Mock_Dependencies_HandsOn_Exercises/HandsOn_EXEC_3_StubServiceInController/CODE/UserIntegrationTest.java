package com.sahasra.mocktest;

import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;
import org.springframework.http.ResponseEntity;

import static org.junit.jupiter.api.Assertions.assertEquals;

public class UserIntegrationTest {

    private UserController userController;

    @BeforeEach
    public void setup() {
        // ✅ Create fake user service manually
        UserService fakeService = new UserService() {
            @Override
            public User getUserById(Long id) {
                return new User(id, "StubUser");
            }
        };

        userController = new UserController(fakeService);
    }

    @Test
    public void testGetUserFromControllerWithFakeService() {
        ResponseEntity<User> response = userController.getUser(1L);

        assertEquals(200, response.getStatusCode().value());
        assertEquals("StubUser", response.getBody().getName());
    }
}

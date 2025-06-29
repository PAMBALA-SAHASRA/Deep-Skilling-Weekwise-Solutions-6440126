package com.sahasra.mocktest;

import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;
import org.springframework.http.ResponseEntity;

import static org.junit.jupiter.api.Assertions.assertEquals;

public class UserControllerTest {

    private UserService stubService;
    private UserController userController;

    @BeforeEach
    public void setup() {
        stubService = new UserService() {
            @Override
            public User getUserById(Long id) {
                return new User(id, "StubUser");
            }
        };

        userController = new UserController(stubService);
    }

    @Test
    public void testGetUser() {
        ResponseEntity<User> response = userController.getUser(1L);
        assertEquals(200, response.getStatusCode().value());
        assertEquals("StubUser", response.getBody().getName());
    }
}

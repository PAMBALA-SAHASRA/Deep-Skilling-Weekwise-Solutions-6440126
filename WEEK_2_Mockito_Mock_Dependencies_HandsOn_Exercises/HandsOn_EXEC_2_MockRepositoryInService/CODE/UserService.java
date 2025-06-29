package com.sahasra.mocktest;

import org.springframework.stereotype.Service;

@Service
public class UserService {

    // We are not using a real repository, so we skip autowiring it

    public User getUserById(Long id) {
        // Return dummy user (used in tests and controller)
        return new User(id, "MockedUser");
    }
}

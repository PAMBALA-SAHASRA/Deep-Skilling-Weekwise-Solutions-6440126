package com.example;

import org.junit.Before;
import org.junit.After;
import org.junit.Test;
import static org.junit.Assert.*;

public class UserTest {
    private User user;

    @Before
    public void setUp() {
        user = new User("Alice");
    }

    @Test
    public void testGreet() {
        // Arrange done in setUp
        // Act
        String greeting = user.greet();
        // Assert
        assertEquals("Hello, Alice", greeting);
    }

    @After
    public void tearDown() {
        user = null; // Clean-up
    }
}

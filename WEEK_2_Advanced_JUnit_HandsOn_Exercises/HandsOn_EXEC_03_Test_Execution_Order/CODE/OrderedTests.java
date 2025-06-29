package com.sahasra.junit;

import org.junit.jupiter.api.*;

@TestMethodOrder(MethodOrderer.OrderAnnotation.class)
public class OrderedTests {

    @Test
    @Order(1)
    void testFirst() {
        System.out.println("Running First Test");
    }

    @Test
    @Order(2)
    void testSecond() {
        System.out.println("Running Second Test");
    }

    @Test
    @Order(3)
    void testThird() {
        System.out.println("Running Third Test");
    }
}

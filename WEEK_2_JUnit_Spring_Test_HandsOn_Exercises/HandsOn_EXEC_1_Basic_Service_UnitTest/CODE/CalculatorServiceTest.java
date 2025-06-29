package com.sahasra.springtest;

import org.junit.jupiter.api.Test;
import static org.junit.jupiter.api.Assertions.assertEquals;

public class CalculatorServiceTest {
    @Test
    void testAdd() {
        CalculatorService service = new CalculatorService();
        assertEquals(7, service.add(3, 4));
    }
}

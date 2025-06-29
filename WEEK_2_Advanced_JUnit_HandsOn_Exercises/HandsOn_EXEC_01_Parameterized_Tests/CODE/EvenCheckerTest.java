package com.sahasra.junit;

import static org.junit.jupiter.api.Assertions.assertTrue;
import org.junit.jupiter.params.ParameterizedTest;
import org.junit.jupiter.params.provider.ValueSource;

public class EvenCheckerTest {

    @ParameterizedTest
    @ValueSource(ints = { 2, 4, 6, 8, 10 })
    void testIsEven(int number) {
        assertTrue(EvenChecker.isEven(number));
    }
}

package com.sahasra.springtest;

import static org.junit.jupiter.api.Assertions.assertEquals;

import java.util.stream.Stream;

import org.junit.jupiter.params.ParameterizedTest;
import org.junit.jupiter.params.provider.Arguments;
import org.junit.jupiter.params.provider.MethodSource;

public class CalculatorServiceParamTest {

    static Stream<Arguments> addValues() {
        return Stream.of(
                Arguments.of(1, 2, 3),
                Arguments.of(4, 5, 9),
                Arguments.of(10, 20, 30));
    }

    @ParameterizedTest
    @MethodSource("addValues")
    void testAdd(int a, int b, int expected) {
        CalculatorService service = new CalculatorService();
        assertEquals(expected, service.add(a, b));
    }
}

package com.example.exercise3;

import org.junit.Test;
import static org.junit.Assert.*;

public class MathOperationsTest {
    private final MathOperations math = new MathOperations();

    @Test
    public void testMultiply() {
        assertEquals("Multiplication failed", 12, math.multiply(4, 3));
    }

    @Test
    public void testDivide() {
        assertEquals(5.0, math.divide(10, 2), 0.0001);
    }

    @Test
    public void testDivideByZero() {
        try {
            math.divide(10, 0);
            fail("Expected IllegalArgumentException");
        } catch (IllegalArgumentException e) {
            assertEquals("Division by zero", e.getMessage());
        }
    }

    @Test
    public void testMultiplyNotZero() {
        int result = math.multiply(4, 3);
        assertFalse("Result should not be zero", result == 0);
    }
}
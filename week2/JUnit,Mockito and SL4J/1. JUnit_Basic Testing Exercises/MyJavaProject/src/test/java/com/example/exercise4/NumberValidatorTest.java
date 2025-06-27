package com.example.exercise4;

import org.junit.Test;
import static org.junit.Assert.*;

public class NumberValidatorTest {
    private final NumberValidator validator = new NumberValidator();

    @Test
    public void testPositiveNumber() {
        assertTrue(validator.isPositive(5));
    }

    @Test
    public void testNegativeNumber() {
        assertFalse(validator.isPositive(-5));
    }

    @Test
    public void testZero() {
        assertFalse(validator.isPositive(0));
    }

    @Test
    public void testCategorizePositive() {
        assertEquals("Positive", validator.categorizeNumber(10));
    }

    @Test
    public void testCategorizeNegative() {
        assertEquals("Negative", validator.categorizeNumber(-10));
    }

    @Test
    public void testCategorizeZero() {
        assertEquals("Zero", validator.categorizeNumber(0));
    }
}
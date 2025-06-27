package com.example.exercise1;

import org.junit.Test;
import static org.junit.Assert.*;

public class SimpleAppTest {
    @Test
    public void testIsRunning() {
        SimpleApp app = new SimpleApp();
        assertTrue(app.isRunning());
    }
}
package com.example.exercise4;

public class NumberValidator {
    public boolean isPositive(int number) {
        return number > 0;
    }

    public String categorizeNumber(int number) {
        if (number < 0) return "Negative";
        if (number == 0) return "Zero";
        return "Positive";
    }
}
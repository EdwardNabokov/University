package com.solutions.labwork6;

public class main {
    public static void main(String[] args) {
        StrategyClient str = new StrategyClient();
        str.setCoordinateSystem(new CartesianCoordinateSystem());
        str.executeStrategyWithParameters(10, 15, 2);
        str.executeStrategyWithParameters(1, 1,5);
//        str.executeStrategyWithParameters(50, 10, 100);
//        str.executeStrategyWithParameters(10, 15, 2);
//        str.executeStrategyWithParameters(10, 15, 2);
//
//        str.setCoordinateSystem(new PolarCoordinateSystem());
////        str.executeStrategyWithParameters();
    }
}

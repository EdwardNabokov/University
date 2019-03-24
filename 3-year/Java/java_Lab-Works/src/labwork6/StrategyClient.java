package com.solutions.labwork6;

class StrategyClient {
    CoordinateSystem system;

    public void setCoordinateSystem(CoordinateSystem sys) {
        this.system = sys;
    }

    public void executeStrategyWithParameters(double a, double b, double c){
        this.system.draw(a, b, c);
    }
}

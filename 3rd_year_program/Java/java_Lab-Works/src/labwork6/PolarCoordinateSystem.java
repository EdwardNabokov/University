package com.solutions.labwork6;

import java.awt.*;

import static java.lang.Math.cos;
import static java.lang.Math.sin;

class PolarCoordinateSystem implements CoordinateSystem {

    double x, y, r = 0, angle = 30;

    public void mathFunction() {
        x = r * cos(angle);
        y = r * sin(angle);

    }

    public void draw(double a, double b, double c) {
        System.out.println("Hello from Polar coordinate system.");

        EventQueue.invokeLater(new Runnable() {
            @Override
            public void run() {
                BasicStrokesEx_ ex = new BasicStrokesEx_();
                ex.setVisible(true);
            }
        });
    }
}

package com.solutions.labwork6;

import java.awt.*;

class CartesianCoordinateSystem implements CoordinateSystem {

    @Override
    public void draw(double a, double b, double c) {
        System.out.println("Hello from Cartesian coordinate system.");

        EventQueue.invokeLater(new Runnable() {
            @Override
            public void run() {
                BasicStrokesEx_ ex = new BasicStrokesEx_();
                ex.initUI(a, b, c);
                ex.setVisible(true);
            }
        });
    }
}

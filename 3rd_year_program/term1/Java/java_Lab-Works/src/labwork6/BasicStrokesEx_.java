package com.solutions.labwork6;

import javax.swing.*;
import java.awt.*;

public class BasicStrokesEx_ extends JFrame {

    public void initUI(double a, double b, double c) {
        add(new DrawUtils(a, b, c));

        setTitle("Basic strokes");
        setSize(400, 400);
        setLocationRelativeTo(null);
        setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
    }
}

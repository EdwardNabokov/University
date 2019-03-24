//package com.solutions.labwork6;
//
//import java.awt.*;
//import javax.swing.JFrame;
//import javax.swing.JPanel;
//
//class Surface extends JPanel {
//
//    double A = 1;
//    double B = 0;
//    double C = 0;
//
//    private void doDrawing(Graphics g) {
//
//        Graphics2D g2d = (Graphics2D) g.create();
//
//        g2d.setColor(Color.RED);
////        g2d.drawString("Cartesian coordinate system", 20, 20);
////        g2d.drawLine(200, 30, 200, 370); // vertical line
////        g2d.drawLine(30, 200, 370, 200); // horizontal line
//        g.setColor(Color.gray);
//        for (int x = 0; x <=400; x = x + 20)
//        {
//            g.drawLine(x,0,x,400);
//        }
//        for (int y = 0; y <=400; y = y + 20)
//        {
//            g.drawLine(0,y,400,y);
//        }
//        g.setColor(Color.black);
//        g.drawLine(200,0,200,400);
//        g.drawLine(199,0,199,400);
//        g.drawLine(0,199,400,199);
//        g.drawLine(0,200,400,200);
//        g2d.dispose();
//    }
//
//    public void curve(Graphics g)
//    {
//        g.setColor(Color.red);
//        for (double x=-10;x<=10;x = x+0.1)
//        {
//            double y = A*x*x+B*x+C;
//            int xp = (int)Math.round(200 + x*20);
//            int yp = (int)Math.round(200 - y*20);
//            g.fillOval(xp-2,yp-2,5,5);
//
//        }
//    }
//
//    @Override
//    public void paintComponent(Graphics g) {
//
//        super.paintComponent(g);
//        doDrawing(g);
//        curve(g);
//    }
//}
//
//public class BasicStrokesEx extends JFrame {
//
//    public BasicStrokesEx() {
//
//        initUI();
//    }
//
//    private void initUI() {
//
//        add(new Surface());
//
//        setTitle("Basic strokes");
//        setSize(400, 400);
//        setLocationRelativeTo(null);
//        setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
//    }
//
//    public static void main(String[] args) {
//
//        EventQueue.invokeLater(new Runnable() {
//            @Override
//            public void run() {
//
//                BasicStrokesEx ex = new BasicStrokesEx();
//                ex.setVisible(true);
//            }
//        });
//    }
//}
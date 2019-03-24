package kpi.labs;

import java.awt.*;
import java.awt.event.MouseAdapter;
import java.awt.event.MouseEvent;
import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.io.PrintWriter;
import java.net.Socket;
import javax.swing.ImageIcon;
import javax.swing.JFrame;
import javax.swing.JLabel;
import javax.swing.JOptionPane;
import javax.swing.JPanel;

public class Client {
    private JFrame frame = new JFrame("Tic Tac Toe");
    private JLabel lbl = new JLabel("");
    private ImageIcon tileImage;
    private ImageIcon enemyTileImage;

    private Tile tile;
    private Tile[] board = new Tile[9];

    private Socket sock;
    private BufferedReader in;
    private PrintWriter out;

    private Client(String server) throws Exception {
        sock = new Socket(server, 8901);
        in = new BufferedReader(
            new InputStreamReader(sock.getInputStream()));
        out = new PrintWriter(sock.getOutputStream(), true);

        lbl.setBackground(Color.white);
        this.frame.getContentPane().add(lbl, "South");

        JPanel boardPanel = new JPanel();
        boardPanel.setBackground(Color.black);
        boardPanel.setLayout(new GridLayout(3, 3, 2, 2));

        for (int i = 0; i < board.length; i++) {
            final int j = i;
            board[i] = new Tile();
            board[i].addMouseListener(new MouseAdapter() {
                public void mousePressed(MouseEvent e) {
                    tile = board[j];
                    out.println("TURN " + j);
                }
            });
            boardPanel.add(board[i]);
        }

        this.frame.getContentPane().add(boardPanel, "Center");
    }

    private void play() throws Exception {
        try {
            String resp = in.readLine();
            if (resp.startsWith("WELCOME")) {
                char playerMark = resp.charAt(resp.length() - 1);
                tileImage = new ImageIcon(this.getClass().getResource((playerMark == 'X' ? "x.png" : "o.png")));
                enemyTileImage  = new ImageIcon(this.getClass().getResource(playerMark == 'O' ? "x.png" : "o.png"));
                this.frame.setTitle("Player " + playerMark);
            }

            while (true) {
                resp = in.readLine();
                if (resp.startsWith("VAL_TURN")) {
                    tile.setIcon(tileImage);
                    lbl.setText("Please wait for enemy turn");
                    tile.repaint();
                } else if (resp.startsWith("ENEMY_TURNED")) {
                    int loc = Integer.parseInt(resp.substring(resp.length() - 1));
                    board[loc].setIcon(enemyTileImage);
                    lbl.setText("Enemy moved, your turn");
                    board[loc].repaint();
                } else if (resp.startsWith("WIN")) {
                    lbl.setText("You win");
                    break;
                } else if (resp.startsWith("LOSE")) {
                    lbl.setText("You lose");
                    break;
                } else if (resp.startsWith("TIE")) {
                    lbl.setText("You tied");
                    break;
                } else if (resp.startsWith("MSG")) {
                    lbl.setText(resp.substring(resp.length() - 1));
                }
            }

            out.println("QUIT");
        } finally {
            sock.close();
        }
    }

    private boolean restartGame() {
        int resp = JOptionPane.showConfirmDialog(this.frame,
                "Do you want to play again", "Tic Tac Toe", JOptionPane.YES_NO_OPTION);
        this.frame.dispose();
        return resp == JOptionPane.YES_OPTION;
    }

    static class Tile extends JPanel {
        JLabel label = new JLabel((ImageIcon) null);

        Tile() {
            this.setBackground(Color.white);
            add(label);
        }

        void setIcon(ImageIcon tileImage) {
            tileImage.getImage().flush();
            tileImage = new ImageIcon(tileImage.getImage().getScaledInstance(150, 150, java.awt.Image.SCALE_SMOOTH));
            label.setIcon(tileImage);
            label.setLayout(new BorderLayout());
        }
    }

    public static void main(String[] args) throws Exception {
        while (true) {
            String server = (args.length == 0) ? "localhost" : args[1];

            Client client = new Client(server);
            client.frame.setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
            client.frame.setSize(600, 600);
            client.frame.setVisible(true);
            client.frame.setResizable(false);
            client.play();

            if (!client.restartGame()) {
                break;
            }
        }
    }
}
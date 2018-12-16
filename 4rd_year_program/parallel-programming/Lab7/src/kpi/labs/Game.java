package kpi.labs;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.PrintWriter;
import java.net.Socket;

class Game {
    private Player[] board = {
            null, null, null,
            null, null, null,
            null, null, null,
    };

    Player currPlayer;

    private boolean checkPattern() {
        int boardRows = 3;

        for(int i = 0; i < boardRows; i++) {
            if (board[i*3] != null) {
                if (board[i*3] == board[i*3 + 1] && board[i*3] == board[i*3 + 2]) {
                    return true;
                }
            }

            if (board[i] != null) {
                if (board[i] == board[i + 3] && board[i] == board[i + 5]) {
                    return true;
                }
            }
        }

        if (board[0] != null && board[0] == board[4] && board[0] == board[8]) {
            return true;
        }

        if (board[2] != null && board[2] == board[4] && board[2] == board[6]) {
            return true;
        }

        return false;
    }

    private boolean fillBoard() {
        for (Player tile : board) {
            if (tile == null) {
                return false;
            }
        }
        return true;
    }

    private synchronized boolean checkMove(int location, Player player) {
        if (player == currPlayer && board[location] == null) {
            board[location] = currPlayer;
            currPlayer = currPlayer.enemy;
            currPlayer.enemyTurn(location);
            return true;
        }
        return false;
    }

    class Player extends Thread {
        char playerMark;
        Player enemy;
        Socket sock;
        BufferedReader in;
        PrintWriter out;

        Player(Socket sock, char playerMark) {
            this.sock = sock;
            this.playerMark = playerMark;
            try {
                in = new BufferedReader(
                        new InputStreamReader(sock.getInputStream()));
                out = new PrintWriter(sock.getOutputStream(), true);
                out.println("WELCOME " + playerMark);
                out.println("MSG Waiting for enemy to connect");
            } catch (IOException e) {
                System.out.println("Player died: " + e);
            }
        }

        void setEnemy(Player enemy) { this.enemy = enemy; }

        void enemyTurn(int location) {
            out.println("ENEMY_TURNED " + location);
            out.println(checkPattern() ? "LOSE" : fillBoard() ? "TIE" : "");
        }

        public void run() {
            try {
                out.println("MSG Ready to play");

                if (playerMark == 'X') {
                    out.println("MSG Your move");
                }

                while (true) {
                    String cmd = in.readLine();

                    if (cmd.startsWith("TURN")) {
                        if (checkMove(Integer.parseInt(cmd.substring(cmd.length() - 1)), this)) {
                            out.println("VAL_TURN");
                            out.println(checkPattern() ? "WIN" : fillBoard() ? "TIE" : "");
                        } else {
                            out.println("MSG ?");
                        }
                    } else if (cmd.startsWith("QUIT")) {
                        return;
                    }
                }
            } catch (IOException e) {
                System.out.println("Player died: " + e);
            } finally {
                try {
                    sock.close();
                } catch (IOException ignored) {}
            }
        }
    }
}
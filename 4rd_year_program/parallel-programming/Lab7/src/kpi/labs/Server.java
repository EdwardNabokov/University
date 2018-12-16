package kpi.labs;

import java.net.ServerSocket;

public class Server {
    public static void main(String[] args) throws Exception {
        ServerSocket listener = new ServerSocket(8901);
        System.out.println("Listening on " + listener.getInetAddress() + " " + listener.getLocalPort());

        try (listener) {
            while (true) {
                Game game = new Game();
                Game.Player playerX = game.new Player(listener.accept(), 'X');
                Game.Player playerO = game.new Player(listener.accept(), 'O');
                playerX.setEnemy(playerO);
                playerO.setEnemy(playerX);
                game.currPlayer = playerX;
                playerX.start();
                playerO.start();
            }
        }
    }
}

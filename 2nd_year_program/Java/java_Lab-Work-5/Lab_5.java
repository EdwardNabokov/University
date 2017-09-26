public class Lab_5 {
    public static void main(String []args){
        // C17 -> 10
        BankAlpha A = new BankAlpha();
        BankTempoo T = new BankTempoo();
        BankUkrSoc U = new BankUkrSoc();

        Client Mark = new Client("Mark", 100);
        Client Sarah = new Client("Sarah", 400);
        Client Helen = new Client("Helen", 1200);
        Client Brad = new Client("Brad", 20);
        Client Matt = new Client("Matt", 50);

        T.addClient(Mark);
        A.addClient(Sarah);
        A.addClient(Helen);
        U.addClient(Brad);
        U.addClient(Matt);
        System.out.println("***Before payout***");
        Mark.print();
        Sarah.print();
        Helen.print();
        Brad.print();
        Matt.print();

        System.out.println("***After payout***");
        Mark.payout(150);
        Sarah.payout(340);
        Helen.payout(12);
        Brad.payout(70);
        Matt.payout(12);

        Mark.print();
        Sarah.print();
        Helen.print();
        Brad.print();
        Matt.print();

    }
}

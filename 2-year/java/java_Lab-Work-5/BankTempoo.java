public class BankTempoo extends Bank {
    protected Client[] clients = new Client[4];
    public double time = 1.1;
    int i = 0;

    public BankTempoo(){
        super("Tempoo", 3.1);
    }

    void addClient(Client client){
        if(i == 4){
            System.out.printf("Unfortunately, we are not able to give you out the credit, %s.\n", client.myName);
            return;
        }
        clients[i] = client;
        client.myCredit += client.wantMoney * interest_rate * time;
        client.nameBank = "Tempoo";
        client.rate = interest_rate;
        i++;
    }
}

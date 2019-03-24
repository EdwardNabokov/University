public class BankUkrSoc extends Bank{
    protected Client[] clients = new Client[2];
    public double time = 1.5;
    int i = 0;

    public BankUkrSoc(){
        super("UkrSoc", 4);
    }

    void addClient(Client client){
        if(i == 2){
            System.out.printf("Unfortunately, we are not able to give you out the credit, %s.\n", client.myName);
            return;
        }
        clients[i] = client;
        client.myCredit = client.wantMoney * interest_rate * time;
        client.nameBank = "UkrSoc";
        client.rate = interest_rate;
        i++;
    }
}

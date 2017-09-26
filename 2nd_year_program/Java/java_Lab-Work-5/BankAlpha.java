/**
 * Created by Edward on 5/23/2017
 */
public class BankAlpha extends Bank {
    protected Client[] clients = new Client[2];
    public double time = 0.9;
    int i = 0;

    public BankAlpha(){
        super("Alpha", 1.5);
    }

    void addClient(Client client){
        if(i == 2){
            System.out.printf("Unfortunately, we are not able to give you out the credit, %s.\n", client.myName);
            return;
        }
        clients[i] = client;
        client.myCredit = client.wantMoney * interest_rate * time;
        client.nameBank = "Alpha";
        client.rate = interest_rate;
        i++;
    }
}

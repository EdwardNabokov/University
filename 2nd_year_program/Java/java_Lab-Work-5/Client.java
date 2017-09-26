
/**
 * Created by Edward on 5/22/2017
 */
public class Client {
    public String myName;
    public double wantMoney = 0;
    public double myCredit = 0;
    public double payout = 0;
    public String nameBank;
    public double rate;

    public Client(String name, double money){
        myName = name;
        wantMoney = money;
    }

    void payout(double pay){
        myCredit -= pay;
        payout += pay;
    }


    void print(){
        System.out.printf("I'm %s. I use %s bank. Credit with %3.2f rate. And now credit %s\n", myName, nameBank, rate, myCredit);
    }

}

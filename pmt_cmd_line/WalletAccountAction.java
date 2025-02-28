package pmt_cmd_line;

//adding money
	//sending money
	//bill payment

class WalletAccountActions {
    private UserAccountDetails userAccount;
    
    public WalletAccountActions(UserAccountDetails userAccount) {
        this.userAccount = userAccount;
    }
    
    public void addMoney(double amount) {
        userAccount.setCurrentWalletBalance(userAccount.getCurrentWalletBalance() + amount);
        System.out.println("Money added successfully. Current Balance: " + userAccount.getCurrentWalletBalance());
    }
}
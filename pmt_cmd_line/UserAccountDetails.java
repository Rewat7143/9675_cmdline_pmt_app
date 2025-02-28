package pmt_cmd_line;

import java.util.Date;

	class UserAccountDetails {
		
		private int userAccountId;
	    private Date accountOpenDate;
	    private double currentWalletBalance;
	    private int linkedAccountsCount;
	    private String walletPin;
	    private UserDetails user;

		
	    public UserAccountDetails(int i, UserDetails userDetails, double d, String string) {
			// TODO Auto-generated constructor stub
		}
		public int getUserAccountId() {
			return userAccountId;
		}
		public void setUserAccountId(int userAccountId) {
			this.userAccountId = userAccountId;
		}
		public Date getAccountOpenDate() {
			return accountOpenDate;
		}
		public void setAccountOpenDate(Date accountOpenDate) {
			this.accountOpenDate = accountOpenDate;
		}
		public double getCurrentWalletBalance() {
			return currentWalletBalance;
		}
		public void setCurrentWalletBalance(double currentWalletBalance) {
			this.currentWalletBalance = currentWalletBalance;
		}
		public int getLinkedAccountsCount() {
			return linkedAccountsCount;
		}
		public void setLinkedAccountsCount(int linkedAccountsCount) {
			this.linkedAccountsCount = linkedAccountsCount;
		}
		public String getWalletPin() {
			return walletPin;
		}
		public void setWalletPin(String walletPin) {
			this.walletPin = walletPin;
		}
		public UserDetails getUser() {
			return user;
		}
		public void setUser(UserDetails user) {
			this.user = user;
		}
	
	  
	    
	}
	


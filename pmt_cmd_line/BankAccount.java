package pmt_cmd_line;

class BankAccount {
	
	private int bankAccountId;
    private UserDetails user;
    private String accountNumber;
    private String ifscCode;
    private String bankName;
    private String bankAccountBranchLocation;
    private boolean isActive;

	
    public int getBankAccountId() {
		return bankAccountId;
	}
	public void setBankAccountId(int bankAccountId) {
		this.bankAccountId = bankAccountId;
	}
	public UserDetails getUser() {
		return user;
	}
	public void setUser(UserDetails user) {
		this.user = user;
	}
	public String getAccountNumber() {
		return accountNumber;
	}
	public void setAccountNumber(String accountNumber) {
		this.accountNumber = accountNumber;
	}
	public String getIfscCode() {
		return ifscCode;
	}
	public void setIfscCode(String ifscCode) {
		this.ifscCode = ifscCode;
	}
	public String getBankName() {
		return bankName;
	}
	public void setBankName(String bankName) {
		this.bankName = bankName;
	}
	public String getBankAccountBranchLocation() {
		return bankAccountBranchLocation;
	}
	public void setBankAccountBranchLocation(String bankAccountBranchLocation) {
		this.bankAccountBranchLocation = bankAccountBranchLocation;
	}
	public boolean isActive() {
		return isActive;
	}
	public void setActive(boolean isActive) {
		this.isActive = isActive;
	}
	
}

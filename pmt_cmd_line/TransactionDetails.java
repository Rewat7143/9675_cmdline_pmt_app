package pmt_cmd_line;

import java.util.Date;

class TransactionDetails {
	
	private Date txnDateTime;
    private int sourceId;
    private int targetId;
    private double txnAmount;
	
    private int txnId;
    public int getTxnId() {
		return txnId;
	}
	public void setTxnId(int txnId) {
		this.txnId = txnId;
	}
	public Date getTxnDateTime() {
		return txnDateTime;
	}
	public void setTxnDateTime(Date txnDateTime) {
		this.txnDateTime = txnDateTime;
	}
	public int getSourceId() {
		return sourceId;
	}
	public void setSourceId(int sourceId) {
		this.sourceId = sourceId;
	}
	public int getTargetId() {
		return targetId;
	}
	public void setTargetId(int targetId) {
		this.targetId = targetId;
	}
	public double getTxnAmount() {
		return txnAmount;
	}
	public void setTxnAmount(double txnAmount) {
		this.txnAmount = txnAmount;
	}
	
}

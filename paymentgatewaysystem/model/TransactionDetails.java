package org.paymentgatewaysystem.model;
import java.time.LocalDateTime;
import java.util.Date;
public class TransactionDetails {
	
	private int transactionId;
	private LocalDateTime transactionDateAndTime;
	private int sourseId;
	private int sourceTypeId;
	private int destinationTypeId;
	
	
	public int getTransactionId() {
		return transactionId;
	}


	public void setTransactionId(int transactionId) {
		this.transactionId = transactionId;
	}


	public LocalDateTime getTransactionDateAndTime() {
		return transactionDateAndTime;
	}


	public void setTransactionDateAndTime(LocalDateTime transactionDateAndTime) {
		this.transactionDateAndTime = transactionDateAndTime;
	}


	public int getSourseId() {
		return sourseId;
	}


	public void setSourseId(int sourseId) {
		this.sourseId = sourseId;
	}


	public int getSourceTypeId() {
		return sourceTypeId;
	}


	public void setSourceTypeId(int sourceTypeId) {
		this.sourceTypeId = sourceTypeId;
	}


	public int getDestinationTypeId() {
		return destinationTypeId;
	}


	public void setDestinationTypeId(int destinationTypeId) {
		this.destinationTypeId = destinationTypeId;
	}


	public static void main(String[] args) {
		// TODO Auto-generated method stub
	}
}
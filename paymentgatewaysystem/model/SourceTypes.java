package org.paymentgatewaysystem.model;

public class SourceTypes {
	
	private int sourceId;
	private String sourceTypeCode;
	private String SourceTypeDestination;
	
	
	public int getSourceId() {
		return sourceId;
	}


	public void setSourceId(int sourceId) {
		this.sourceId = sourceId;
	}


	public String getSourceTypeCode() {
		return sourceTypeCode;
	}


	public void setSourceTypeCode(String sourceTypeCode) {
		this.sourceTypeCode = sourceTypeCode;
	}


	public String getSourceTypeDestination() {
		return SourceTypeDestination;
	}


	public void setSourceTypeDestination(String sourceTypeDestination) {
		SourceTypeDestination = sourceTypeDestination;
	}


	public static void main(String[] args) {
		// TODO Auto-generated method stub
	}
}


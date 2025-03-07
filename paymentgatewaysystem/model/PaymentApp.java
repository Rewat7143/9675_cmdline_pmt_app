package org.paymentgatewaysystem.model;

import org.paymentgatewaysystem.data.AppData;

public class PaymentApp {
	
	public static UserDetails getUser(String userName,String password) {
		UserDetails user = new UserDetails();
		user.setUserName(userName);
		user.setPassword(password);
		return user;
	}
	
	public static void main(String[] args) {
		// TODO Auto-generated method stub
		AppData.initusers();
	}

}

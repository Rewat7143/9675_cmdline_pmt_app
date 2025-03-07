package org.paymentgatewaysystem.data;

import java.util.ArrayList;
import java.util.List;

import org.paymentgatewaysystem.model.UserDetails;

public class AppData {
	
	public static List<UserDetails> usersList = new ArrayList<>();
	public static List<UserDetails> initusers(){
		usersList =new ArrayList<UserDetails>();
		return null;
	} 
	

	public static List<UserDetails> getUsersList() {
		return usersList;
	}

	public static void setUsersList(List<UserDetails> usersList) {
		AppData.usersList = usersList;
	}

	public static void main(String[] args) {
		// TODO Auto-generated method stub

	}

}

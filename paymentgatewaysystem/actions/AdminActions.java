package org.paymentgatewaysystem.actions;

import org.paymentgatewaysystem .model.UserDetails;

import java.util.Scanner;

import org.paymentgatewaysystem.actioninterfaces.AdminActionsInter;
import org.paymentgatewaysystem.data.AppData;

public class AdminActions implements AdminActionsInter {
	

    private static final String ADMIN_ID = "admin";
    private static final String ADMIN_PASSWORD = "123";


    @Override
    public boolean verifyAdmin(String adminId, String password) {
        return ADMIN_ID.equals(adminId) && ADMIN_PASSWORD.equals(password);
    }
    
    public boolean adminLogin(Scanner sc) {
        System.out.println("Enter Admin ID: ");
        String adminId = sc.nextLine();

        System.out.println("Enter Admin Password: ");
        String password = sc.nextLine();

        return verifyAdmin(adminId, password); 
    }
	@Override
	public void displayUsers() {
	    if (AppData.getUsersList().isEmpty()) {
	        System.out.println("No registered users");
	    } else {
	        System.out.println("Admin View of User Details:");
	        for (UserDetails user : AppData.getUsersList()) {
	            System.out.println("Name: " + user.getUserName() + ", First Name: " + user.getFirstName() + 
	                               ", Last Name: " + user.getLastName() +", Phone Number: " + user.getPhoneNumber() + 
	                               ", Email: " + user.getEmail() + ", Address: " + user.getAddress());
	        }
	    }
	}

}

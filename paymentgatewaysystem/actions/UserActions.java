package org.paymentgatewaysystem.actions;

import java.util.Scanner;

import org.paymentgatewaysystem.actioninterfaces.UserActionsInter;
import org.paymentgatewaysystem.data.AppData;
import org.paymentgatewaysystem.model.UserDetails;

public class UserActions implements UserActionsInter {
	
	public void registerUser(UserDetails user) {
		AppData.usersList.add(user);
		System.out.println("registration sucessfull");
	}
	
	
	
	public void registerUserFromInput() {
        Scanner scanner = new Scanner(System.in);
        UserDetails user = new UserDetails();
        
        System.out.println("Enter Username: ");
        user.setUserName(scanner.nextLine());

        System.out.println("Enter Password: ");
        user.setPassword(scanner.nextLine());

        System.out.println("Enter First Name: ");
        user.setFirstName(scanner.nextLine());

        System.out.println("Enter Last Name: ");
        user.setLastName(scanner.nextLine());

        System.out.println("Enter Phone Number: ");
        user.setPhoneNumber(scanner.nextLine());

        System.out.println("Enter Email: ");
        user.setEmail(scanner.nextLine());

        System.out.println("Enter Address: ");
        user.setAddress(scanner.nextLine());
 
        registerUser(user);
        
    }
	public static void main(String[] args) {
		
	}
	
	@Override
    public UserDetails verifyUser(String userName, String password) {
        for (UserDetails user : AppData.usersList) {
            if (user.getUserName().equals(userName) && user.getPassword().equals(password)) {
                return user; 
            }
        }
        return null; 
    }

	public UserDetails loginUserFromInput() {
	    Scanner scanner = new Scanner(System.in);

	    System.out.println("Enter Username: ");
	    String userName = scanner.nextLine();

	    System.out.println("Enter Password: ");
	    String password = scanner.nextLine();

	    UserDetails user = verifyUser(userName, password); 
	    if (user != null) {
	        System.out.println("Login successful!");
	        return user; 
	    } else {
	        System.out.println("Wrong username or password.");
	        return null;
	    }
	}

    public void printAllDetails(UserDetails user) {
        System.out.println("-----USER DETAILS-----");
        System.out.println("Username: " + user.getUserName());
        System.out.println("First Name: " + user.getFirstName());
        System.out.println("Last Name: " + user.getLastName());
        System.out.println("Phone Number: " + user.getPhoneNumber());
        System.out.println("Email: " + user.getEmail());
        System.out.println("Address: " + user.getAddress());
    }

    public void editDetails(Scanner scanner, UserDetails user) {
        System.out.println("-----EDIT DETAILS-----");
        System.out.println("Enter First Name: ");
        user.setFirstName(scanner.nextLine());

        System.out.println("Enter Last Name: ");
        user.setLastName(scanner.nextLine());

        System.out.println("Enter Phone Number: ");
        user.setPhoneNumber(scanner.nextLine());

        System.out.println("Enter Email: ");
        user.setEmail(scanner.nextLine());

        System.out.println("Enter Address: ");
        user.setAddress(scanner.nextLine());

        System.out.println("Details updated successfully!");
    }

}

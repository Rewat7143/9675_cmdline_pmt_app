package org.paymentgatewaysystem.main;

import org.paymentgatewaysystem.actioninterfaces.AdminActionsInter;
import org.paymentgatewaysystem.actioninterfaces.UserActionsInter;
import org.paymentgatewaysystem.actions.AdminActions;
import org.paymentgatewaysystem.actions.UserActions;
import org.paymentgatewaysystem.model.UserDetails;

import java.util.Scanner;

public class AppMain {
	
	public static void displayMenu() {  
		System.out.println("-----MENU-----");
		System.out.println("1.User Registration \n2.User Login \n3.Admin Login \n4.Exit");
		System.out.println("Enter your choice");
		
	}
	
	public static void menu(Scanner sc,UserActionsInter userActions,AdminActionsInter adminActions) {
		int choice =sc.nextInt();
		sc.nextLine();
		switch (choice){
		case 1:{
			userActions.registerUserFromInput();
			break;
		}
		case 2:{
			UserDetails user = ((UserActions) userActions).loginUserFromInput();
			  if (user != null) {
                  loggedInUserMenu(sc, user, (UserActions) userActions); 
              }
			 break;
		}
		case 3:{
		    if (adminActions.adminLogin(sc)) {
                adminActions.displayUsers(); 
            } else {
                System.out.println("Invalid admin ID or password.");
            }
            break;
        }
		case 4:{
            System.out.println("Exited");
            System.exit(0);
		}
		default :{
			System.out.println("Invalid choice");
		}
		}
	}
	
	public static void loggedInUserMenu(Scanner scanner, UserDetails user, UserActions userActions) {
        while (true) {
            System.out.println("-----LOGGED-IN USER MENU-----");
            System.out.println("1. Print All Details \n2. Edit Details \n3. Logout");
            System.out.println("Enter your choice:");

            int choice = scanner.nextInt();
            scanner.nextLine();

            switch (choice) {
                case 1: {
                    userActions.printAllDetails(user);
                    break;
                }
                case 2: {
                    userActions.editDetails(scanner, user);
                    break;
                }
                case 3: {
                    System.out.println("Logged out");
                    return; 
                }
                default: {
                    System.out.println("Invalid choice");
                }
            }
        }
    }
	public static void main(String[] args) {
		// TODO Auto-generated method stub
		Scanner sc = new Scanner(System.in);
		
		UserActionsInter userActions = new UserActions();
		AdminActionsInter adminActions = new AdminActions();
		
		
		while(true) {
			displayMenu();
			menu(sc,userActions,adminActions);
		}
 
	}

}

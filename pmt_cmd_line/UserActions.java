package pmt_cmd_line;

import java.util.ArrayList;
import java.util.List;
import java.util.Scanner;

// user login ( function)
	//user register ( function)
	// take data from user( function)
	
class UserActions {
    private List<UserDetails> users = new ArrayList<>();
    
    public void registerUser(Scanner scanner) {
        System.out.println("Enter User ID: ");
        int userId = scanner.nextInt();
        scanner.nextLine(); 
        System.out.println("Enter Username: ");
        String username = scanner.nextLine();
        System.out.println("Enter Password: ");
        String password = scanner.nextLine();
        System.out.println("Enter First Name: ");
        String firstName = scanner.nextLine();
        System.out.println("Enter Last Name: ");
        String lastName = scanner.nextLine();
        System.out.println("Enter Phone Number: ");
        String phoneNumber = scanner.nextLine();
        System.out.println("Enter Email: ");
        String email = scanner.nextLine();
        System.out.println("Enter Address: ");
        String address = scanner.nextLine();
        
        users.add(new UserDetails(userId, username, password, firstName, lastName, phoneNumber, email, address));
        System.out.println("User registered successfully.");
    }

	public void loginUser() {
		// TODO Auto-generated method stub
		
	}
}
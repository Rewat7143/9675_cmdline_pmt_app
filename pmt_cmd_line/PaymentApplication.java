package pmt_cmd_line;
import java.util.*;

public class PaymentApplication {
    public static void main(String[] args) {
        Scanner scanner = new Scanner(System.in);
        UserActions userActions = new UserActions();
        WalletAccountActions wallet = new WalletAccountActions(new UserAccountDetails(1, new UserDetails(1, "testUser", "password", "Test", "User", "1234567890", "test@example.com", "Address"), 100.0, "1234"));
        MenuDisplay menu = new MenuDisplay();
        
        while (true) {
            menu.displayMenu();
            int choice = scanner.nextInt();
            scanner.nextLine(); 
            
            switch (choice) {
                case 1:
                    userActions.registerUser(scanner);
                    break;s
                case 3:
                    System.out.println("Enter amount to add: ");
                    double amount = scanner.nextDouble();
                    wallet.addMoney(amount);
                    break;
                case 4:
                    System.out.println("Exiting application.");
                    scanner.close();
                    return;
                default:
                    System.out.println("Invalid choice. Try again.");
            }
        }
    }
}

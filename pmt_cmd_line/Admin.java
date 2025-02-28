package pmt_cmd_line;
import java.util.*;
class Admin {
    private List<UserDetails> users = new ArrayList<>();

    public void manageUserData() {
        System.out.println("Admin managing user data...");
    }
    
    public void addUser(UserDetails user) {
        users.add(user);
        System.out.println("User added successfully.");
    }
}
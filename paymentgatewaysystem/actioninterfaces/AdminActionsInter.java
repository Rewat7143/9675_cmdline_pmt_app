package org.paymentgatewaysystem.actioninterfaces;

import java.util.Scanner;

public interface AdminActionsInter {
	
	void displayUsers();
	boolean verifyAdmin(String adminId, String password);
	boolean adminLogin(Scanner sc);
   
}

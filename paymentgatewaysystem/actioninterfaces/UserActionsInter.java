package org.paymentgatewaysystem.actioninterfaces;

import org.paymentgatewaysystem.model.UserDetails;

public interface UserActionsInter {
    void registerUser(UserDetails user);
    void registerUserFromInput();
	UserDetails verifyUser(String userName, String password);
}
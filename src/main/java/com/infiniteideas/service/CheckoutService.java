package com.infiniteideas.service;

import com.infiniteideas.model.Funding;
import com.infiniteideas.model.ShoppingCartItem;

import java.util.List;
import java.util.Map;

public interface CheckoutService {
    void makeTransactions(Map<String, ShoppingCartItem> itemMap, String userName, UserService userService);

    List<Funding> save(List<Funding> fundingList);
}

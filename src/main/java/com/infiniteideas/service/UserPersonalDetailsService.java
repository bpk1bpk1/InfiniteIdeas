package com.infiniteideas.service;

import com.infiniteideas.model.UserPersonalDetails;

import java.util.Hashtable;

public interface UserPersonalDetailsService {

    Hashtable<String, String> getCustomerLocations();

    String save(UserPersonalDetails details, String name);

    Hashtable<String,String> getUsersNearMe(String name);
}

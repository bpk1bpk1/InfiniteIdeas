package com.infiniteideas.service;

import com.infiniteideas.model.UserPersonalDetails;

import java.util.Hashtable;
import java.util.List;

public interface UserPersonalDetailsService {

    List<UserPersonalDetails> findAll();

    Hashtable<String, String> getCustomerLocations();
}

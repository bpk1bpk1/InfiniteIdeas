package com.infiniteideas.service;

import com.infiniteideas.model.ContactForm;
import com.infiniteideas.model.User;

import java.util.Hashtable;

public interface UserService {
    void save(User user);

    User findByUsername(String username);

    Hashtable<String,Integer> getSignUps();

    void sendMail(ContactForm contactForm);
}

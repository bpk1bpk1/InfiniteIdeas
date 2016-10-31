package com.infiniteideas.service;

import com.infiniteideas.model.User;

public interface UserService {
    void save(User user);

    User findByUsername(String username);
}

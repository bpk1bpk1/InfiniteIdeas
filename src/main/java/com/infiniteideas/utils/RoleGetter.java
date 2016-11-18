package com.infiniteideas.utils;


import com.infiniteideas.model.Role;
import com.infiniteideas.service.UserService;

import java.util.Set;

public class RoleGetter {
    public String getRoles(UserService userService, String name){
        Set<Role> roles = userService.findByUsername(name).getRoles();
        String role = "";
        for (Role r : roles) {
            role = r.getName().toLowerCase();
        }
        return role;
    }
}

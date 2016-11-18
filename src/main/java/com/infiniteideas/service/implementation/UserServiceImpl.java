package com.infiniteideas.service.implementation;

import com.infiniteideas.model.Role;
import com.infiniteideas.model.User;
import com.infiniteideas.repository.RoleRepository;
import com.infiniteideas.repository.UserRepository;
import com.infiniteideas.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

import java.util.HashSet;
import java.util.List;

@Service
public class UserServiceImpl implements UserService {
    private final UserRepository userRepository;
    private final RoleRepository roleRepository;
    private final BCryptPasswordEncoder bCryptPasswordEncoder;

    @Autowired
    public UserServiceImpl(UserRepository userRepository, BCryptPasswordEncoder bCryptPasswordEncoder,
                           RoleRepository roleRepository) {
        this.userRepository = userRepository;
        this.bCryptPasswordEncoder = bCryptPasswordEncoder;
        this.roleRepository = roleRepository;
    }

    @Override
    public void save(User user) {
        user.setPassword(bCryptPasswordEncoder.encode(user.getPassword()));
        saveUserRole(user);
        userRepository.save(user);
    }

    private void saveUserRole(User user) {
        HashSet<Role> selectedRole = new HashSet<>();
        List<Role> roles = roleRepository.findAll();
        roles.forEach(s -> {
            if (s.getName().equals(user.getSelectedRole()))
                selectedRole.add(s);
        });
        user.setRoles(selectedRole);
    }

    @Override
    public User findByUsername(String username) {
        return userRepository.findByUsername(username);
    }
}

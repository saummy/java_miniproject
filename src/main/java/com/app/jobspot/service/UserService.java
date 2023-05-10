package com.app.jobspot.service;

import com.app.jobspot.dto.UserDto;
import com.app.jobspot.entity.User;
import com.app.jobspot.enums.RoleEnum;
import com.app.jobspot.repository.RoleRepository;
import com.app.jobspot.repository.UserRepository;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;

@Service
public class UserService {

    private UserRepository userRepository;

    private RoleRepository roleRepository;
    private PasswordEncoder passwordEncoder;

    private Logger log = LoggerFactory.getLogger(UserService.class);


    public UserService(UserRepository userRepository, RoleRepository roleRepository, PasswordEncoder passwordEncoder) {
        this.userRepository = userRepository;
        this.roleRepository = roleRepository;
        this.passwordEncoder = passwordEncoder;
    }

    public void saveUser(UserDto userDto, RoleEnum role) {
        User user = new User();
        user.setName(userDto.getName());
        user.setEmail(userDto.getEmail());
        user.setPassword(passwordEncoder.encode(userDto.getPassword()));
        user.setRole(roleRepository.findByName(role.name()));
        userRepository.save(user);
    }

    public User findByEmail(String email) {
        return userRepository.findByEmail(email);
    }

}

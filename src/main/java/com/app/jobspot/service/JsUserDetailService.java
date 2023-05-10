package com.app.jobspot.service;

import com.app.jobspot.entity.Role;
import com.app.jobspot.entity.User;
import com.app.jobspot.repository.UserRepository;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;

import java.util.Collection;
import java.util.Collections;

@Service
public class JsUserDetailService implements UserDetailsService {

    private UserRepository userRepository;

    public JsUserDetailService(UserRepository userRepository) {
        this.userRepository = userRepository;
    }

    @Override
    public UserDetails loadUserByUsername(String email) throws UsernameNotFoundException {
        User user = userRepository.findByEmail(email);

        if (user != null) {
            return new org.springframework.security.core.userdetails.User(user.getEmail(),
                user.getPassword(),
                mapRoleToAuthority(user.getRole())
            );
        }else{
            throw new UsernameNotFoundException("Invalid username or password.");
        }
    }

    private Collection<? extends GrantedAuthority> mapRoleToAuthority(Role role) {
        return Collections.singleton(new SimpleGrantedAuthority(role.getName()));
    }
}

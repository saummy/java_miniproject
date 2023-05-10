package com.app.jobspot.config;

//import com.app.jobspot.components.AuthFilter;
import com.app.jobspot.components.AuthSuccessHandler;
import com.app.jobspot.enums.RoleEnum;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.annotation.Role;
import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.security.web.SecurityFilterChain;
import org.springframework.security.web.authentication.UsernamePasswordAuthenticationFilter;
import org.springframework.security.web.util.matcher.AntPathRequestMatcher;

@Configuration
@EnableWebSecurity
public class SecurityConfiguration {

    @Autowired
    private UserDetailsService userDetailsService;

    @Autowired
    private AuthSuccessHandler authSuccessHandler;

//    @Autowired
//    private AuthFilter authFilter;

    @Bean
    public static PasswordEncoder passwordEncoder(){
        return new BCryptPasswordEncoder();
    }

    @Bean
    public SecurityFilterChain filterChain(HttpSecurity http) throws Exception {
        http
                .authorizeHttpRequests((authorize) ->
                    authorize.requestMatchers("/").permitAll()
                        .requestMatchers("/css/**").permitAll()
                        .requestMatchers("/js/**").permitAll()
                        .requestMatchers("/assets/**").permitAll()
                        .requestMatchers("/auth/**").permitAll()
                        .requestMatchers("/search/**").permitAll()
                        .requestMatchers("/job/**").permitAll()
                        .requestMatchers("/admin/**").hasAuthority(RoleEnum.ADMIN.name())
                        .requestMatchers("/company/**").hasAuthority(RoleEnum.COMPANY.name())
                            .requestMatchers("/candidate/**").permitAll()
//                            .requestMatchers("/candidate/**").hasAuthority(RoleEnum.CANDIDATE.name())
                        .anyRequest().authenticated()

                ).formLogin((form) ->
                    form.loginPage("/auth/login").successHandler(authSuccessHandler).permitAll()
                ).logout(logout -> logout
                    .logoutRequestMatcher(new AntPathRequestMatcher("/logout"))
                    .permitAll());

        return http.build();
    }

    @Autowired
    public void configureGlobal(AuthenticationManagerBuilder auth) throws Exception {
        auth
            .userDetailsService(userDetailsService)
            .passwordEncoder(passwordEncoder());
    }
}

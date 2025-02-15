package com.tarefas.web.config;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.security.web.SecurityFilterChain;

@Configuration
@EnableWebSecurity
public class WebSecurityConfig {
    
    @Bean
    public SecurityFilterChain filterChain(HttpSecurity http) throws Exception {
        http
            .authorizeHttpRequests(authorizeRequestsCustomizer -> authorizeRequestsCustomizer
                .requestMatchers("/img/**", "/js/**", "/css/**").permitAll()
                .requestMatchers("/usuario/login", "/usuario/cadastrar").permitAll()
                .requestMatchers("/usuario/listar").hasAuthority("ADMIN")
                .requestMatchers("/tarefa/**").hasAuthority("USER")
                .requestMatchers("/", "/home/**").permitAll()
                .anyRequest().authenticated())
            .formLogin(formLoginCustomizer -> formLoginCustomizer
                .loginPage("/usuario/login")
                .failureUrl("/usuario/login-error")
                .defaultSuccessUrl("/")
                .permitAll())
            .logout(logoutCustomizer -> logoutCustomizer.logoutSuccessUrl("/usuario/login")
                .deleteCookies("JSESSIONID"))
            .exceptionHandling(exceptionHandlingCustomizer -> exceptionHandlingCustomizer
                .accessDeniedPage("/usuario/acesso-negado"))
            .csrf(csrfCustomizer -> csrfCustomizer.disable());

        return http.build();
    }

    @Bean
    public PasswordEncoder encoder() {
        return new BCryptPasswordEncoder();
    }
}

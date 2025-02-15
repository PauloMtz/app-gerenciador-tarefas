package com.tarefas.web.config;

import org.springframework.security.core.userdetails.User;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;

import com.tarefas.domain.models.Usuario;
import com.tarefas.domain.repositories.UsuarioRepository;

import jakarta.transaction.Transactional;
import lombok.AllArgsConstructor;

@Service
@Transactional
@AllArgsConstructor
public class UserDetailsServiceImpl implements UserDetailsService {

    private final UsuarioRepository repository;

    @Override
    public UserDetails loadUserByUsername(String email) throws UsernameNotFoundException {
        
        Usuario user = repository.findByEmail(email);

        if (email == null) {
            throw new UsernameNotFoundException("Usuário não encontrado: " + email);
        }
    
        return new User(user.getUsername(), user.getPassword(), true, true, 
            true, true, user.getAuthorities());
    }
    
}

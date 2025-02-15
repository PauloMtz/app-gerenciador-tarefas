package com.tarefas.domain.repositories;

import org.springframework.data.jpa.repository.JpaRepository;

import com.tarefas.domain.models.Perfil;

public interface PerfilRepository extends JpaRepository<Perfil, Long> {
    
    Perfil findByPerfil(String perfil);
}

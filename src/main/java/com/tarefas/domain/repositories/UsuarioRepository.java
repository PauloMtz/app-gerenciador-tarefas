package com.tarefas.domain.repositories;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import com.tarefas.domain.models.Usuario;

public interface UsuarioRepository extends JpaRepository<Usuario, Long> {

    Usuario findByEmail(String email);

    // join fetch para resolver o problema N + 1
    @Query("FROM Usuario u JOIN FETCH u.perfis JOIN FETCH u.localidade")
    Page<Usuario> findAll(Pageable pageable);

    @Query("SELECT count(*) FROM Usuario")
    long countByUsuario();
}

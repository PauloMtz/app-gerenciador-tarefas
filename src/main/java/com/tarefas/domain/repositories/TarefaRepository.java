package com.tarefas.domain.repositories;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import com.tarefas.domain.models.Tarefa;

public interface TarefaRepository extends JpaRepository<Tarefa, Long> {

    @Query("FROM Tarefa t WHERE t.concluida = false")
    Page<Tarefa> listarNaoConcluidas(Pageable pageable);

    @Query("SELECT t FROM Tarefa t WHERE t.usuario.email = :emailUsuario")
	Page<Tarefa> carregarTarefasPorUsuario(@Param("emailUsuario") String email, Pageable pageable);
}

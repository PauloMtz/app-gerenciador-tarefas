package com.tarefas.domain.repositories;

import java.util.List;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import com.tarefas.domain.models.Tarefa;

public interface TarefaRepository extends JpaRepository<Tarefa, Long> {

    // o join fetch é para mitigar o problema N + 1
    @Query("FROM Tarefa t JOIN FETCH t.usuario u "
        + "JOIN FETCH u.perfis JOIN FETCH u.localidade WHERE t.concluida = false")
    Page<Tarefa> listarNaoConcluidas(Pageable pageable);

    @Query("SELECT t FROM Tarefa t WHERE t.usuario.email = :emailUsuario")
	Page<Tarefa> carregarTarefasPorUsuario(@Param("emailUsuario") String email, Pageable pageable);

    @Query("SELECT count(*) FROM Tarefa")
    long countByTarefa();

    @Query("SELECT FUNCTION('DATE_FORMAT', t.dataCriacao, '%m/%Y') AS mes, " +
            "COUNT(t) AS total FROM Tarefa t " + 
            "GROUP BY FUNCTION('DATE_FORMAT', t.dataCriacao, '%m/%Y') ORDER BY mes")
    List<Object[]> contarTarefasPorMes();
}

package com.tarefas.domain.repositories;

import org.springframework.data.jpa.repository.JpaRepository;

import com.tarefas.domain.models.Localidade;

public interface LocalidadeRepository extends JpaRepository<Localidade, Long> {
}

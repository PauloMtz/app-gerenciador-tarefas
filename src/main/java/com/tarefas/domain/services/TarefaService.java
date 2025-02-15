package com.tarefas.domain.services;

import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.stereotype.Service;

import com.tarefas.domain.models.Tarefa;
import com.tarefas.domain.repositories.TarefaRepository;

@Service
public class TarefaService {
    
    @Autowired
    private TarefaRepository repository;

    public void salvar(Tarefa tarefa) {
        repository.save(tarefa);
    }

    public Page<Tarefa> listaTarefasNaoConcluidas(int numPage) {
        int size = 5;
        Pageable pageable = PageRequest.of(numPage -1, size, Sort.by("dataCriacao"));
        return repository.listarNaoConcluidas(pageable);
    }

    public Page<Tarefa> listaComPaginacao(String email, int numPage) {
        int size = 1;
        Pageable pageable = PageRequest.of(numPage -1, size, Sort.by("dataCriacao"));
        return repository.carregarTarefasPorUsuario(email, pageable);
    }

    public void excluir(Long id) {
        try {
            var tarefa = buscarPorId(id);
            repository.delete(tarefa);
        } catch (Exception e) {
            throw new IllegalArgumentException("O registro não pode ser removido");
        }
    }

    public Tarefa buscarPorId(Long id) {
        Optional<Tarefa> tarefa = repository.findById(id);

        if (tarefa.isPresent()) {
            return tarefa.get();
        } else {
            return null;
        }
    }
}
